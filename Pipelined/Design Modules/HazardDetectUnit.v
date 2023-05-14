module HazardDetectUnit(
    input MemRead,
    input wire [4:0] IFID_Rs, IFID_Rt, IDEX_Rt,
    output reg [2:0] stall
    );
    always @(*) 
    stall = (MemRead & ((IFID_Rs == IDEX_Rt)|(IFID_Rt == IDEX_Rt))) ? 3'b000 : 3'b111;
    
endmodule
