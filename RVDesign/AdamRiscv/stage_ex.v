`include "./AdamRiscv/define.vh"

module stage_ex(
    input  wire[31:0]  ex_pc,  //pc_now
    input  wire[4:0]   ex_rs2,
    input  wire[31:0]  ex_regs_data1,
    input  wire[31:0]  ex_regs_data2,
    input  wire[127:0] ex_matrix_data,
    input  wire[31:0]  ex_imm,
    input  wire[2:0]   ex_func3_code, 
    input  wire        ex_func7_code,
    input  wire[2:0]   ex_alu_op,
    input  wire[1:0]   ex_alu_src1,
    input  wire[1:0]   ex_alu_src2,
    input  wire        ex_br_addr_mode,
    input  wire        ex_br,
    input  wire        ex_mem_write,
    //forwarding
    input  wire[1:0]   forwardA,
    input  wire[1:0]   forwardB,
    input  wire[1:0]   forwardM,
    input  wire[31:0]  me_alu_o,
    input  wire[31:0]  w_regs_data,
    input  wire[127:0] w_matrix_data,
    input  wire[127:0] me_matrix_o,
    input  wire[1:0]   me_w_select,
    input  wire[1:0]   wb_w_select,
    input  wire[4:0]   me_rd,
    input  wire[4:0]   wb_rd,

    output wire[31:0]  ex_regs_data2_st,
    output wire[31:0]  ex_alu_o,
    output wire[127:0] ex_matrix_o,
    output wire[31:0]  br_pc, //branch address
    output wire        br_ctrl
);

wire [3:0]  alu_ctrl;
wire [31:0] op_A;
wire [31:0] op_A_pre;
wire [31:0] op_B;
wire [31:0] op_B_pre;
wire [127:0]op_M;
wire        br_mark;
wire [31:0] br_addr_op_A; 

alu_control u_alu_control(
    .alu_op     (ex_alu_op     ),
    .func3_code (ex_func3_code ),
    .func7_code (ex_func7_code ),
    .alu_ctrl_r (alu_ctrl      )
);


alu u_alu(
    .alu_ctrl (alu_ctrl      ),
    .op_A     (op_A          ),
    .op_B     (op_B          ),
    .op_matrix(op_M          ),
    .alu_o    (ex_alu_o      ),
    .matrix_o (ex_matrix_o   ),
    .br_mark  (br_mark       )
);

assign br_addr_op_A = (ex_br_addr_mode == `J_REG) ? ex_regs_data1 : ex_pc;
assign br_pc        = br_addr_op_A + ex_imm;
assign op_B         = (ex_alu_src2 == `PC_PLUS4)? 32'd4 : (ex_alu_src2 == `IMM)? ex_imm : op_B_pre;
assign op_A         = (ex_alu_src1 == `NULL)? 32'd0 : (ex_alu_src1 == `PC)? ex_pc : op_A_pre;
// assign op_M         = (forwardM == `EX_MEM_M)? (me_w_select == 2'b11 ? me_matrix_o : ) : ((forwardM == `MEM_WB_M)? w_matrix_data : ex_matrix_data);

assign op_M[31:0]   = (forwardM == `EX_MEM_M) ? (me_w_select == 2'b10 ? (me_rd == 5'd0 ? me_alu_o : ex_matrix_data[31:0]) : me_matrix_o[31:0]) :
                                                ((forwardM == `MEM_WB_M) ? ((wb_w_select == 2'b10 && wb_rd == 5'd0) ? w_regs_data : w_matrix_data[31:0]) : ex_matrix_data[31:0]);
assign op_M[63:32]  = (forwardM == `EX_MEM_M) ? (me_w_select == 2'b10 ? (me_rd == 5'd1 ? me_alu_o : ex_matrix_data[63:32]) : me_matrix_o[63:32]) :
                                                ((forwardM == `MEM_WB_M) ? ((wb_w_select == 2'b10 && wb_rd == 5'd1) ? w_regs_data : w_matrix_data[63:32]) : ex_matrix_data[63:32]);
assign op_M[95:64]  = (forwardM == `EX_MEM_M) ? (me_w_select == 2'b10 ? (me_rd == 5'd2 ? me_alu_o : ex_matrix_data[95:64]) : me_matrix_o[95:64]) :
                                                ((forwardM == `MEM_WB_M) ? ((wb_w_select == 2'b10 && wb_rd == 5'd2) ? w_regs_data : w_matrix_data[95:64]) : ex_matrix_data[95:64]);
assign op_M[127:96] = (forwardM == `EX_MEM_M) ? (me_w_select == 2'b10 ? (me_rd == 5'd3 ? me_alu_o : ex_matrix_data[127:96]) : me_matrix_o[127:96]) :
                                                ((forwardM == `MEM_WB_M) ? ((wb_w_select == 2'b10 && wb_rd == 5'd3) ? w_regs_data : w_matrix_data[127:96]) : ex_matrix_data[127:96]);

// assign op_B_pre     = (forwardB == `EX_MEM_B)? me_alu_o : (forwardB == `MEM_WB_B)? w_regs_data : ex_regs_data2;
assign op_A_pre     = (forwardA == `EX_MEM_A)? me_alu_o : (forwardA == `MEM_WB_A)? w_regs_data : ex_regs_data1;
assign op_B_pre     = (forwardB == `EX_MEM_B) ? ((me_w_select == 2'b11) ? me_matrix_o[(32 * ex_rs2) + 31 -: 32] : me_alu_o) :
                                                (forwardB == `MEM_WB_B) ? ((wb_w_select == 2'b11) ? w_matrix_data[(32 * ex_rs2) + 31 -: 32] : w_regs_data) : ex_regs_data2;    

assign ex_regs_data2_st = (ex_alu_src2 == `IMM && ex_mem_write) ? op_B_pre : ex_regs_data2;

assign br_ctrl      = br_mark && ex_br;

always @(*) begin
    if (|forwardA)
        $display("forwardA! OP_A: %h",op_A);
    else if (|forwardB)
        $display("forwardB! OP_B: %h",op_B);
    else if (|forwardM)
        $display("forwardM! OP_M: %h",op_M);
end

endmodule
