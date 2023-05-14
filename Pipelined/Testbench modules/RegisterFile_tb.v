`timescale 1ns / 1ps


module RegisterFile_tb;

	// Inputs
	reg [4:0] ReadReg1;
	reg [4:0] ReadReg2;
	reg [4:0] WriteReg;
	reg [31:0] WriteData;
	reg RegWrite_ctrl;
	reg clk;

	// Outputs
	wire [31:0] ReadData1;
	wire [31:0] ReadData2;

	// Instantiate the Unit Under Test (UUT)
	RegisterFile uut (
		.ReadReg1(ReadReg1), 
		.ReadReg2(ReadReg2), 
		.WriteReg(WriteReg), 
		.WriteData(WriteData), 
		.RegWrite_ctrl(RegWrite_ctrl), 
		.clk(clk), 
		.ReadData1(ReadData1), 
		.ReadData2(ReadData2)
	);
	always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		ReadReg1 = 5'd1;
		ReadReg2 = 5'd2;
		WriteReg = 5'd1;
		WriteData = 32'hABCD;
		RegWrite_ctrl = 1;
		clk = 0;
		#100;
		ReadReg1 = 5'd0;
		WriteReg = 5'd2;
		WriteData = 32'h1234;
		#100;
        
		// Add stimulus here

	end
      
endmodule

