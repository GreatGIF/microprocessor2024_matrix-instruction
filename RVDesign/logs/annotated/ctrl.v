	// verilator_coverage annotation
	`include "./AdamRiscv/define.vh"
	
	module ctrl(   
 039497	    input  wire[6:0]    inst_op,
 019743	    input  wire[2:0]    inst_func3_code,
 006584	    output wire         br,
 000012	    output wire         mem_read,
 000013	    output wire         mem2reg,
 013202	    output wire[2:0]    alu_op,
%000002	    output wire         mem_write,
 000020	    output wire[1:0]    alu_src1,
 000017	    output wire[1:0]    alu_src2,
%000001	    output wire         br_addr_mode,
 000027	    output wire[1:0]    w_select_o,
 000011	    output wire         rs2_r_select
	);
	
	assign alu_op = (inst_op == `ItypeL || inst_op == `Stype || inst_op == `UtypeL || inst_op == `UtypeU)? 3'b000 :
	                (inst_op == `Btype)? 3'b001:
	                (inst_op == `Rtype)? 3'b010:
	                (inst_op == `ItypeA) ? 3'b011:
	                (inst_op == `ItypeJ || inst_op == `Jtype)? 3'b100 :
	                (inst_op == `Mtype)? 3'b101 : 3'b111;
	
	
	assign alu_src1 = (inst_op == `ItypeJ || inst_op == `Jtype || inst_op == `UtypeU) ? `PC : 
	                  (inst_op == `UtypeL) ? `NULL : `REG;
	assign alu_src2 = (inst_op == `ItypeL || inst_op == `Stype || inst_op == `UtypeU || inst_op == `ItypeA || inst_op == `UtypeL || 
	                  (inst_op == `Mtype && (inst_func3_code == `M_ST || inst_func3_code == `M_LD)))? `IMM :
	                  (inst_op == `ItypeJ || inst_op == `Jtype) ? `PC_PLUS4 : `REG;
	assign br_addr_mode = (inst_op == `ItypeJ)? `J_REG : `B_PC;
	
	
	assign br = (inst_op == `Btype || inst_op == `ItypeJ || inst_op == `Jtype)? 1:0;
	assign mem_write = (inst_op == `Stype || (inst_op == `Mtype && inst_func3_code == `M_ST))? 1:0;
	assign mem_read = (inst_op == `ItypeL || (inst_op == `Mtype && inst_func3_code == `M_LD))? 1:0;
	
	// 00: write disable; 01: write reg; 10: write one matrix slice; 11: write whole matrix
	assign w_select_o = (inst_op == `ItypeL || inst_op == `Rtype || inst_op == `UtypeU || inst_op == `ItypeA || inst_op == `ItypeJ || inst_op == `UtypeL || inst_op == `Jtype) ? 2'b01 : 
	                ((inst_op == `Mtype) ? ((inst_func3_code == `M_MVTR) ? 2'b01 : ((inst_func3_code == `M_MOPA) ? 2'b11 : ((inst_func3_code == `M_ST) ? 2'b00 : 2'b10))) : 2'b00);
	//assign regs_write = (inst_op == `Stype || inst_op == `Btype)? 0:1;     // when the inst is beyond the definition ,like 0x00000000, reg_write is 0  
	assign mem2reg = (inst_op == `ItypeL || (inst_op == `Mtype && inst_func3_code == `M_LD)) ? 1 : 0;
	
	assign rs2_r_select = (inst_op == `Mtype && (inst_func3_code == `M_MVTR || inst_func3_code == `M_ST)) ? 0 : 1; // 1 to read rs2 from reg, 0 to read rs2 from matrix
	
	endmodule
	
