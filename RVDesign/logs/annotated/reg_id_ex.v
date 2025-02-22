	// verilator_coverage annotation
	module reg_id_ex(
 020000	    input  wire clk,
%000001	    input  wire rst,
 026390	    input  wire[31:0] id_pc,
 105789	    input  wire[31:0] id_regs_data1,
 112174	    input  wire[31:0] id_regs_data2,
%000240	    input  wire[127:0]id_matrix_data,
 000378	    input  wire[31:0] id_imm,
 019743	    input  wire[2:0]  id_func3_code, 
 006574	    input  wire       id_func7_code,
 013216	    input  wire[4:0]  id_rd,
 006584	    input  wire       id_br,
 000013	    input  wire       id_mem_read,
 000013	    input  wire       id_mem2reg,
 013202	    input  wire[2:0]  id_alu_op,
%000003	    input  wire       id_mem_write,
 000018	    input  wire[1:0]  id_alu_src1,
 000016	    input  wire[1:0]  id_alu_src2,
%000009	    input  wire       id_br_addr_mode,
 000026	    input  wire[1:0]  id_w_select,
 000019	    input  wire       id_rs2_r_select,
	
 006570	    input  wire       id_ex_flush,
	
	    //forwarding
 019782	    input wire[4:0] id_rs1,
 026365	    input wire[4:0] id_rs2,
 000077	    output reg[4:0] ex_rs1,
 000099	    output reg[4:0] ex_rs2,
	
 019819	    output reg[31:0]  ex_pc,
 000715	    output reg[31:0]  ex_regs_data1,
 000546	    output reg[31:0]  ex_regs_data2,
 506045	    output reg[127:0] ex_matrix_data,
 000390	    output reg[31:0]  ex_imm,
 000041	    output reg[2:0]   ex_func3_code, 
%000007	    output reg        ex_func7_code,
 000082	    output reg[4:0]   ex_rd,
 006584	    output reg        ex_br,
 000014	    output reg        ex_mem_read,
 000012	    output reg        ex_mem2reg,
 019770	    output reg[2:0]   ex_alu_op,
%000002	    output reg        ex_mem_write,
 000020	    output reg[1:0]   ex_alu_src1,
 000017	    output reg[1:0]   ex_alu_src2,
 006577	    output reg        ex_br_addr_mode,
 000027	    output reg[1:0]   ex_w_select,
 006588	    output reg        ex_rs2_r_select
	);
	always @(posedge clk) begin
 003384	    if (!rst || id_ex_flush)begin
	        ex_rs1          <= 0;
	        ex_rs2          <= 0;
	        ex_pc           <= 0;
	        ex_regs_data1   <= 0;
	        ex_regs_data2   <= 0;
	        ex_imm          <= 0;
	        ex_func3_code   <= 0;
	        ex_func7_code   <= 0;
	        ex_rd           <= 0;
	        ex_br           <= 0;
	        ex_mem_read     <= 0;
	        ex_mem2reg      <= 0;
	        ex_alu_op       <= 0;
	        ex_mem_write    <= 0;
	        ex_alu_src1     <= 0;
	        ex_alu_src2     <= 0;
	        ex_br_addr_mode <= 0;
	        ex_w_select     <= 0;
	        ex_matrix_data  <= 0;
	        ex_rs2_r_select <= 0;
	    end 
 006616	    else begin
	        ex_rs1          <= id_rs1;
	        ex_rs2          <= id_rs2;
	        ex_pc           <= id_pc;
	        ex_regs_data1   <= id_regs_data1;
	        ex_regs_data2   <= id_regs_data2;
	        ex_imm          <= id_imm;
	        ex_func3_code   <= id_func3_code;
	        ex_func7_code   <= id_func7_code;
	        ex_rd           <= id_rd;
	        ex_br           <= id_br;
	        ex_mem_read     <= id_mem_read;
	        ex_mem2reg      <= id_mem2reg;
	        ex_alu_op       <= id_alu_op;
	        ex_mem_write    <= id_mem_write;
	        ex_alu_src1     <= id_alu_src1;
	        ex_alu_src2     <= id_alu_src2;
	        ex_br_addr_mode <= id_br_addr_mode;
	        ex_w_select     <= id_w_select;
	        ex_matrix_data  <= id_matrix_data;
	        ex_rs2_r_select <= id_rs2_r_select;
	    end
	    $display("ex_regs_data1: %h",ex_regs_data1 );
	    $display("ex_regs_data2: %h",ex_regs_data2 );
	    $display("ex_imm: %h",ex_imm );
	    $display("ex_alu_op: %h",ex_alu_op );
	end
	endmodule
