# Equivalent assembly program for RISCV using our Machine Code


.section .text
.globl _start

_start:

# Immediate arithmetic tests
addi x1,  x0, 1
addi x2,  x0, 16
addi x3,  x0, -3
addi x4,  x0, 0
addi x5,  x3, 12
slli x6,  x2, 2
sltiu x7, x2, -16
sltiu x8, x2, -16
xori x9,  x2, 18
srli x10, x3, 3
srai x11, x3, 3
ori  x12, x3, 3
andi x13, x3, 3

# Register-register ALU tests
add  x14, x2, x1
sub  x15, x2, x1
sll  x16, x2, x1
slt  x17, x2, x3
sltu x18, x2, x3
xor  x19, x2, x1
srl  x20, x2, x1
sra  x21, x2, x1
or   x22, x2, x1
and  x23, x2, x1

# Upper immediate tests
lui   x24, 0x2000
auipc x25, 0x2000

# Store instructions
sb x1,  17(x2)
sh x3,  54(x2)
sw x2,  56(x2)

# Load instructions
lb  x26, 36(x3)
lh  x27, 41(x3)
lw  x28, 43(x3)
lbu x29, 36(x3)
lhu x30, 41(x3)

################################################
# BLT TEST
################################################
addi x4, x0, 0
addi x6, x0, -5
addi x7, x0, 5

loop_blt:
addi x4, x4, 1
addi x6, x6, 1
blt  x6, x7, loop_blt

add x6, x0, x6

################################################
# BGE TEST
################################################
addi x4, x0, 0
addi x8, x0, -5
addi x9, x0, 5

loop_bge:
addi x4, x4, 1
addi x9, x9, -1
bge  x9, x8, loop_bge

add x9, x0, x9

################################################
# BLTU TEST
################################################
addi x4,  x0, 0
addi x10, x0, 1
addi x11, x0, 5

loop_bltu:
addi x4, x4, 1
addi x10, x10, 1
bltu x10, x11, loop_bltu

add x10, x0, x10

################################################
# BGEU TEST
################################################
addi x4,  x0, 0
addi x12, x0, 1
addi x13, x0, 5

loop_bgeu:
addi x4, x4, 1
addi x13, x13, -1
bgeu x13, x12, loop_bgeu

add x13, x0, x13

################################################
# BNE TEST
################################################
addi x4,  x0, 0
addi x14, x0, 5
addi x15, x0, 0

loop_bne:
addi x4, x4, 1
addi x15, x15, 1
bne  x15, x14, loop_bne

add x15, x0, x15

################################################
# BEQ TEST
################################################
addi x4,  x0, 0
addi x16, x0, 2
addi x17, x0, 3

loop_beq:
addi x4, x4, 1
addi x16, x16, 1
beq  x16, x17, beq_done

beq_done:
add x16, x0, x16

################################################
# JALR TEST
################################################
jalr x31, 308(x0)

addi x4, x0, -1
add  x31, x0, x31

################################################
# HALT
################################################
halt:
jal x4, halt