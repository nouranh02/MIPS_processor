module EX_MEM( MEM_WB, MEM_M, MEM_ALU_Output, MEM_read_Rt, MEM_Rd,
                   WB,     M,     ALU_Output,     read_Rt,     Rd, clk, rst);
  input clk,rst;
  input [31:0] read_Rt, ALU_Output; //read_Rt is the data to be written in memory
  input [1:0] M;  //MEM READ , MEM WRITE
  input [1:0] WB; //REG WRITE , MEM TO REG
  input [4:0] Rd;  //WRITE ADDRESS
  
  output reg [31:0] MEM_read_Rt, MEM_ALU_Output; //read_Rt is the data to be written in memory
  output reg [1:0] MEM_M;  //MEM READ , MEM WRITE
  output reg [1:0] MEM_WB; //REG WRITE , MEM TO REG
  output reg [4:0] MEM_Rd;  //WRITE ADDRESS
	
  always @(negedge clk)begin
    case (rst)
      1'b1: begin
            MEM_read_Rt<=32'b0;
            MEM_ALU_Output<=32'b0; 
            MEM_M<=2'b0;
            MEM_WB<=2'b0; 
            MEM_Rd<=5'b0;
             end
     1'b0: begin
			   MEM_read_Rt <= read_Rt;
            MEM_ALU_Output <= ALU_Output; 
            MEM_M <= M;
            MEM_WB <= WB; 
            MEM_Rd <= Rd;

           end
    endcase 
   end
endmodule