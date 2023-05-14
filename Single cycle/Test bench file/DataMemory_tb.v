`timescale 1ns / 1ps

module DataMemory_tb;

	// Inputs
	reg [31:0] DataIn;
	reg [31:0] Address;
	reg MemRead;
	reg MemWrite;
	reg clk;

	// Outputs
	wire [31:0] DataOut;

	// Instantiate the Unit Under Test (UUT)
	DataMemory uut (
		.DataIn(DataIn), 
		.Address(Address), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.clk(clk), 
		.DataOut(DataOut)
	);
	always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		DataIn = 32'hABCD;
		Address = 0;
		MemRead = 0;
		MemWrite = 1;
		clk = 0;
		#100;
		DataIn = 32'h1234;
		Address = 4;
		MemRead = 0;
		MemWrite = 1;
		#100;
		DataIn = 32'h1234;
		Address = 4;
		MemRead = 1;
		MemWrite = 0;
		#100;
		DataIn = 32'h1234;
		Address = 0;
		MemRead = 1;
		MemWrite = 0;
		#100;
		DataIn = 32'h1234;
		Address = 0;
		MemRead = 1;
		MemWrite = 1;
		#100;
		DataIn = 32'hFFFF;
		Address = 0;
		MemRead = 1;
		MemWrite = 0;
		#100;

	end
      
endmodule

