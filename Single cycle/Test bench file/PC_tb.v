`timescale 1ns / 1ps

module PC_tb;

	// Inputs
	reg clk;
	reg Jump;
	reg Branch;
	reg Zero;
	reg [25:0] dirJump_address;
	reg [31:0] pcIn;
	reg [31:0] extendedBits;

	// Outputs
	wire [31:0] pcOut;

	// Instantiate the Unit Under Test (UUT)
	PC uut (
		.clk(clk), 
		.Jump(Jump), 
		.Branch(Branch), 
		.Zero(Zero), 
		.dirJump_address(dirJump_address), 
		.pcIn(pcIn), 
		.extendedBits(extendedBits), 
		.pcOut(pcOut)
	);
	always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		Jump = 0;
		Branch = 0;
		Zero = 0;
		dirJump_address = 0;
		pcIn = 0;
		extendedBits = 0;
		#100;

		// Add stimulus here

	end
      
endmodule

