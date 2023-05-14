module PC(
	output reg [31:0] PC_out,
	input clk,
	input rst,
	input [31:0] PC_in
	);	
	always @(posedge clk, posedge rst)
	PC_out <= (rst) ? 32'b0 : PC_in;
endmodule