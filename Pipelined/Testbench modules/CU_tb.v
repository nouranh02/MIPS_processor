module Control_tb ();

	reg [6:0] opcode_tb;
	wire RegDst_tb, Jump_tb, Branch_tb, MemRead_tb, MemtoReg_tb, MemWrite_tb, ALUSrc_tb, RegWrite_tb;
	wire [1:0] ALUOp_tb;
	
		//instantiate design instance
	Control DUT (
	.opcode(opcode_tb),
	.RegDst(RegDst_tb), .Jump(Jump_tb),
	.Branch(Branch_tb), .MemRead(MemRead_tb),
	.MemtoReg(MemtoReg_tb), .MemWrite(MemWrite_tb),
	.ALUSrc(ALUSrc_tb), .RegWrite(RegWrite),
	.ALUOp(ALUOp_tb)
	);

	initial begin
	$dumpfile("Control.vcd");
	$dumpvars;

		opcode_tb = 6'b000000;
		#1
		opcode_tb = 6'b001000;
		#1
		opcode_tb = 6'b100011;
		#1
		opcode_tb = 6'b101011;
		#1
		opcode_tb = 6'b000100;
		#1
		opcode_tb = 6'b000010;
		#1

	$finish;
	end
endmodule