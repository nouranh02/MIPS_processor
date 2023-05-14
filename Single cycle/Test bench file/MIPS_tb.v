`timescale 1ns / 1ps

module MIPS_tb;

	// Inputs
	reg CLK;
	reg RST;

	// Instantiate the Unit Under Test (UUT)
	MIPS_topmodule uut (
		.CLK(CLK), 
		.RST(RST)
	);
	always #1000 CLK = ~CLK;
	initial begin
		// Initialize Inputs
		CLK = 0;
		RST = 1;
		
		// Wait 100 ns for global reset to finish
		#100;
      RST = 0;
		#500;	
		// Add stimulus here

	end
      
endmodule

