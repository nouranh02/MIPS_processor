module instruction_memory(read_add,instruction);
    input [31:0] read_add;
    output reg [31:0]  instruction;
	 reg [7:0] mem [63:0];//needs to be expanded 2^32
initial begin 
      $readmemb("instruction_mem.txt", mem);
	end
   always@(*)
   begin
      instruction[31:0]<={mem[read_add]
      ,mem[read_add+1]
      ,mem[read_add+2]
      ,mem[read_add+3]};
     end
endmodule