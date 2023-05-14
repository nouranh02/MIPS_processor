module MIPS_topmodule(input CLK, RST);

    wire [31:0] current_pc, pc_plus_4, branch_address, jump_address, Ins;
    reg [31:0] ImmExt, next_pc, alu_in2, WriteData;
    wire [31:0] instruction, alu_in1, ReadData2, alu_result, ReadData_Mem;
    wire [25:0] dirJump_address;
    wire [15:0] Imm;
    wire Branch, zero, RegWrite, ALUSrc, MemRead, MemWrite, MemtoReg, RegDst, Jump;
    wire [5:0] funct, CUopcode;
    wire [4:0] Rs, Rt, Rd;
    reg [4:0] WriteReg;
    wire [3:0] ALUopcode;
    wire [1:0] ALUop;

    PC pc
    (.clk(CLK),
     .rst(RST),
     .PC_in(next_pc),
     .PC_out(current_pc));
    
   assign pc_plus_4 = current_pc + 4;
	assign branch_address = pc_plus_4 + (ImmExt << 2);
	assign jump_address = {pc_plus_4[31:28], dirJump_address, 2'b00};
    
    always @(pc_plus_4, Branch, zero, branch_address, jump_address, next_pc, Jump) 
    begin
        next_pc = (Branch & zero)? branch_address : pc_plus_4;
        next_pc = (Jump)? jump_address : next_pc;
    end

    instruction_memory instMem (.read_add(current_pc), .instruction(Ins));
//	InstructionMemory32 instMem (.ProgramCounter(current_pc), .clk(CLK), .instruction(Ins));
   assign Rs = Ins[25:21];
	assign Rt = Ins[20:16];
	assign Rd = Ins[15:11];
	assign Imm = Ins[15:0];
   assign funct = Ins[5:0];
   assign CUopcode = Ins[31:26];
	assign dirJump_address = Ins[25:0];
    always @(Rd, Rt, RegDst) WriteReg = (RegDst)? Rd : Rt;
	
    RegisterFile RegFile
    (.ReadReg1(Rs), 
     .ReadReg2(Rt),
     .WriteReg(WriteReg), 
     .WriteData(WriteData), 
     .RegWrite_ctrl(RegWrite), 
     .clk(CLK),
     .rst(RST),
     .ReadData1(alu_in1),
     .ReadData2(ReadData2));

    always @(Imm, Ins[15], ALUSrc, ReadData2) begin
        ImmExt = (Ins[15]) ? {16'hffff, Imm} : {16'b0, Imm};
        alu_in2 = (ALUSrc) ? ImmExt : ReadData2;
    end

    Alu_ctrl ALU_ctrl
    (.Alu_op(ALUop),
     .funct(funct),
     .Alu_ctrl(ALUopcode));
    
  	ArithLogicUnit ALU(alu_in1, alu_in2, ALUopcode, alu_result, zero);
	DataMemory DataMem(ReadData2, alu_result, MemRead, MemWrite, CLK, ReadData_Mem);
    
    always @(alu_result, ReadData_Mem, MemtoReg) 
        WriteData = (MemtoReg) ? ReadData_Mem : alu_result;
    
    Control CU 
    (.RegDst(RegDst),
     .ALUSrc(ALUSrc),
     .MemtoReg(MemtoReg),
     .RegWrite(RegWrite), 
     .MemRead(MemRead), 
     .MemWrite(MemWrite), 
     .Branch(Branch), 
     .Jump(Jump), 
     .ALUOp(ALUop),
     .opcode(CUopcode));
                     

endmodule
