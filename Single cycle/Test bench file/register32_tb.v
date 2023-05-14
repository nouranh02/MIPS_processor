`timescale 1ns / 1ps


module register32_tb;

	// Inputs
	reg [31:0] reg_in;
	reg enable;
	reg clk;

	// Outputs
	wire [31:0] reg_out;

	// Instantiate the Unit Under Test (UUT)
	register32 uut (
		.reg_in(reg_in), 
		.enable(enable), 
		.clk(clk), 
		.reg_out(reg_out)
	);
	always #5 clk = ~clk;  

	initial begin
		// Initialize Inputs
		reg_in = 0;
		enable = 1;
		clk = 0;
		#10;
		reg_in = 32'h00ABCDEF;
		enable = 1;
		#10;
		reg_in = 0;
		enable = 0;
		#10;
		reg_in = 1;
		enable = 1;
		#10;

        
		// Add stimulus here

	end
      
endmodule

