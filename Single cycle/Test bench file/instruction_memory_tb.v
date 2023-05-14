`timescale 1ns / 1ps
module instruction_memory_tb;

	// Inputs
	reg [31:0] read_add;

	// Outputs
	wire [31:0] instruction;

	// Instantiate the Unit Under Test (UUT)
	instruction_memory uut (
		.read_add(read_add), 
		.instruction(instruction)
	);

	initial begin
		read_add = 0;
		#100;
		read_add = 4;
		#100;

        
		// Add stimulus here

	end
      
endmodule

