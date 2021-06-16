.data
year: .word 2020                     #creamos nuestas variables correspondientes
bisiesto: .string "Es bisiesto"
nobisiesto: .string "No es bisiesto"

dospuntos: .word 58                 #Estas dos variables son simplemente para que quede bonito al imprimir
espacio: .word 32

.text
begin:
la a2, bisiesto       #Cargamos en a2 y a3 la dirección de nuestras cadenas de carácteres              
la a3, nobisiesto
addi t0, t0, 4       #Un año es bisiesto si es divisible por 4.

lw a1,year           #Imprimimos nuestro año
li a0, 1
ecall

la a1, dospuntos     #Imprimimos dos puntos.
li a0, 4
ecall

la a1, espacio       #Imprimimos un espacio.
li a0, 4
ecall

lw a1, year          #Cargamos en a1 nuestro año.

rem t2, a1, t0       #Calculamos el resto de la división de nuestro año entre 4.

beq t2, zero, leap   #Si el resto es cero, es bisiesto.

mv a1, a3            #En el caso de que el resto no sea igual a cero, no es bisiesto.

jal end              #Saltamos a end para imprimir si es bisiesto o no.             

leap:
mv a1, a2           #En el caso de que se cumpla que es bisiesto, movemos a2 a a1 para imprimir.

end:
li a0, 4            #Imprimimos si es bisiesto o no.
ecall
end_loop:             #Una vez llegado al punto, se imprime el string.

la a1, str            #Imprimimos el string modificado.
li a0, 4
ecall