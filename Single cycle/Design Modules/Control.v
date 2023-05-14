module Control(
	output reg RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite,
	input [5:0] opcode,
	output reg [1:0] ALUOp );

	always @(opcode) begin
				RegDst <= 1'b0;
				Jump <= 1'b0;
				Branch <= 1'b0;
				MemRead <= 1'b0;
				MemtoReg <= 1'b0;
				MemWrite <= 1'b0;
				ALUSrc <= 1'b0;
				RegWrite <= 1'b0;
				ALUOp <= 2'bXX;

	case(opcode)

		6'b000000: //r-controls
		begin
			RegDst <= 1'b1;
			Jump <= 1'b0;
			Branch <= 1'b0;
//			MemRead <= 1'bz;
			MemtoReg <= 1'b0;
			MemWrite <= 1'b0;
			ALUSrc <= 1'b0;
			RegWrite <= 1'b1;
			ALUOp <= 2'b10;
		end

		6'b001000: //addi-controls
		begin
			RegDst <= 1'b0;
			Jump <= 1'b0;
			Branch <= 1'b0;
//			MemRead <= 1'bz;
			MemtoReg <= 1'b0;
			MemWrite <= 1'b0;
			ALUSrc <= 1'b1;
			RegWrite <= 1'b1;
			ALUOp <= 2'b11;
		end

		6'b100011: //lw-controls
		begin
			RegDst <= 1'b0;
			Jump <= 1'b0;
			Branch <= 1'b0;
			MemRead <= 1'b1;
			MemtoReg <= 1'b1;
			MemWrite <= 1'b0;
			ALUSrc <= 1'b1;
			RegWrite <= 1'b1;
			ALUOp <= 2'b00;
		end

		6'b101011: //sw-controls
		begin
//			RegDst <= 1'bz;
			Jump <= 1'b0;
			Branch <= 1'b0;
//			MemRead <= 1'bz;
//			MemtoReg <= 1'bz;
			MemWrite <= 1'b1;
			ALUSrc <= 1'b1;
			RegWrite <= 1'b0;
			ALUOp <= 2'b00;
		end

		6'b000100: //beq-controls
		begin
			RegDst <= 1'b1;
			Jump <= 1'b0;
			Branch <= 1'b1;
			MemRead <= 1'b0;
			MemtoReg <= 1'b1;
			MemWrite <= 1'b0;
			ALUSrc <= 1'b0;
			RegWrite <= 1'b0;
			ALUOp <= 2'b01;
		end

		6'b000010: //j-controls
			Jump <= 1'b1;

		default:
		begin
			RegDst <= 1'b0;
			Jump <= 1'b0;
			Branch <= 1'b0;
			MemRead <= 1'b0;
			MemtoReg <= 1'b0;
			MemWrite <= 1'b0;
			ALUSrc <= 1'b0;
			RegWrite <= 1'b0;
//			ALUOp <= 2'bzz;
		end
		endcase
	end

endmodule