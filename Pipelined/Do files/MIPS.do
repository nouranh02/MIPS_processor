vlib work
vlog MIPS_piplined.v Adder.v Alu_ctrl.v ArithLogicUnit.v CU.v DataMemory.v Decoder32_5.v EX_MEM.V ForwardingUnit.v HazardDetectUnit.v ID_EX.v IF_ID.v instructionmemo.v MainControlUnit.v MEM_WB.V Mux.v Mux5.v MUX1024_5.v oneBitAddSub.v PC.v RegFile.v register32.v RegisterFile.v MIPS_pip_tb.v +cover -covercells
vsim -voptargs=+acc MIPS_pip_tb -cover
add wave *
coverage save MIPS_pip.ucdb -onexit
run -all