`timescale 1ns / 1ps
module Alu_ctrl_tb ();
  reg[1:0]Alu_op_tb;
   reg [5:0]funct_tb;
  wire[3:0]Alu_ctrl_tb;
	
		//instantiate design instance
	Alu_ctrl DUT (
      .Alu_op(Alu_op_tb),.funct(funct_tb),.Alu_ctrl(Alu_ctrl_tb)
	);

	initial begin
	$dumpfile("Control.vcd");
	$dumpvars;
       Alu_op_tb=2'b00;
      funct_tb=6'b100000;
		#1
         Alu_op_tb=2'b01;
      funct_tb=6'b100000;
		#1
         Alu_op_tb=2'b11;
      funct_tb=6'b100000;
		#1
      Alu_op_tb=2'b10;
      funct_tb=6'b100000;
		#1
	Alu_op_tb=2'b10;
      funct_tb=6'b100101;
		#1

	$finish;
	end
endmodule