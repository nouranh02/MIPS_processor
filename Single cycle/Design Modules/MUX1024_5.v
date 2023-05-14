module MUX1024_5(
    input wire [31:0] MUXin0,MUXin1,MUXin2,MUXin3,MUXin4,MUXin5,MUXin6,MUXin7,
    MUXin8,MUXin9,MUXin10,MUXin11,MUXin12,MUXin13,MUXin14,MUXin15,MUXin16,MUXin17,
    MUXin18,MUXin19,MUXin20,MUXin21,MUXin22,MUXin23,MUXin24,MUXin25,MUXin26,MUXin27,MUXin28,MUXin29,MUXin30,MUXin31,
    input wire [4:0] sel,
    output reg [31:0] MUX_out
    );
    
    always @(*) begin
        case (sel)
        5'd0: MUX_out = MUXin0;
        5'd1: MUX_out = MUXin1;
        5'd2: MUX_out = MUXin2;
        5'd3: MUX_out = MUXin3;
        5'd4: MUX_out = MUXin4;
        5'd5: MUX_out = MUXin5;
        5'd6: MUX_out = MUXin6;
        5'd7: MUX_out = MUXin7;
        5'd8: MUX_out = MUXin8;
        5'd9: MUX_out = MUXin9;
        5'd10: MUX_out = MUXin10;
        5'd11: MUX_out = MUXin11;
        5'd12: MUX_out = MUXin12;
        5'd13: MUX_out = MUXin13;
        5'd14: MUX_out = MUXin14;
        5'd15: MUX_out = MUXin15;
        5'd16: MUX_out = MUXin16;
        5'd17: MUX_out = MUXin17;
        5'd18: MUX_out = MUXin18;
        5'd19: MUX_out = MUXin19;
        5'd20: MUX_out = MUXin20;
        5'd21: MUX_out = MUXin21;
        5'd22: MUX_out = MUXin22;
        5'd23: MUX_out = MUXin23;
        5'd24: MUX_out = MUXin24;
        5'd25: MUX_out = MUXin25;
        5'd26: MUX_out = MUXin26;
        5'd27: MUX_out = MUXin27;
        5'd28: MUX_out = MUXin28;
        5'd29: MUX_out = MUXin29;
        5'd30: MUX_out = MUXin30;
        5'd31: MUX_out = MUXin31;
 
        endcase        
    end


endmodule
