  
.data

length: .word 7

space: .word 32

list: 	.word 7
			.word 5
			.word -4
			.word 100
			.word -250
			.word 73
			.word -50

.text

begin:
la a2 list
lw t0 0(a2)
la a3 length

loop:
add t2, zero, zero
mv t2, t0
lw t0 4(a2)
addi a2, a2, 4
beq t2, zero, end
jal print


print:

addi a0 x0 1        # print_int ecall
addi a1 t2 0       # add t1 value to print
ecall
la a1 space
li a0, 4
ecall
jal loop

li a0, 10
ecall

end:
li a0, 10
ecall