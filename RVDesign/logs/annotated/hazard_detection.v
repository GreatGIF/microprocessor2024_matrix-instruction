	// verilator_coverage annotation
	`include "./AdamRiscv/define.vh"
	
	module hazard_detection(
 000014	    input  wire      ex_mem_read,
 039497	    input  wire[6:0] id_inst_op,
 019743	    input  wire[2:0] id_func3_code,
 019782	    input  wire[4:0] id_rs1,
 026365	    input  wire[4:0] id_rs2,
 019770	    input  wire[2:0] ex_alu_op,
 000082	    input  wire[4:0] ex_rd,
 006570	    input  wire      br_ctrl,
%000008	    output wire      load_stall,
 006570	    output wire      flush
	);
	assign load_stall = ex_mem_read ? 
	                        (id_inst_op != `Mtype && ex_alu_op != 3'b101) ? 
	                            ((ex_rd == id_rs1 || ex_rd == id_rs2) ? 1 : 0) : 
	                            ((id_inst_op == `Mtype && ex_alu_op == 3'b101) ? 
	                                ((((id_func3_code == 3'b001 || id_func3_code == 3'b011) && ex_rd == id_rs2) || (id_func3_code == 3'b100)) ? 1 : 0) : 
	                                0) 
	                        : 0;
	assign flush      = br_ctrl;
	
	// if(ex_mem_read)
	//     if(id_alu_op != 3'b101 && ex_alu_op != 3'b101)
	//         if(ex_rd == id_rs1 || ex_rd == id_rs2)
	//             load_stall = 1;
	//         else
	//             load_stall = 0;
	//     else 
	//         if(id_alu_op == 3'b101 && ex_alu_op == 3'b101)
	//             if((id_w_select == 2'b10 && ex_rd == id_rs2) || (id_w_select == 2'b11))
	//                 load_stall = 1;
	//             else
	//                 load_stall = 0;
	//         else
	//             load_stall = 0;
	// else
	//     load_stall = 0;
	endmodule
