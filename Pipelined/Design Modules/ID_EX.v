module ID_EX(EX_WB, EX_M, EX_EX, EX_read_Rs, EX_read_Rt, EX_Rs, EX_Rt, EX_Rd, EX_sign_extended32,
                WB,    M,     EX,   read_Rs,    read_Rt,    Rs,    Rt,    Rd,    sign_extended32, clk,rst);

input clk,rst;
input [31:0] sign_extended32, read_Rs, read_Rt;
input [2:0] WB;   //Regdst used in the EX stage as selction line between Rt , Rd ,, Reg write , Mem to reg
input [1:0] M;    //Mem read , Mem write
input [2:0] EX;   //ALU_src for mux selection , Aluop to the Alucontrol unit
input [4:0] Rs, Rt, Rd;  //Rt to be duplicated one copy goes to the Mux with Rd and the other copy to the forwarding unit with Rs

output reg [31:0] EX_sign_extended32, EX_read_Rs, EX_read_Rt;
output reg [2:0] EX_WB;   //Reg dst used in the EX stage as selction line between Rt , Rd ,, Reg write , Mem to reg
output reg [1:0] EX_M;    //Mem read , Mem write
output reg [2:0] EX_EX;   //ALU_src for mux selection , Aluop to the Alucontrol unit
output reg [4:0] EX_Rs, EX_Rt, EX_Rd;
	
    		
always @(negedge clk) begin
case (rst)
1'b0 : begin
       EX_WB<=WB;
       EX_M<=M;
       EX_EX<=EX;
       EX_read_Rs<=read_Rs;
       EX_read_Rt<=read_Rt;
       EX_sign_extended32<=sign_extended32;
       EX_Rs<=Rs;
       EX_Rt<=Rt;
       EX_Rd<=Rd;
      end
1'b1 : begin
       EX_WB<=3'b0;
       EX_M<=2'b0;
       EX_EX<=3'b0;
       EX_read_Rs<=32'b0;
       EX_read_Rt<=32'b0;
       EX_sign_extended32<=32'b0;
       EX_Rs<=5'b0;
       EX_Rt<=5'b0;
       EX_Rd<=5'b0;
      end
endcase
end
endmodule