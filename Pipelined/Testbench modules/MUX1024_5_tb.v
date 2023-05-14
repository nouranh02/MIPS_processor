`timescale 1ns / 1ps

module MUX1024_5_tb;

	// Inputs
	reg [31:0] MUXin0;
	reg [31:0] MUXin1;
	reg [31:0] MUXin2;
	reg [31:0] MUXin3;
	reg [31:0] MUXin4;
	reg [31:0] MUXin5;
	reg [31:0] MUXin6;
	reg [31:0] MUXin7;
	reg [31:0] MUXin8;
	reg [31:0] MUXin9;
	reg [31:0] MUXin10;
	reg [31:0] MUXin11;
	reg [31:0] MUXin12;
	reg [31:0] MUXin13;
	reg [31:0] MUXin14;
	reg [31:0] MUXin15;
	reg [31:0] MUXin16;
	reg [31:0] MUXin17;
	reg [31:0] MUXin18;
	reg [31:0] MUXin19;
	reg [31:0] MUXin20;
	reg [31:0] MUXin21;
	reg [31:0] MUXin22;
	reg [31:0] MUXin23;
	reg [31:0] MUXin24;
	reg [31:0] MUXin25;
	reg [31:0] MUXin26;
	reg [31:0] MUXin27;
	reg [31:0] MUXin28;
	reg [31:0] MUXin29;
	reg [31:0] MUXin30;
	reg [31:0] MUXin31;
	reg [4:0] sel;

	// Outputs
	wire [31:0] MUX_out;

	// Instantiate the Unit Under Test (UUT)
	MUX1024_5 uut (
		.MUXin0(MUXin0), 
		.MUXin1(MUXin1), 
		.MUXin2(MUXin2), 
		.MUXin3(MUXin3), 
		.MUXin4(MUXin4), 
		.MUXin5(MUXin5), 
		.MUXin6(MUXin6), 
		.MUXin7(MUXin7), 
		.MUXin8(MUXin8), 
		.MUXin9(MUXin9), 
		.MUXin10(MUXin10), 
		.MUXin11(MUXin11), 
		.MUXin12(MUXin12), 
		.MUXin13(MUXin13), 
		.MUXin14(MUXin14), 
		.MUXin15(MUXin15), 
		.MUXin16(MUXin16), 
		.MUXin17(MUXin17), 
		.MUXin18(MUXin18), 
		.MUXin19(MUXin19), 
		.MUXin20(MUXin20), 
		.MUXin21(MUXin21), 
		.MUXin22(MUXin22), 
		.MUXin23(MUXin23), 
		.MUXin24(MUXin24), 
		.MUXin25(MUXin25), 
		.MUXin26(MUXin26), 
		.MUXin27(MUXin27), 
		.MUXin28(MUXin28), 
		.MUXin29(MUXin29), 
		.MUXin30(MUXin30), 
		.MUXin31(MUXin31), 
		.sel(sel), 
		.MUX_out(MUX_out)
	);

	initial begin
		// Initialize Inputs
		MUXin0 = 32'h0;
		MUXin1 = 32'h1;
		MUXin2 = 32'h2;
		MUXin3 = 32'h3;
		MUXin4 = 32'h4;
		MUXin5 = 32'h5;
		MUXin6 = 32'h6;
		MUXin7 = 32'h7;
		MUXin8 = 32'h8;
		MUXin9 = 32'h9;
		MUXin10 = 32'hA;
		MUXin11 = 0;
		MUXin12 = 0;
		MUXin13 = 0;
		MUXin14 = 0;
		MUXin15 = 0;
		MUXin16 = 0;
		MUXin17 = 0;
		MUXin18 = 0;
		MUXin19 = 0;
		MUXin20 = 0;
		MUXin21 = 0;
		MUXin22 = 0;
		MUXin23 = 0;
		MUXin24 = 0;
		MUXin25 = 0;
		MUXin26 = 0;
		MUXin27 = 0;
		MUXin28 = 0;
		MUXin29 = 0;
		MUXin30 = 0;
		MUXin31 = 0;
		sel = 5'd0;
		#100;
		sel = 5'd1;
		#100;
		sel = 5'd2;
		#100;
		sel = 5'd3;
		#100;
		sel = 5'd4;
		#100;
		sel = 5'd5;
		#100;
		sel = 5'd6;
		#100;
		sel = 5'd7;
		#100;
		sel = 5'd8;
		#100;
		sel = 5'd9;
		#100;
		sel = 5'd10;
		#100;

        
		// Add stimulus here

	end
      
endmodule

