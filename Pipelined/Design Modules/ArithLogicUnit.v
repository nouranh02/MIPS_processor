module ArithLogicUnit(
    input wire [31:0] Input1,
    input wire [31:0] Input2,
    input wire [3:0] ALU_opcode,
    output reg [31:0] ALU_out
    );
    always @(*) begin
        case (ALU_opcode)
            4'b0010: ALU_out = Input1 + Input2;
            4'b0110: ALU_out = Input1 - Input2;													  
            4'b0000: ALU_out = Input1 & Input2;
            4'b0001: ALU_out = Input1 | Input2;
            4'b0111: ALU_out = (Input1 < Input2)? 1 : 0; // still don't know if there is a better way to use the subtraction output with the overflow flow flag in order to detect the slt output
            default:	ALU_out = 0;
 		endcase
    end



endmodule