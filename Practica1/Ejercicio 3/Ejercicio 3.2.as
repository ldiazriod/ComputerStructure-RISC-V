.data
Dividendo: .word 10
Divisor:   .word 6

Cociente:  .word 0
Resto:     .word 0

.text
begin:

lw a2, Dividendo
lw a3, Divisor
lw a4, Cociente

div a4, a2, a3

div t0,a2,a4
sub t1, t0, a3

la t2, Resto
sw a1, 0(t2)

mv a1, t1
li a0,1
ecall



end:
nop