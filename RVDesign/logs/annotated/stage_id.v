	// verilator_coverage annotation
	module stage_id(
 020000	    input wire         clk,
%000001	    input wire         rst,
 151526	    input wire[31:0]   id_inst,
 000029	    input wire[1:0]    w_select,
 000082	    input wire[4:0]    w_regs_addr,
 000492	    input wire[31:0]   w_regs_data,
%000287	    input wire[127:0]  w_matrix_data,
%000008	    input wire         ctrl_stall,
 105789	    output  wire[31:0] id_regs_data1,
 112174	    output  wire[31:0] id_regs_data2,
%000240	    output  wire[127:0]id_matrix_data,
 000378	    output  wire[31:0] id_imm,
 019743	    output  wire[2:0]  id_func3_code, 
 006574	    output  wire       id_func7_code,
 013216	    output  wire[4:0]  id_rd,
 006584	    output  wire       id_br,
 000013	    output  wire       id_mem_read,
 000013	    output  wire       id_mem2reg,
 013202	    output  wire[2:0]  id_alu_op,
%000003	    output  wire       id_mem_write,
 000018	    output  wire[1:0]  id_alu_src1,
 000016	    output  wire[1:0]  id_alu_src2,
%000009	    output  wire       id_br_addr_mode,
 000026	    output  wire[1:0]  id_w_select,
 000019	    output  wire       id_rs2_r_select,
	    //forwarding
 019782	    output  wire[4:0]  id_rs1,
 026365	    output  wire[4:0]  id_rs2
	/*assign id_br           = (ctrl_stall == 1) ? 0 : br             ;
	assign id_mem_read     = (ctrl_stall == 1) ? 0 : mem_read       ;       
	assign id_mem2reg      = (ctrl_stall == 1) ? 0 : mem2reg        ;      
	assign id_alu_op       = (ctrl_stall == 1) ? 0 : alu_op         ;     
	assign id_mem_write    = (ctrl_stall == 1) ? 0 : mem_write      ;            
	assign id_alu_src1     = (ctrl_stall == 1) ? 0 : alu_src1       ;
	assign id_alu_src2     = (ctrl_stall == 1) ? 0 : alu_src2       ; 
	assign id_br_addr_mode = (ctrl_stall == 1) ? 0 : br_addr_mode   ;       
	assign id_w_select     = (ctrl_stall == 1) ? 0 : w_select_o     ;             
	assign id_rs2_r_select = (ctrl_stall == 1) ? 0 : rs2_r_select   ;*/
	);
	
 006584	wire        br          ;
 000012	wire        mem_read    ;
 000013	wire        mem2reg     ;
 013202	wire[2:0]   alu_op      ;
%000002	wire        mem_write   ;
 000020	wire[1:0]   alu_src1    ;
 000017	wire[1:0]   alu_src2    ;
%000001	wire        br_addr_mode;
 000011	wire        rs2_r_select;
 000027	wire[1:0]   w_select_o  ;
	
	
	regs u_regs(
	    .clk          (clk              ),
	    .rst          (rst              ),
	    .rs2_r_select (rs2_r_select     ),
	    .r_regs_addr1 (id_inst[19:15]   ),
	    .r_regs_addr2 (id_inst[24:20]   ),
	    .w_regs_addr  (w_regs_addr      ),
	    .w_regs_data  (w_regs_data      ),
	    .w_matrix_data(w_matrix_data    ),
	    .w_select     (w_select         ),
	    .r_regs_o1    (id_regs_data1    ),
	    .r_regs_o2    (id_regs_data2    ),
	    .r_matrix_o   (id_matrix_data   )
	);
	
	ctrl u_ctrl(
	    .inst_op        (id_inst[6:0] ),
	    .inst_func3_code(id_func3_code),
	    .br             (br           ),
	    .mem_read       (mem_read     ),
	    .mem2reg        (mem2reg      ),
	    .alu_op         (alu_op       ),
	    .mem_write      (mem_write    ),
	    .alu_src1       (alu_src1     ),
	    .alu_src2       (alu_src2     ),
	    .br_addr_mode   (br_addr_mode ),
	    .w_select_o     (w_select_o   ),
	    .rs2_r_select   (rs2_r_select )
	);
	
	imm_gen u_imm_gen(
	    .inst  (id_inst  ),
	    .imm_o (id_imm   )
	);
	
	assign id_rd         = id_inst[11:7];
	assign id_func3_code = id_inst[14:12];
	assign id_func7_code = id_inst[30];
	
	assign id_rs1 = id_inst[19:15];
	assign id_rs2 = id_inst[24:20];
	
	//stall
	assign id_br           = (ctrl_stall == 1) ? 0 : br             ;
	assign id_mem_read     = (ctrl_stall == 1) ? 0 : mem_read       ;       
	assign id_mem2reg      = (ctrl_stall == 1) ? 0 : mem2reg        ;      
	assign id_alu_op       = (ctrl_stall == 1) ? 0 : alu_op         ;     
	assign id_mem_write    = (ctrl_stall == 1) ? 0 : mem_write      ;            
	assign id_alu_src1     = (ctrl_stall == 1) ? 0 : alu_src1       ;
	assign id_alu_src2     = (ctrl_stall == 1) ? 0 : alu_src2       ; 
	assign id_br_addr_mode = (ctrl_stall == 1) ? 0 : br_addr_mode   ;       
	assign id_w_select     = (ctrl_stall == 1) ? 0 : w_select_o     ;             
	assign id_rs2_r_select = (ctrl_stall == 1) ? 0 : rs2_r_select   ;
	
	
	endmodule
