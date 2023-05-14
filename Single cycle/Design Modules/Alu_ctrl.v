module Alu_ctrl(Alu_op,funct,Alu_ctrl);
  input [1:0]Alu_op;
  input [5:0]funct;
  output reg[3:0]Alu_ctrl;
  
  /*always@(*) begin
  if (Alu_op==2'b00)  Alu_ctrl=4'b0010;  //lw,sw-->add 
  else if(Alu_op==2'b01) Alu_ctrl=4'b0110; //beq-->sub
  else if(Alu_op==2'b11)  Alu_ctrl=4'b0010; //addi
  else if(Alu_op==2'b10) 
  begin
      if(funct== 6'b100000) Alu_ctrl=4'b0010;//add
      else if(funct== 6'b100010) Alu_ctrl=4'b0110;//sub
      else  if(funct==6'b100100) Alu_ctrl=4'b0000;//and
      else if(funct== 6'b100101) Alu_ctrl=4'b0001;//or
      else if (funct==6'b101010) Alu_ctrl=4'b0111;//slt
  end   // lacks default mode
  else Alu_ctrl = 32'bX;
end*/
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