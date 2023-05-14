`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:40:31 01/03/2023
// Design Name:   MEM_WB
// Module Name:   D:/Fall 22 COMM/Computer organization/MIPS project/MIPS_processor/MEMWB_tb.v
// Project Name:  MIPS_processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MEM_WB
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MEMWB_tb;

	// Inputs
	reg [1:0] WB;
	reg [31:0] memory_Output;
	reg [31:0] ALU_Output;
	reg [4:0] Rd;
	reg clk;
	reg rst;

	// Outputs
	wire [1:0] WB_WB;
	wire [31:0] WB_memory_Output;
	wire [31:0] WB_ALU_Output;
	wire [4:0] WB_Rd;

	// Instantiate the Unit Under Test (UUT)
	MEM_WB uut (
		.WB_WB(WB_WB), 
		.WB_memory_Output(WB_memory_Output), 
		.WB_ALU_Output(WB_ALU_Output), 
		.WB_Rd(WB_Rd), 
		.WB(WB), 
		.memory_Output(memory_Output), 
		.ALU_Output(ALU_Output), 
		.Rd(Rd), 
		.clk(clk), 
		.rst(rst)
	);
	always #10 clk = ~clk;
	initial begin
		// Initialize Inputs
		WB = 1;
		memory_Output = 1;
		ALU_Output = 0;
		Rd = 1;
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
		rst = 0;
		// Add stimulus here

	end
      
endmodule

