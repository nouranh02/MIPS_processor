module MIPS_pipelined(input CLK, RST);

   wire [31:0] current_pc, pc_plus_4, pc_plus_4_out, branch_address, jump_address, Ins, IFID_inst;
   reg [31:0] ImmExt, next_pc, WriteData, MUX_A, MUX_B,MUX_C, WB_data;
   wire [31:0] instruction, ReadData1, ReadData2, alu_result, ReadData_Mem;
   wire [25:0] dirJump_address;
   wire [15:0] Imm;
   wire  IF_flush, RegWrite, ALUSrc, MemRead, MemWrite, MemtoReg, RegDst, Jump, BranchFlag, EN, hazard_to_MUX;
   reg comparator;
   wire [5:0] CUopcode;
   wire [4:0] Rs, Rt1, Rt2, Rd, destreg2;
   wire [3:0] ALUopcode;
   wire [1:0] ALUop;
   wire [63:0] IF_IDoutput;
   wire [125:0] IDEX_out;
   wire [9:0] control_signals;
   wire [9:0] IDEXcontrol_signals;
   wire [4:0] IDEX_Rs, IDEX_Rt1, IDEX_Rt2, IDEX_Rd;
   reg [4:0] destreg1;
   wire [31:0]  EXMEM_aluOut, IDEXread_Rs, IDEXread_Rt, regtoDataMem, IDEXsign_extended32;
   wire [4:0]  EXMEM_destreg1;
   wire [3:0] EXMEMcontrol_signals;
   wire [31:0] MEMWBmemory_data, MEMWBalu_out;
   wire [1:0] MEMWBcontrol_signals, forwardA, forwardB;
   wire [70:0] MEMWB_out;
   wire [2:0] stall_signal;
   reg [9:0] MUXtoIDEX;
   wire [72:0] EXMEM_out;
   wire [1:0] EXMEM_M;  //MEM READ , MEM WRITE
   wire [1:0] EXMEM_WB; //REG WRITE , MEM TO REG
   wire [2:0] IDEX_WB;   //Reg dst used in the EX stage as selction line between Rt , Rd ,, Reg write , Mem to reg
   wire [1:0] IDEX_M;    //Mem read , Mem write
   wire [2:0] IDEX_EX;   //ALU_src for mux selection , Aluop to the Alucontrol unit
   wire [1:0] MEMWB_WB;


   PC pc
   (.clk(CLK),
    .rst(RST),
    .PC_in(next_pc),
    .PC_out(current_pc),
    .en(stall_signal[1]));

   always @(pc_plus_4, branch_address, Jump, jump_address, IF_flush) begin
     next_pc = (IF_flush)? branch_address : pc_plus_4;
     next_pc = (Jump)? jump_address : next_pc;
   end 
   assign pc_plus_4 = current_pc + 4;
   
   instruction_memory instMem (.read_add(current_pc), .instruction(Ins));
	
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////

   IF_ID IFID
   (.ID_instruction(IFID_inst),
    .ID_PC(pc_plus_4_out),
    .instruction(Ins),
    .newPC(pc_plus_4),
    .clk(CLK),
    .rst((RST | IF_flush)),
    .en(stall_signal[2]));

   assign Rs = IFID_inst[25:21];
	assign Rt1 = IFID_inst[20:16];
	assign Rd = IFID_inst[15:11];
	assign Imm = IFID_inst[15:0];
   assign CUopcode = IFID_inst[31:26];
	assign dirJump_address = IFID_inst[25:0];
   assign branch_address = pc_plus_4_out + (ImmExt << 2);
   assign jump_address = {pc_plus_4_out[31:28], dirJump_address, 2'b00};
   always @(ReadData1, ReadData2) comparator = (ReadData2 == ReadData1)? 1'b1: 1'b0;
   always @(Imm) ImmExt = (Imm[15]) ? {16'hffff, Imm} : {16'b0, Imm};
  
   RegisterFile RegFile
   (.ReadReg1(Rs), 
    .ReadReg2(Rt1),
    .WriteReg(destreg2), 
    .WriteData(WB_data), 
    .RegWrite_ctrl(MEMWB_WB[1]), 
    .clk(CLK),
    .rst(RST),
    .ReadData1(ReadData1),
    .ReadData2(ReadData2));

   Control CU 
   (.RegDst(RegDst),
    .ALUSrc(ALUSrc),
    .MemtoReg(MemtoReg),
    .RegWrite(RegWrite), 
    .MemRead(MemRead), 
    .MemWrite(MemWrite), 
    .Branch(Branch), // Branch will be cancelled
    .Jump(Jump), 
    .ALUOp(ALUop),
    .opcode(CUopcode),
    .Comparator(comparator),
    .IF_flush(IF_flush));

   assign control_signals[9] = RegDst;
   assign control_signals[8] = Jump;
   assign control_signals[7] = Branch;
   assign control_signals[6] = MemRead;
   assign control_signals[5] = MemtoReg;
   assign control_signals[4] = MemWrite;
   assign control_signals[3] = RegWrite;
   assign control_signals[2] = ALUSrc; // CANCELLED
   assign control_signals[1:0] = ALUop;
   assign hazard_to_MUX = stall_signal[0];
   
   always @(hazard_to_MUX, control_signals) 
   MUXtoIDEX = (hazard_to_MUX)? control_signals: 10'b0;

   HazardDetectUnit HDU
   (.MemRead(IDEX_M[1]),
    .IFID_Rs(Rs),
    .IFID_Rt(Rt1),
    .IDEX_Rt(IDEX_Rt1),
    .stall(stall_signal));

///////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////
   
   ID_EX IDEX
   (.read_Rs(ReadData1),
    .read_Rt(ReadData2),
    .sign_extended32(ImmExt),
    .Rs(Rs), 
    .Rt(Rt1), 
    .Rd(Rd),
    .WB({MUXtoIDEX[9], MUXtoIDEX[3], MUXtoIDEX[5]}), // {RegDst, RegWrite, MemtoReg}
    .M({MUXtoIDEX[6], MUXtoIDEX[4]}), //{MemRead, MemWrite}
    .EX(MUXtoIDEX[2:0]), // {ALUSrc, ALU_op}
    .clk(CLK), 
    .rst(RST),
    .EX_sign_extended32(IDEXsign_extended32),
    .EX_read_Rs(IDEXread_Rs),
    .EX_read_Rt(IDEXread_Rt),
    .EX_WB(IDEX_WB),
    .EX_M(IDEX_M),
    .EX_EX(IDEX_EX),
    .EX_Rs(IDEX_Rs),
    .EX_Rt(IDEX_Rt1),
    .EX_Rd(IDEX_Rd));
//    .  (Rt2),


     always @(IDEX_Rt1, IDEX_Rd, IDEX_WB[2]) 
     destreg1 = (IDEX_WB[2])? IDEX_Rd : IDEX_Rt1; // IDEXcontrol_signals[9] = RegDst
    
     always @(forwardA, IDEXread_Rs, WB_data, EXMEM_aluOut) begin
          case (forwardA)
              2'b00 : MUX_A = IDEXread_Rs;
              2'b01 : MUX_A = WB_data;
              2'b10 : MUX_A = EXMEM_aluOut;
             default: MUX_A = 0;
          endcase
          end
    
     always @(forwardB, IDEXread_Rt, WB_data, EXMEM_aluOut, IDEX_EX [2], IDEXsign_extended32) begin
     case (forwardB)
         2'b00 : MUX_B = IDEXread_Rt;
         2'b01 : MUX_B = WB_data;
         2'b10 : MUX_B = EXMEM_aluOut;
        default: MUX_B = 0;
     endcase
     MUX_C = (IDEX_EX [2])? IDEXsign_extended32 : MUX_B;
     end
   ArithLogicUnit ALU
   (MUX_A, MUX_C, ALUopcode, alu_result);
   Alu_ctrl ALU_ctrl
   (.Alu_op(IDEX_EX [1:0]),
    .funct(IDEXsign_extended32 [5:0]),
    .Alu_ctrl(ALUopcode));

   ForwardingUnit FU
   (.RegWrite1(EXMEM_WB[1]),
    .RegWrite2(MEMWB_WB[1]),
    .Rs(IDEX_Rs),
    .Rt(IDEX_Rt1),
    .destreg1(EXMEM_destreg1),
    .destreg2(destreg2),
	 .forwardA(forwardA),
	 .forwardB(forwardB));

/////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////

   EX_MEM EXMEM
   (.clk(CLK),
    .rst(RST),
    .ALU_Output(alu_result),
    .read_Rt(MUX_B),
    .Rd(destreg1),
    .WB(IDEX_WB[1:0]),
    .M(IDEX_M),
    .MEM_read_Rt(regtoDataMem),
    .MEM_ALU_Output(EXMEM_aluOut),
    .MEM_M(EXMEM_M),
    .MEM_WB(EXMEM_WB),
    .MEM_Rd(EXMEM_destreg1));
    
    DataMemory DataMem(regtoDataMem, EXMEM_aluOut, EXMEM_M[1], EXMEM_M[0], CLK, ReadData_Mem);

///////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    MEM_WB MEMWB
    (.WB(EXMEM_WB),
     .memory_Output(ReadData_Mem),
     .ALU_Output(EXMEM_aluOut),
     .Rd(EXMEM_destreg1),
     .clk(CLK),
     .rst(RST),
     .WB_WB(MEMWB_WB),
     .WB_ALU_Output(MEMWBalu_out),
     .WB_memory_Output(MEMWBmemory_data),
     .WB_Rd(destreg2)
     );
     always @(MEMWBmemory_data, MEMWBalu_out, MEMWB_WB[0]) // check
     WB_data = (MEMWB_WB[0])? MEMWBmemory_data : MEMWBalu_out;
     
endmodule
