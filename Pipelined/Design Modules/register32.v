module register32(
    input [31:0] reg_in,
    input enable,
    input clk, rst,
    output reg [31:0] reg_out
    );
    always @(posedge clk, posedge rst) begin
        if (rst == 1) reg_out = 0;
		  else reg_out = (enable)? reg_in : reg_out;   
    end

endmodule
