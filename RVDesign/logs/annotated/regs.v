	// verilator_coverage annotation
	module regs(
 020000	    input wire clk,
%000001	    input wire rst,
	
 000011	    input wire          rs2_r_select,       // 1: read reg; 0: read matrix
 019782	    input wire[4:0]     r_regs_addr1,
 026365	    input wire[4:0]     r_regs_addr2,
 000082	    input wire[4:0]     w_regs_addr,
 000492	    input wire[31:0]    w_regs_data,
 000029	    input wire[1:0]     w_select,       // 00: write disable; 01: write reg; 10: write one matrix slice; 11: write whole matrix
%000287	    input wire[127:0]   w_matrix_data,
	
 105789	    output wire[31:0]   r_regs_o1,
 112174	    output wire[31:0]   r_regs_o2,
%000240	    output wire[127:0]  r_matrix_o
	);
	
	reg [31:0] regs_file [31:0]; //  32 32-bit registers
	
%000248	reg [31:0] matrix_file [3:0];
	
 000012	wire wb_hazard_a;
%000002	wire wb_hazard_b;
%000004	wire wb_hazard_m;
%000292	wire [31:0] w_matrix[3:0];
	
	assign w_matrix[0] = w_matrix_data[31:0];
	assign w_matrix[1] = w_matrix_data[63:32];
	assign w_matrix[2] = w_matrix_data[95:64];
	assign w_matrix[3] = w_matrix_data[127:96];
	
	/*------------------------Write RegisterFile---------------*/
	always @(posedge clk) begin
 000100	    if (!rst)begin
	        regs_file[0] <= 0;
	        matrix_file[0] <= 32'h55555555;
	        matrix_file[1] <= 32'haaaaaaaa;
	        matrix_file[2] <= 32'h33333333;
	        matrix_file[3] <= 32'hcccccccc;
	    end
 000025	    else if (w_select == 2'b01 && w_regs_addr != 5'b0) begin //forbit write x0
	        $display("WRITE REGISTER FILE: x%d = %h", w_regs_addr, w_regs_data);
	        regs_file[w_regs_addr] <= w_regs_data;
	    end
%000004	    else if (w_select == 2'b10) begin
	        $display("WRITE ONE MATRIX SLICE: M[%d] = %h", w_regs_addr, w_regs_data);
	        matrix_file[w_regs_addr[1:0]] <= w_regs_data;
	    end
%000001	    else if (w_select == 2'b11) begin
	       $display("WRITE WHOLE MATRIX: M[0] = %h, M[1] = %h, M[2] = %h, M[3] = %h", w_matrix[0], w_matrix[1], w_matrix[2], w_matrix[3]);
	       matrix_file[0] <= w_matrix[0];
	       matrix_file[1] <= w_matrix[1];
	       matrix_file[2] <= w_matrix[2];
	       matrix_file[3] <= w_matrix[3];
	    end
	end
	
	/*------------------------hazard check & forwarding-------------*/
	assign wb_hazard_a = (w_select == 2'b01) && (w_regs_addr != 0) && (w_regs_addr == r_regs_addr1); //me_rd != 0 : don't forward the result when rd is x0
	assign wb_hazard_b = ((rs2_r_select == 1) && (w_select == 2'b01) && (w_regs_addr != 0) && (w_regs_addr == r_regs_addr2)) || 
	                     ((rs2_r_select == 0) && (w_select == 2'b10) && (w_regs_addr == r_regs_addr2)) ||
	                     ((rs2_r_select == 0) && (w_select == 2'b11));
	assign wb_hazard_m = (w_select[1] == 1); //w_select == 2'b11 || w_select == 2'b10
	
	/*------------------------Read RegisterFile---------------*/
	assign r_regs_o1 = wb_hazard_a ? w_regs_data : regs_file[r_regs_addr1];
	assign r_regs_o2 = wb_hazard_b ? 
	                   (rs2_r_select ? w_regs_data : (w_select == 2'b10 ? w_regs_data : w_matrix[r_regs_addr2[1:0]])) : 
	                   (rs2_r_select ? regs_file[r_regs_addr2] : matrix_file[r_regs_addr2[1:0]]);
	// always @(*) begin
	//     if(wb_hazard_b) begin
	//         if(rs2_r_select == 1) begin
	//             r_regs_o2 = w_regs_data;
	//         end else begin
	//             if(w_select == 2'b10) begin
	//                 r_regs_o2 = w_regs_data;
	//             end else begin
	//                 r_regs_o2 = w_matrix[r_regs_addr2[1:0]];
	//             end
	//         end
	//     end else begin
	//         if(rs2_r_select == 1) begin
	//             r_regs_o2 = regs_file[r_regs_addr2];
	//         end else begin
	//             r_regs_o2 = matrix_file[r_regs_addr2];
	//         end
	//     end
	// end
	
	assign r_matrix_o[31:0] = wb_hazard_m ? 
	                          (w_select == 2'b11 ? w_matrix[0] : 
	                          (w_select == 2'b10 ? 
	                           (w_regs_addr == 5'd0 ? w_regs_data : matrix_file[0]) 
	                           : matrix_file[0])) 
	                          : matrix_file[0];
	assign r_matrix_o[63:32] = wb_hazard_m ? 
	                           (w_select == 2'b11 ? w_matrix[1] : 
	                           (w_select == 2'b10 ? 
	                           (w_regs_addr == 5'd1 ? w_regs_data : matrix_file[1]) 
	                           : matrix_file[1])) 
	                           : matrix_file[1];
	assign r_matrix_o[95:64] = wb_hazard_m ? 
	                           (w_select == 2'b11 ? w_matrix[2] : 
	                           (w_select == 2'b10 ? 
	                           (w_regs_addr == 5'd2 ? w_regs_data : matrix_file[2]) 
	                           : matrix_file[2])) 
	                           : matrix_file[2];
	assign r_matrix_o[127:96] = wb_hazard_m ? 
	                            (w_select == 2'b11 ? w_matrix[3] : 
	                            (w_select == 2'b10 ? 
	                            (w_regs_addr == 5'd3 ? w_regs_data : matrix_file[3]) 
	                            : matrix_file[3])) 
	                            : matrix_file[3];
	
	// always @(*) begin
	//     if (wb_hazard_m) begin
	//         if (w_select == 2'b11) begin
	//             r_matrix_o[31:0] = w_matrix[0];
	//         end else begin
	//             if (w_select == 2'b10) begin
	//                 if (w_regs_addr == 5'd0) begin
	//                     r_matrix_o[31:0] = w_regs_data;
	//                 end else begin
	//                     r_matrix_o[31:0] = matrix_file[0];
	//                 end
	//             end else begin
	//                 r_matrix_o[31:0] = matrix_file[0];
	//             end
	//         end
	//     end else begin
	//         r_matrix_o[31:0] = matrix_file[0];
	//     end
	// end
	
	
	// assign r_matrix_o[31:0] = wb_hazard_m ? w_matrix[0] : (wb_hazard_b ? (w_regs_addr == 5'd0 ? w_regs_data : matrix_file[0]) : matrix_file[0]);
	// assign r_matrix_o[63:32] = wb_hazard_m ? w_matrix[1] : (wb_hazard_b ? (w_regs_addr == 5'd1 ? w_regs_data : matrix_file[1]) : matrix_file[1]);
	// assign r_matrix_o[95:64] = wb_hazard_m ? w_matrix[2] : (wb_hazard_b ? (w_regs_addr == 5'd2 ? w_regs_data : matrix_file[2]) : matrix_file[2]);
	// assign r_matrix_o[127:96] = wb_hazard_m ? w_matrix[3] : (wb_hazard_b ? (w_regs_addr == 5'd3 ? w_regs_data : matrix_file[3]) : matrix_file[3]);
	
	endmodule
	
