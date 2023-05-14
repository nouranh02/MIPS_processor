`timescale 1ns / 1ps


module MIPS_pip_tb;

	// Inputs
	reg CLK;
	reg RST;

	// Instantiate the Unit Under Test (UUT)
	MIPS_pipelined uut (
		.CLK(CLK), 
		.RST(RST)
	);
	
	always #50 CLK = ~CLK;
	initial begin
		// Initialize Inputs
		CLK = 0;
		RST = 1;

		// Wait 100 ns for global reset to finish
		#50;
      RST = 0;
		#500;	
		// Add stimulus here

	end
      
endmodule

