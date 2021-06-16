.data

length: 	.word 7

space: 		.word 32
break: 		.word 10

list: 		.word 7
				.word 5
				.word -4
				.word 100
				.word -250
				.word 73
				.word -50

.text

begin:
	la a2 list
	lw a3 length
	jal bubbleSort
	jal end
	

bubbleSort:
	addi sp, sp -16
	sw ra, 12(sp)
	jal printNums
	la a2 list
	li t1 1
	lw a3 length
	li t4 0
	jal checkPair
	bgt t4, zero, bubbleSort
	lw ra, 12(sp)
	addi sp, sp, 16
	ret

checkPair:
	addi sp, sp -16
	sw ra, 12(sp)
	lw t2, 0(a2)
	lw t3, 4(a2)
	bgt t2, t3, swap_a
	addi a2, a2, 4
	addi t1, t1, 1
	bgt a3, t1, checkPair
	lw ra, 12(sp)
	addi sp, sp, 16
	ret


swap_a:
	sw t3, 0(a2)
	sw t2, 4(a2)
	addi t4, t4, 1
	ret

printNums:
	addi sp, sp -16
	sw ra, 12(sp)
	li t5 0
	la a2 list
	jal loop
	la a1 break
	li a0, 4
	ecall
	lw ra, 12(sp)
	addi sp, sp, 16
	ret

loop:
	addi sp, sp -16
	sw ra, 12(sp)
	lw t2 0(a2)
	jal print
	addi a2, a2, 4
	addi t5, t5, 1
	bgt a3, t5, loop
	lw ra, 12(sp)
	addi sp, sp, 16
	ret

# print t2
print:
	addi a0 x0 1        # print_int ecall
	addi a1 t2 0       # add t1 value to print
	ecall
	la a1 space
	li a0, 4
	ecall
	ret

end:
	li a0, 10
	ecall