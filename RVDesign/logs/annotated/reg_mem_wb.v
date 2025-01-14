	// verilator_coverage annotation
	module reg_mem_wb(
 020000	    input  wire clk,
%000001	    input  wire rst,
 000257	    input  wire[31:0] me_mem_data,
 000673	    input  wire[31:0] me_alu_o,
%000299	    input  wire[127:0]me_matrix_o,
 000084	    input  wire[4:0]  me_rd,
 000014	    input  wire       me_mem2reg,
 000029	    input  wire[1:0]  me_w_select,
 000275	    output reg[31:0]  wb_mem_data,
 000674	    output reg[31:0]  wb_alu_o,
%000287	    output reg[127:0] wb_matrix_o,
 000082	    output reg[4:0]   wb_rd,
 000012	    output reg        wb_mem2reg,
 000029	    output reg[1:0]   wb_w_select
	);
	
	always @(posedge clk) begin
 000100	    if (!rst)begin
	        wb_mem_data    <= 0;     
	        wb_alu_o       <= 0;  
	        wb_rd          <= 0; 
	        wb_mem2reg     <= 0;     
	        wb_w_select    <= 0;
	        wb_matrix_o    <= 0;              
	    end 
 009900	    else begin
	        wb_mem_data    <= me_mem_data;     
	        wb_alu_o       <= me_alu_o; 
	        wb_rd          <= me_rd; 
	        wb_mem2reg     <= me_mem2reg;     
	        wb_w_select    <= me_w_select;
	        wb_matrix_o    <= me_matrix_o;
	    end
	    $display("wb_mem_data  : %h",wb_mem_data);
	    $display("wb_alu_o     : %h",wb_alu_o);
	    $display("wb_matrix_o  : %h",wb_matrix_o);
	    $display("wb_mem2reg   : %h",wb_mem2reg);
	    $display("wb_w_select  : %h",wb_w_select);
	end
	
	endmodule
