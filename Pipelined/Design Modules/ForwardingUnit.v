module ForwardingUnit(forwardA, forwardB, Rs, Rt, destreg1, destreg2, RegWrite1, RegWrite2);	
// Rs = ID_EX.Rs; Rt = ID_EX.Rt; 
//destreg1 = EX_MEM.destination_reg; destreg2 = MEM_WB.destination_reg; 
//RegWrite1 = EX_MEM.control_signals.RegWrite;
// RegWrite2 = MEM_WB.control_signals.RegWrite
	input RegWrite1, RegWrite2;
	input [4:0] Rs, Rt, destreg1, destreg2;
	output reg [1:0] forwardA, forwardB;
	
	always @* begin
		if(RegWrite1 & (destreg1 != 0) & (destreg1 == Rs))
			forwardA <= 2'b10;
		else if(RegWrite2 & (destreg2!= 0) & (destreg1 != Rs) & (destreg2 == Rs))
			forwardA <= 2'b01;
		else
			forwardA <= 2'b00;
	end
	
	always @* begin
		if(RegWrite1 & (destreg1 != 0) & (destreg1 == Rt))
			forwardB <= 2'b10;
		else if(RegWrite2 & (destreg2 != 0) & (destreg1 != Rt) & (destreg2 == Rt))
			forwardB <= 2'b01;
		else
			forwardB <= 2'b00;
	end
	
endmodule