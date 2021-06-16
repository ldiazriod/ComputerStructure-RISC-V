.data
entero: .word 5               #Creamos nuestras tres variables correspondientes.
newline: .word 10
str: .string "Hello World!"

.text
begin:
jal print_str                #Saltamos al procedimiento que imprime el string.
jal print_newline            #Saltamos al procedimiento que imprime el salto de línea.
jal print_entero             #Saltamos al procedimiento que imprime el entero.

end:
li a0, 10
ecall

print_entero:               #Procedimiento que imprime el entero.
lw a1, entero
li a0, 1
ecall

ret

print_newline:              #Procedimiento que imprime el salto de línea.
la a1, newline
li a0, 4
ecall

ret

print_str:                  #Procedimiento que imprime el string-
la a1, str
li a0, 4
ecall

ret