module Alu_ctrl(Alu_op,funct,Alu_ctrl);
  input [1:0]Alu_op;
  input [5:0]funct;
  output reg[3:0]Alu_ctrl;
  
    always @(*) begin
      case (Alu_op)
        2'b00: Alu_ctrl=4'b0010;
        2'b01: Alu_ctrl=4'b0110;
        2'b11: Alu_ctrl=4'b0010;
        2'b10: case (funct)
		    6'b100000: Alu_ctrl=4'b0010;
          6'b100010: Alu_ctrl=4'b0110;
          6'b100100: Alu_ctrl=4'b0000;
          6'b100101: Alu_ctrl=4'b0001;
          6'b101010: Alu_ctrl=4'b0111;
          default: Alu_ctrl=4'bXXXX;
        endcase
        default: Alu_ctrl=4'bXXXX;
      endcase
    end
endmodule