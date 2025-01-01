	// verilator_coverage annotation
	module stage_if(
 020000	    input  wire          clk,
%000002	    input  wire          rst,
%000009	    input  wire          pc_stall,
 020102	    input  wire[31:0]    br_addr,
 006569	    input  wire          br_ctrl,
 177799	    output wire[31:0]    if_inst,
 013249	    output wire[31:0]    if_pc
	);
	
	pc u_pc(
	    .clk      (clk      ),
	    .br_ctrl  (br_ctrl  ),
	    .br_addr  (br_addr  ),
	    .rst      (rst      ),
	    .pc_o     (if_pc    ),
	    .pc_stall (pc_stall )
	);
	
	inst_memory #(
	    .IROM_SPACE (1024 )
	)inst_memory(
	    .inst_addr (if_pc     ),
	    .inst_o    (if_inst      )
	);
	
	
	endmodule
	
