module RegisterFile(
    input [4:0] ReadReg1,
    input [4:0] ReadReg2,
    input [4:0] WriteReg,
    input [31:0] WriteData,
    input RegWrite_ctrl,
    input clk, rst,
    output [31:0] ReadData1,
    output [31:0] ReadData2
    );
    wire [31:0] decoderToAnd, andToEnable,
    regToMux0,regToMux1,regToMux2,regToMux3,regToMux4,regToMux5,regToMux6,regToMux7,regToMux8,regToMux9,regToMux10,
    regToMux11,regToMux12,regToMux13,regToMux14,regToMux15,regToMux16,regToMux17,regToMux18,regToMux19,regToMux20,regToMux21,regToMux22,
    regToMux23,regToMux24,regToMux25,regToMux26,regToMux27,regToMux28,regToMux29,regToMux30,regToMux31;
    
    assign andToEnable[0] = 0;
    assign andToEnable[1] = decoderToAnd[1] & RegWrite_ctrl;
    assign andToEnable[2] = decoderToAnd[2] & RegWrite_ctrl;
    assign andToEnable[3] = decoderToAnd[3] & RegWrite_ctrl;
    assign andToEnable[4] = decoderToAnd[4] & RegWrite_ctrl;
    assign andToEnable[5] = decoderToAnd[5] & RegWrite_ctrl;
    assign andToEnable[6] = decoderToAnd[6] & RegWrite_ctrl;
    assign andToEnable[7] = decoderToAnd[7] & RegWrite_ctrl;
    assign andToEnable[8] = decoderToAnd[8] & RegWrite_ctrl;
    assign andToEnable[9] = decoderToAnd[9] & RegWrite_ctrl;
    assign andToEnable[11] = decoderToAnd[10] & RegWrite_ctrl;
    assign andToEnable[10] = decoderToAnd[11] & RegWrite_ctrl;
    assign andToEnable[12] = decoderToAnd[12] & RegWrite_ctrl;
    assign andToEnable[13] = decoderToAnd[13] & RegWrite_ctrl;
    assign andToEnable[14] = decoderToAnd[14] & RegWrite_ctrl;
    assign andToEnable[15] = decoderToAnd[15] & RegWrite_ctrl;
    assign andToEnable[16] = decoderToAnd[16] & RegWrite_ctrl;
    assign andToEnable[17] = decoderToAnd[17] & RegWrite_ctrl;
    assign andToEnable[18] = decoderToAnd[18] & RegWrite_ctrl;
    assign andToEnable[19] = decoderToAnd[19] & RegWrite_ctrl;
    assign andToEnable[20] = decoderToAnd[20] & RegWrite_ctrl;
    assign andToEnable[21] = decoderToAnd[21] & RegWrite_ctrl;
    assign andToEnable[22] = decoderToAnd[22] & RegWrite_ctrl;
    assign andToEnable[23] = decoderToAnd[23] & RegWrite_ctrl;
    assign andToEnable[24] = decoderToAnd[24] & RegWrite_ctrl;
    assign andToEnable[25] = decoderToAnd[25] & RegWrite_ctrl;
    assign andToEnable[26] = decoderToAnd[26] & RegWrite_ctrl;
    assign andToEnable[27] = decoderToAnd[27] & RegWrite_ctrl;
    assign andToEnable[28] = decoderToAnd[28] & RegWrite_ctrl;
    assign andToEnable[29] = decoderToAnd[29] & RegWrite_ctrl;
    assign andToEnable[30] = decoderToAnd[30] & RegWrite_ctrl;
    assign andToEnable[31] = decoderToAnd[31] & RegWrite_ctrl;
    
    
    Decoder32_5 Decoder
    (.decoder_in (WriteReg),
     .decoder_out(decoderToAnd));

    register32 reg0
    (.reg_in(0),
     .enable(andToEnable[0]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux0)
    );
    register32 reg1
    (.reg_in(WriteData),
     .enable(andToEnable[1]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux1)
    );
    register32 reg2
    (.reg_in(WriteData),
     .enable(andToEnable[2]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux2)
    );
    register32 reg3
    (.reg_in(WriteData),
     .enable(andToEnable[3]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux3)
    );
    register32 reg4
    (.reg_in(WriteData),
     .enable(andToEnable[4]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux4)
    );
    register32 reg5
    (.reg_in(WriteData),
     .enable(andToEnable[5]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux5)
    );
    register32 reg6
    (.reg_in(WriteData),
     .enable(andToEnable[6]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux6)
    );
    register32 reg7
    (.reg_in(WriteData),
     .enable(andToEnable[7]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux7)
    );
    register32 reg8
    (.reg_in(WriteData),
     .enable(andToEnable[8]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux8)
    );
    register32 reg9
    (.reg_in(WriteData),
     .enable(andToEnable[9]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux9)
    );
    register32 reg10
    (.reg_in(WriteData),
     .enable(andToEnable[10]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux10)
    );
    register32 reg11
    (.reg_in(WriteData),
     .enable(andToEnable[11]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux11)
    );
    register32 reg12
    (.reg_in(WriteData),
     .enable(andToEnable[12]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux12)
    );
    register32 reg13
    (.reg_in(WriteData),
     .enable(andToEnable[13]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux13)
    );
    register32 reg14
    (.reg_in(WriteData),
     .enable(andToEnable[14]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux14)
    );
    register32 reg15
    (.reg_in(WriteData),
     .enable(andToEnable[15]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux15)
    );
    register32 reg16
    (.reg_in(WriteData),
     .enable(andToEnable[16]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux16)
    );
    register32 reg17
    (.reg_in(WriteData),
     .enable(andToEnable[17]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux17)
    );
    register32 reg18
    (.reg_in(WriteData),
     .enable(andToEnable[18]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux18)
    );
    register32 reg19
    (.reg_in(WriteData),
     .enable(andToEnable[19]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux19)
    );
    register32 reg20
    (.reg_in(WriteData),
     .enable(andToEnable[20]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux20)
    );
    register32 reg21
    (.reg_in(WriteData),
     .enable(andToEnable[21]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux21)
    );
    register32 reg22
    (.reg_in(WriteData),
     .enable(andToEnable[22]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux22)
    );
    register32 reg23
    (.reg_in(WriteData),
     .enable(andToEnable[23]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux23)
    );
    register32 reg24
    (.reg_in(WriteData),
     .enable(andToEnable[24]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux24)
    );
    register32 reg25
    (.reg_in(WriteData),
     .enable(andToEnable[25]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux25)
    );
    register32 reg26
    (.reg_in(WriteData),
     .enable(andToEnable[26]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux26)
    );
    register32 reg27
    (.reg_in(WriteData),
     .enable(andToEnable[27]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux27)
    );
    register32 reg28
    (.reg_in(WriteData),
     .enable(andToEnable[28]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux28)
    );
    register32 reg29
    (.reg_in(WriteData),
     .enable(andToEnable[29]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux29)
    );
    register32 reg30
    (.reg_in(WriteData),
     .enable(andToEnable[30]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux30)
    );
    register32 reg31
    (.reg_in(WriteData),
     .enable(andToEnable[31]),
     .clk(clk), .rst(rst),
     .reg_out(regToMux31)
    );
      
    MUX1024_5 MUX1
    (.MUXin0(regToMux0),
     .MUXin1(regToMux1),
     .MUXin2(regToMux2),
     .MUXin3(regToMux3),
     .MUXin4(regToMux4),
     .MUXin5(regToMux5),
     .MUXin6(regToMux6),
     .MUXin7(regToMux7),
     .MUXin8(regToMux8),
     .MUXin9(regToMux9),
     .MUXin10(regToMux10),
     .MUXin11(regToMux11),
     .MUXin12(regToMux12),
     .MUXin13(regToMux13),
     .MUXin14(regToMux14),
     .MUXin15(regToMux15),
     .MUXin16(regToMux16),
     .MUXin17(regToMux17),
     .MUXin18(regToMux18),
     .MUXin19(regToMux19),
     .MUXin20(regToMux20),
     .MUXin21(regToMux21),
     .MUXin22(regToMux22),
     .MUXin23(regToMux23),
     .MUXin24(regToMux24),
     .MUXin25(regToMux25),
     .MUXin26(regToMux26),
     .MUXin27(regToMux27),
     .MUXin28(regToMux28),
     .MUXin29(regToMux29),
     .MUXin30(regToMux30),
     .MUXin31(regToMux31),
     .sel(ReadReg1),
     .MUX_out(ReadData1)
    );
    MUX1024_5 MUX2
    (.MUXin0(regToMux0),
     .MUXin1(regToMux1),
     .MUXin2(regToMux2),
     .MUXin3(regToMux3),
     .MUXin4(regToMux4),
     .MUXin5(regToMux5),
     .MUXin6(regToMux6),
     .MUXin7(regToMux7),
     .MUXin8(regToMux8),
     .MUXin9(regToMux9),
     .MUXin10(regToMux10),
     .MUXin11(regToMux11),
     .MUXin12(regToMux12),
     .MUXin13(regToMux13),
     .MUXin14(regToMux14),
     .MUXin15(regToMux15),
     .MUXin16(regToMux16),
     .MUXin17(regToMux17),
     .MUXin18(regToMux18),
     .MUXin19(regToMux19),
     .MUXin20(regToMux20),
     .MUXin21(regToMux21),
     .MUXin22(regToMux22),
     .MUXin23(regToMux23),
     .MUXin24(regToMux24),
     .MUXin25(regToMux25),
     .MUXin26(regToMux26),
     .MUXin27(regToMux27),
     .MUXin28(regToMux28),
     .MUXin29(regToMux29),
     .MUXin30(regToMux30),
     .MUXin31(regToMux31),
     .sel(ReadReg2),
     .MUX_out(ReadData2)
    );

    




endmodule
