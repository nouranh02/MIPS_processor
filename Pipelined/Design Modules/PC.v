//Single cycle pc
/*module PC(
	output reg [31:0] PC_out,
	input clk,
	input rst,
	input [31:0] PC_in
	);	
	always @(posedge clk, posedge rst)
	PC_out <= (rst) ? 32'b0 : PC_in;
endmodule
*/
module PC(
	output reg [31:0] PC_out,
	input clk,
	input rst,
   input [31:0] PC_in,
   input en
	);	
  always @(negedge clk)

	if(rst) PC_out = 0;
	else 
		begin
			if(en) PC_out = PC_in;
			else 	PC_out = PC_out;
		end
endmodule
