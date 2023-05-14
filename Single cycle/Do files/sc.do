vlib work
vlog Alu_ctrl.v ArithLogicUnit.v Control.v DataMemory.v Decoder32_5.v instructionmemo.v MIPS_tb.v MIPS_topmodule.V MUX1024_5.v PC.v  register32.v RegisterFile.v +cover -covercells
vsim -voptargs=+acc MIPS_tb -cover
add wave *
coverage save S.ucdb -onexit
run -all