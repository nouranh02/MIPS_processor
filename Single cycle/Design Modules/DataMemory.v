module DataMemory(
    input [31:0] DataIn, Address,
    input MemRead, MemWrite, clk,
    output reg [31:0] DataOut
    );
    reg [7:0] mem [63:0]; // 64 registers, each register has a width of 8 bit. We may need to add more regs.
    always @ (negedge clk)
    case ({MemRead, MemWrite})
    2'b10  : DataOut <= {mem[Address]
      ,mem[Address+1]
      ,mem[Address+2]
      ,mem[Address+3]};
    2'b01  :begin
      mem[Address]<= DataIn[31:24];
      mem[Address+1]<= DataIn[23:16];
      mem[Address+2]<= DataIn[15:8];
      mem[Address+3] <= DataIn[7:0];
        end
    default:begin
      mem[Address]<=mem[Address];
      mem[Address+1]<=mem[Address+1];
      mem[Address+2]<=mem[Address+2];
      mem[Address+3] <= mem[Address+3];
             DataOut <= 32'hXXXX_XXXX;
            end 
    endcase
         

endmodule
