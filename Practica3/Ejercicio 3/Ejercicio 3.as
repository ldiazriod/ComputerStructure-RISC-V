.data
year: .word 2020
bisiesto: .string "Es bisiesto"
nobisiesto: .string "No es bisiesto"

.text
begin:
la a2, bisiesto
la a3, nobisiesto

addi t0, t0, 4

jal print_year
jal calc_leap
jal print_leap_noleap

end:
li a0, 10
ecall

print_leap_noleap:
li a0, 4
ecall

ret
calc_leap:
rem t1, a1, t0
beq t1, zero, leap

mv a1, a3

ret

leap: 
mv a1, a2

ret

print_year:
lw a1, year
li a0, 1
ecall

ret