	// verilator_coverage annotation
	module stage_wb(
 000274	    input  wire[31:0]  wb_mem_data,
 000675	    input  wire[31:0]  wb_alu_o,
%000260	    input  wire[127:0] wb_matrix_o,
 000012	    input  wire        wb_mem2reg,
 000491	    output wire[31:0]  w_regs_data,
%000260	    output wire[127:0] w_matrix_data
	);
	
	assign w_regs_data = wb_mem2reg ? wb_mem_data : wb_alu_o;
	assign w_matrix_data = wb_matrix_o;
	
	endmodule
	
