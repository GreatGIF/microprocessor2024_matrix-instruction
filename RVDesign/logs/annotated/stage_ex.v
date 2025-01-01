	// verilator_coverage annotation
	`include "./AdamRiscv/define.vh"
	
	module stage_ex(
 019812	    input  wire[31:0]  ex_pc,  //pc_now
 000098	    input  wire[4:0]   ex_rs2,
 000730	    input  wire[31:0]  ex_regs_data1,
 000558	    input  wire[31:0]  ex_regs_data2,
 506056	    input  wire[127:0] ex_matrix_data,
 000391	    input  wire[31:0]  ex_imm,
 000040	    input  wire[2:0]   ex_func3_code, 
%000008	    input  wire        ex_func7_code,
 019770	    input  wire[2:0]   ex_alu_op,
 000021	    input  wire[1:0]   ex_alu_src1,
 000016	    input  wire[1:0]   ex_alu_src2,
 006578	    input  wire        ex_br_addr_mode,
 006583	    input  wire        ex_br,
%000002	    input  wire        ex_mem_write,
	    //forwarding
 000032	    input  wire[1:0]   forwardA,
 000021	    input  wire[1:0]   forwardB,
%000008	    input  wire[1:0]   forwardM,
 000679	    input  wire[31:0]  me_alu_o,
 000491	    input  wire[31:0]  w_regs_data,
%000260	    input  wire[127:0] w_matrix_data,
%000267	    input  wire[127:0] me_matrix_o,
 000027	    input  wire[1:0]   me_w_select,
 000029	    input  wire[1:0]   wb_w_select,
 000081	    input  wire[4:0]   me_rd,
 000083	    input  wire[4:0]   wb_rd,
	
 000553	    output wire[31:0]  ex_regs_data2_st,
 000661	    output wire[31:0]  ex_alu_o,
%000124	    output wire[127:0] ex_matrix_o,
 020102	    output wire[31:0]  br_pc, //branch address
 006569	    output wire        br_ctrl
	);
	
 026326	wire [3:0]  alu_ctrl;
 000544	wire [31:0] op_A;
 000603	wire [31:0] op_A_pre;
 000518	wire [31:0] op_B;
 000547	wire [31:0] op_B_pre;
 506216	wire [127:0]op_M;
%000074	wire [127:0]op_M_pre;
%000004	wire        br_mark;
 019869	wire [31:0] br_addr_op_A; 
	
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
 000016	    if (|forwardA)
	        $display("forwardA! OP_A: %h",op_A);
%000008	    else if (|forwardB)
	        $display("forwardB! OP_B: %h",op_B);
%000004	    else if (|forwardM)
	        $display("forwardM! OP_M: %h",op_M);
	end
	
	endmodule
	
