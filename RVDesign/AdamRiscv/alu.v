`include "./AdamRiscv/define.vh"

module alu(
    input  wire[3:0]     alu_ctrl,
    input  wire[31:0]    op_A,
    input  wire[31:0]    op_B,
    input  wire[127:0]   op_matrix,
    output reg[31:0]     alu_o,
    output reg[127:0]    matrix_o,
    output wire          br_mark     
);

assign br_mark = (alu_ctrl == `JUMP)? 1 :
                 (alu_ctrl == `NOTEQ || alu_ctrl == `SLT || alu_ctrl == `SLTU)?
                 (alu_o != 0) : (alu_o == 0);
 
always @(*) begin
    alu_o = 0;             // 默认值
    matrix_o = 0;          // 默认值
    case (alu_ctrl)
        `AND        : alu_o = op_A & op_B;           
        `OR         : alu_o = op_A | op_B;           
        `ADD,`JUMP  : alu_o = op_A + op_B;           
        `SUB,`NOTEQ : alu_o = op_A - op_B;           
        `XOR        : alu_o = op_A ^ op_B;           
        `SLT,`SGE   : alu_o = ($signed(op_A)) < ($signed(op_B)) ? 32'b1 : 32'b0;   
        `SLTU,`SGEU : alu_o = op_A < op_B ? 32'b1 : 32'b0;   
        `SLL        : alu_o = op_A << op_B[4:0];
        `SRL        : alu_o = op_A >> op_B[4:0];
        `SRA        : alu_o = ($signed(op_A)) >>> op_B[4:0];
        `MOPA       : begin
            integer i, j;
            for (i = 0; i < 4; i = i + 1) begin
                for (j = 0; j < 4; j = j + 1) begin
                    matrix_o[i*32+j*8+7 -: 8] = op_matrix[i*32+j*8+7 -: 8] + op_A[i*8+7 -: 8] * op_B[j*8+7 -: 8];
                end
            end
        end
        default: alu_o = 0;
    endcase
end


endmodule
