addi $8, $0, 5
addi $16, $0 8
beq $8, $0, 36
move $4, $8
jal 40
sw $2, 0($16)
addi $16, $16, 4
subi $8, $8, 1
j 8
bne $8, $0, 48
ori $2, $4, 2049
jr $31
addi $16, $0, 12
lb $17, 0($16)
slt $9, $17, $16