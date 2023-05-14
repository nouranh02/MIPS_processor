`timescale 1ns / 1ps
module ALU_tb;

	// Inputs
	reg [31:0] Input1;
	reg [31:0] Input2;
	reg [3:0] ALU_opcode;

	// Outputs
	wire [31:0] ALU_out;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	ArithLogicUnit uut (
		.Input1(Input1), 
		.Input2(Input2), 
		.ALU_opcode(ALU_opcode), 
		.ALU_out(ALU_out),  
		.zero(zero)
	);

	initial begin
		Input1 = 32'h0000ABCD;
		Input2 = 32'h00001234;
		ALU_opcode = 4'b0010; //add op
		#100;
		Input1 = 32'h00000000;
		Input2 = 32'h00001234;
		ALU_opcode = 4'b0110; //Sub op
		#100;
		Input1 = 32'h0000ABCD;
		Input2 = 32'h00001234;
		ALU_opcode = 4'b0000; //and op
		#100;
		Input1 = 32'h0000ABCD;
		Input2 = 32'h00001234;
		ALU_opcode = 4'b0001; //or op
		#100;
		Input1 = 32'h0000ABCD;
		Input2 = 32'h00001234;
		ALU_opcode = 4'b1111; //xor op
		#100;
		Input1 = 32'h0000ABCD;
		Input2 = 32'h0000ABCD;
		ALU_opcode = 4'b0111; //slt op
		#100;
		Input1 = 32'h00000000;
		Input2 = 32'h00001234;
		ALU_opcode = 4'b0111; //slt op
		#100;

        

	end
      
endmodule

