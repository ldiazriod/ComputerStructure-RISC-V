.data
strl: .string "36"
		 .word 0
str2: .string "steps"
      .word 0
saltodelinea: .word 10

.text
la a1,strl
li a0,4
ecall

la a1, saltodelinea
li a7, 11
ecall

la a1, str2
li a0, 4
ecall