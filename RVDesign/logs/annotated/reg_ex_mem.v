	// verilator_coverage annotation
	module reg_ex_mem(
 020000	    input  wire clk,
%000001	    input  wire rst,
 000536	    input  wire[31:0] ex_regs_data2,
 000660	    input  wire[31:0] ex_alu_o,
%000224	    input  wire[127:0]ex_matrix_o,
 000082	    input  wire[4:0]  ex_rd,
 000014	    input  wire       ex_mem_read,
 000012	    input  wire       ex_mem2reg,
%000002	    input  wire       ex_mem_write,
 000027	    input  wire[1:0]  ex_w_select,
 006588	    input  wire       ex_rs2_r_select,
 000041	    input  wire[2:0]  ex_func3_code, 
	
	    //forwarding
 000099	    input wire[4:0]   ex_rs2,
 000095	    output reg[4:0]   me_rs2,
	
 000540	    output reg[31:0]  me_regs_data2,
 000673	    output reg[31:0]  me_alu_o,
%000299	    output reg[127:0] me_matrix_o,
 000084	    output reg[4:0]   me_rd,
 000013	    output reg        me_mem_read,
 000014	    output reg        me_mem2reg,
%000004	    output reg        me_mem_write,
 000029	    output reg[1:0]   me_w_select,
 006588	    output reg        me_rs2_r_select,
 000044	    output reg[2:0]   me_func3_code
	);
	
	always @(posedge clk) begin
 000100	    if (!rst)begin
	        me_regs_data2  <= 0;         
	        me_alu_o       <= 0;     
	        me_rd          <= 0; 
	        me_mem_read    <= 0;     
	        me_mem2reg     <= 0;     
	        me_mem_write   <= 0;         
	        me_w_select    <= 0;
	        me_rs2_r_select<= 0;
	        me_rs2         <= 0;   
	        me_func3_code  <= 0;    
	        me_matrix_o    <= 0;
	    end 
 009900	    else begin  
	        me_regs_data2  <= ex_regs_data2;         
	        me_alu_o       <= ex_alu_o;     
	        me_matrix_o    <= ex_matrix_o;
	        me_rd          <= ex_rd; 
	        me_mem_read    <= ex_mem_read;     
	        me_mem2reg     <= ex_mem2reg;     
	        me_mem_write   <= ex_mem_write;         
	        me_w_select    <= ex_w_select;
	        me_rs2_r_select<= ex_rs2_r_select;
	        me_rs2         <= ex_rs2;    
	        me_func3_code  <= ex_func3_code; 
	    end
	
	    $display("me_alu_o: %h",me_alu_o);
	    $display("me_matrix_o: %h",me_matrix_o);
	
	end
	
	endmodule
