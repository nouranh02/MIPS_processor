module ArithLogicUnit(
    input wire [31:0] Input1,
    input wire [31:0] Input2,
    input wire [3:0] ALU_opcode,
    output reg [31:0] ALU_out,
	output wire zero
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
    //Zero Flag
    assign zero = ~(ALU_out[0] | ALU_out[1] | ALU_out[2] | ALU_out[3] | ALU_out[4] | ALU_out[5] | ALU_out[6] | ALU_out[7] | ALU_out[8] | 
		ALU_out[9] | ALU_out[10] | ALU_out[11] | ALU_out[12] | ALU_out[13] | ALU_out[14] | ALU_out[15] | ALU_out[16] | ALU_out[17] | ALU_out[18] | 
		ALU_out[19] | ALU_out[20] | ALU_out[21] | ALU_out[22] | ALU_out[23] | ALU_out[24] | ALU_out[25] | ALU_out[26] | ALU_out[27] | ALU_out[28] |
        ALU_out[29] | ALU_out[30] | ALU_out[31]);



endmodule