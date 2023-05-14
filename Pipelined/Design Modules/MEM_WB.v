module MEM_WB( WB_WB, WB_memory_Output, WB_ALU_Output, WB_Rd
              ,   WB,    memory_Output,    ALU_Output,    Rd, clk,rst);
   
   input clk,rst;
   input [31:0] ALU_Output, memory_Output;
   input [4:0] Rd;
   input [1:0] WB;
    
   output reg [31:0] WB_ALU_Output, WB_memory_Output;
   output reg [4:0] WB_Rd;
   output reg [1:0] WB_WB;

  always @(negedge clk)begin
    case (rst)
    1'b1  : begin
		           WB_ALU_Output<=0;
               WB_memory_Output<=0;
               WB_Rd<=0;
               WB_WB<=0;
             end
     
    1'b0 : begin
	           WB_ALU_Output<=ALU_Output;
             WB_memory_Output<=memory_Output;
             WB_Rd<=Rd;
             WB_WB<=WB;
          end
    endcase
  end
endmodule