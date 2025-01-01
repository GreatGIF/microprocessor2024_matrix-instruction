	// verilator_coverage annotation
	`include "./AdamRiscv/define.vh"
	
	module stage_mem(
 020000	    input  wire        clk,
%000002	    input  wire        rst,
 000095	    input  wire[4:0]   me_rs2,
	
 000027	    input  wire[1:0]   me_w_select,
 000029	    input  wire[1:0]   wb_w_select,
 006589	    input  wire        me_rs2_r_select,
 000549	    input  wire[31:0]  me_regs_data2,
 000679	    input  wire[31:0]  me_alu_o,
 000012	    input  wire        me_mem_read,
%000004	    input  wire        me_mem_write,
 000043	    input  wire[2:0]   me_func3_code,
	    //forwarding
 000010	    input wire         forward_data,
 000491	    input wire[31:0]   w_regs_data,
%000260	    input wire[127:0]  w_matrix_data,
	
 000255	    output wire[31:0]  me_mem_data
	);
	
 000550	wire[31:0]  w_data_mem;
 000256	wire[31:0]  r_data_mem;
	
	data_memory 
	#(
	    .DROM_SPACE (1024       )
	)
	u_data_memory(
	    .clk        (clk               ),
	    .rst        (rst               ),
	    .mst_or_mvtr(me_rs2_r_select   ),
	    .data_addr  (me_alu_o          ),
	    .w_data_mem (w_data_mem        ),
	    .r_en_mem   (me_mem_read       ),
	    .w_en_mem   (me_mem_write      ),
	    .byte_sel   (me_func3_code[1:0]),
	    .r_data_mem (r_data_mem        )
	);
	
	assign w_data_mem  = forward_data ? (wb_w_select == 2'b11 ? w_matrix_data[(32 * me_rs2) + 31 -: 32] : w_regs_data) : me_regs_data2;
	
	assign me_mem_data = (me_w_select == 2'b10) ? r_data_mem:
	                     (me_func3_code == `LB) ? {{24{r_data_mem[7]}},r_data_mem[7:0]}:
	                     (me_func3_code == `LH) ? {{16{r_data_mem[15]}},r_data_mem[15:0]}:
	                     (me_func3_code == `LBU)? {24'b0,r_data_mem[7:0]}:
	                     (me_func3_code == `LHU)? {16'b0,r_data_mem[15:0]}:
	                     r_data_mem;
	
	endmodule
	
