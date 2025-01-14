	// verilator_coverage annotation
	module data_memory #(
	    parameter DROM_SPACE = 1024
	)(
 020000	    input  wire         clk,
%000001	    input  wire         rst,
 006588	    input  wire         mst_or_mvtr,
 000673	    input  wire[31:0]   data_addr,
 000536	    input  wire[31:0]   w_data_mem,
 000013	    input  wire         r_en_mem,
%000004	    input  wire         w_en_mem,
 000038	    input  wire[1:0]    byte_sel,
 000256	    output wire[31:0]   r_data_mem
	);
	
	reg [7:0] data [DROM_SPACE-1:0];
	
	//wire [31:0] data_test1, data_test2, data_test3, data_test4, data_test5, data_test6, data_test7, data_test8;
	
	//assign data_test1 = {data[3], data[2], data[1], data[0]};
	//assign data_test2 = {data[7], data[6], data[5], data[4]};
	//assign data_test3 = {data[11], data[10], data[9], data[8]};
	//assign data_test4 = {data[15], data[14], data[13], data[12]};
	//assign data_test5 = {data[19], data[18], data[17], data[16]};
	//assign data_test6 = {data[23], data[22], data[21], data[20]};
	//assign data_test7 = {data[27], data[26], data[25], data[24]};
	//assign data_test8 = {data[31], data[30], data[29], data[28]};
	
	
	initial $readmemh ("./AdamRiscv/rom/test_data.hex",data);
	
	/*----------------Write DataMemory---------------------*/
	always @(posedge clk) begin
%000004	    if (w_en_mem && !r_en_mem && rst)begin
%000004	        if (byte_sel == 2'b10 || !mst_or_mvtr)begin
	            data[data_addr]   <= w_data_mem[7:0];
	            data[data_addr+1] <= w_data_mem[15:8];
	            data[data_addr+2] <= w_data_mem[23:16];
	            data[data_addr+3] <= w_data_mem[31:24];
	        end        
%000000	        else if (byte_sel == 2'b00) begin
	            data[data_addr]   <= w_data_mem[7:0];
	        end
%000000	        else if (byte_sel == 2'b01) begin
	            data[data_addr]   <= w_data_mem[7:0];
	            data[data_addr+1] <= w_data_mem[15:8];
	        end
	        // $strobe("WRITE DATA MEMORY: Addr %d = %h ,mode:%d", data_addr,{data[data_addr+3],data[data_addr+2],data[data_addr+1],data[data_addr]},byte_sel);
	    end
	    
	end
	
	/*----------------Read DataMemory---------------------*/
	assign r_data_mem = (r_en_mem && !w_en_mem)? {data[data_addr+3],data[data_addr+2],data[data_addr+1],data[data_addr]}: 32'b0;
	/*
	always @(posedge clk) begin
	    if (!rst)begin
	        r_data_mem <= 0;
	    end
	    else if (r_en_mem && !w_en_mem) begin
	        r_data_mem[7:0]   <= data[data_addr];
	        r_data_mem[15:8]  <= data[data_addr+1];
	        r_data_mem[23:16] <= data[data_addr+2];
	        r_data_mem[31:24] <= data[data_addr+3];
	        $display("READ DATA MEMORY: Addr %d = %h", data_addr, r_data_mem);
	    end
	    else begin
	        r_data_mem <= 0;
	    end
	end
	*/  
	
	endmodule
	
