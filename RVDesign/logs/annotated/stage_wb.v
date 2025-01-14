	// verilator_coverage annotation
	module stage_wb(
 000275	    input  wire[31:0]  wb_mem_data,
 000674	    input  wire[31:0]  wb_alu_o,
%000287	    input  wire[127:0] wb_matrix_o,
 000012	    input  wire        wb_mem2reg,
 000492	    output wire[31:0]  w_regs_data,
%000287	    output wire[127:0] w_matrix_data
	);
	
	assign w_regs_data = wb_mem2reg ? wb_mem_data : wb_alu_o;
	assign w_matrix_data = wb_matrix_o;
	
	endmodule
	
