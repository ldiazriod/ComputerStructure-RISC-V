.data

A: .word 10
B: .word 6

R: .word 0

.text
begin:

lw a2, A
lw a3, B

rem t0, a2, a3

la t1, R
sw a1, 0(t1)

mv a1, t0
li a0, 1
ecall

end:
nop