module Control(
	output reg RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, IF_flush,
	input [5:0] opcode, 
	input Comparator,
	output reg [1:0] ALUOp );

	always @(*) begin
				RegDst <= 1'b0;
				Jump <= 1'b0;
				Branch <= 1'b0;
				MemRead <= 1'b0;
				MemtoReg <= 1'b0;
				MemWrite <= 1'b0;
				ALUSrc <= 1'b0;
				RegWrite <= 1'b0;
				ALUOp <= 2'bXX;
				IF_flush <= 0;

	case(opcode)

		6'b000000: //r-controls
		begin
			RegDst <= 1'b1;
			RegWrite <= 1'b1;
			ALUOp <= 2'b10;
		end

		6'b001000: //addi-controls
		begin
			ALUSrc <= 1'b1;
			RegWrite <= 1'b1;
			ALUOp <= 2'b11;
		end

		6'b100011: //lw-controls
		begin
			MemRead <= 1'b1;
			MemtoReg <= 1'b1;
			ALUSrc <= 1'b1;
			RegWrite <= 1'b1;
			ALUOp <= 2'b00;
		end

		6'b101011: //sw-controls
		begin
			MemWrite <= 1'b1;
			ALUSrc <= 1'b1;
			ALUOp <= 2'b00;
		end

		6'b000100: //beq-controls
		begin
			RegDst <= 1'b1;
			Branch <= 1'b1;
			MemtoReg <= 1'b1;
			ALUOp <= 2'b01;
			IF_flush <= (Comparator)? 1'b1 : 1'b0;
		end

		6'b000010:
			begin		//j-controls
			Jump <= 1'b1;
			IF_flush <= 1'b1;
			end
			
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
			ALUOp <= 2'bXX;
			IF_flush <= 0;

		end
		endcase
	end

endmodule