.data
#Variables inicializadas con sus respectivos números
A: .word 5
B: .word 3
C: .word 2
D: .word 2

#Variable donde se almacena el resultado de la ecucación, inicializada a 0
F: .word 0
.text
lw a2,A
lw a3,B
lw a4,C
lw a5,D

add t0, a2,a3
add t1, a4,a5
sub t2, t0,t1

la t3,F
sw a1, 0(t3)

mv a1,t2
li a0,1
ecall