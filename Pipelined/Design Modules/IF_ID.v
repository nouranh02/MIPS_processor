module IF_ID(ID_PC,ID_instruction, instruction, newPC, clk, rst, en);
	
input clk,rst,en;
input [31:0] instruction, newPC;
output reg [31:0] ID_instruction;
output reg [31:0] ID_PC;
	
	always @(negedge clk) begin
	if(rst) begin
            ID_PC<=32'b0;
            ID_instruction<=32'b0;
			  end
	else begin
			if(en) begin
           ID_PC<=newPC;
           ID_instruction<=instruction;
         end
			else begin
           ID_PC<=ID_PC;
           ID_instruction<=ID_instruction;
         end
		end
  end
endmodule
