	// verilator_coverage annotation
	`include "./AdamRiscv/define.vh"
	
	
	module forwarding(
 000077	    input wire[4:0]   ex_rs1,
 000099	    input wire[4:0]   ex_rs2,
 000084	    input wire[4:0]   me_rd,
 000082	    input wire[4:0]   wb_rd,
 000095	    input wire[4:0]   me_rs2,
%000004	    input wire        me_mem_write,
 000029	    input wire[1:0]   me_w_select,
 000029	    input wire[1:0]   wb_w_select,
 006588	    input wire        ex_rs2_r_select,
 006588	    input wire        me_rs2_r_select,
	    //forwarding for alu_operatant
 000032	    output wire[1:0]  forwardA,
 000022	    output wire[1:0]  forwardB,
%000009	    output wire[1:0]  forwardM,
	    //forwarding for data_memory write_data
 000011	    output wire       forward_data
	);
	
	// alu_operatant forwarding
 000019	wire ex_hazard_a;
 000010	wire ex_hazard_b;
%000005	wire ex_hazard_m;
 000015	wire mem_hazard_a;
 000013	wire mem_hazard_b;
%000005	wire mem_hazard_m;
	//data_memory write_data forwarding for store
 000010	wire hazard_data_w;
	
	assign ex_hazard_a   = (me_w_select == 2'b01) && (me_rd != 0) && (me_rd == ex_rs1);
	assign ex_hazard_b   = ((ex_rs2_r_select == 1) && (me_w_select == 2'b01) && (me_rd != 0) && (me_rd == ex_rs2)) || 
	                       ((ex_rs2_r_select == 0) && (me_w_select == 2'b10) && (me_rd == ex_rs2)) ||
	                       ((ex_rs2_r_select == 0) && (me_w_select == 2'b11));
	assign ex_hazard_m   = (me_w_select == 2'b11) || (me_w_select == 2'b10);
	
	assign mem_hazard_a  = (wb_w_select == 2'b01) && (wb_rd != 0) && (wb_rd == ex_rs1); 
	assign mem_hazard_b  = ((ex_rs2_r_select == 1) && (wb_w_select == 2'b01) && (wb_rd != 0) && (wb_rd == ex_rs2)) || 
	                       ((ex_rs2_r_select == 0) && (wb_w_select == 2'b10) && (wb_rd == ex_rs2)) ||
	                       ((ex_rs2_r_select == 0) && (wb_w_select == 2'b11));
	assign mem_hazard_m  = (wb_w_select == 2'b11) || (wb_w_select == 2'b10);
	
	assign hazard_data_w = ((me_rs2_r_select == 1) && (wb_w_select == 2'b01) && (wb_rd != 0) && (wb_rd == me_rs2)) || 
	                       ((me_rs2_r_select == 0) && (wb_w_select == 2'b10) && (wb_rd == me_rs2)) ||
	                       ((me_rs2_r_select == 0) && (wb_w_select == 2'b11)) && me_mem_write;
	
	// assign ex_hazard_a   = me_regs_write && (me_rd != 0) && (me_rd == ex_rs1); //me_rd != 0 : don't forward the result when rd is x0
	// assign ex_hazard_b   = me_regs_write && (me_rd != 0) && (me_rd == ex_rs2);
	// assign mem_hazard_a  = wb_regs_write && (wb_rd != 0) && (wb_rd == ex_rs1); 
	// assign mem_hazard_b  = wb_regs_write && (wb_rd != 0) && (wb_rd == ex_rs2);
	// assign hazard_data_w = wb_regs_write && (wb_rd != 0) && (wb_rd == me_rs2) && me_mem_write; //for store
	
	assign forwardA     = ex_hazard_a ? `EX_MEM_A : mem_hazard_a ? `MEM_WB_A : `ID_EX_A;
	assign forwardB     = ex_hazard_b ? `EX_MEM_B : mem_hazard_b ? `MEM_WB_B : `ID_EX_B;
	assign forwardM     = ex_hazard_m ? `EX_MEM_M : mem_hazard_m ? `MEM_WB_M : `ID_EX_M;
	assign forward_data = hazard_data_w ? 1 : 0;
	
	always @(*) begin
 000016	    if (|forwardA)
	        $display("forwardA! ex_hazard: %b, mem_hazard: %b",ex_hazard_a,mem_hazard_a);
%000008	    else if (|forwardB)
	        $display("forwardB! ex_hazard: %b, mem_hazard: %b",ex_hazard_b,mem_hazard_b);
%000004	    else if (|forwardM)
	        $display("forwardM! ex_hazard: %b, mem_hazard: %b",ex_hazard_m,mem_hazard_m);
%000004	    else if (forward_data)
	        $display("forward4store! hazard_data: %b",hazard_data_w);
	end
	
	endmodule
	
