.data

str: .string "qwerty" #Creamos una variable de tipo string y la inicializamos.
     .word 0

newline: .word 10    #Creamos una variable de tipo entero y la inicializamos a 10 ya que es para el salto de línea.
.text

begin:

li t6, 32 #Cargamos en t6 el valor 32(Distancia entre mayusculas y minusculas en ASCII).

la a1, str #Imprimimos nuestro string sin modificar.
li a0, 4
ecall

la a1, newline #Imprimimos el salto de línea.
li a7, 11
ecall

la a1, str #Metemos en a1 la dirección de la variable de nuestra cadena de caracteres.

lb t1, 0(a1) #Cargamos en t1 el primer byte de nuestro string. En este caso -q-.
sub t1, t1, t6 #Le restamos a nuestro byte 32, para convertirlo en mayúscuulas.
sb t1, 0(a1)   #Guardamos el byte modificado en el string inicial. Qwerty

lb t1, 1(a1)   #Repetimos esto todo el rato, hasta modificar todo nuestro string.
sub t1, t1, t6
sb t1, 1(a1) #QWerty

lb t1, 2(a1)
sub t1, t1, t6
sb t1, 2(a1)   #QWErty

lb t1, 3(a1)
sub t1, t1, t6
sb t1, 3(a1) #QWERty

lb t1, 4(a1)
sub t1, t1, t6
sb t1, 4(a1)   #QWERTy

lb t1, 5(a1) 
sub t1, t1, t6
sb t1, 5(a1) #Con este sb, ya tenemos todo nuestro string en mayusculas. QWERTY

li a0, 4 #Imprimimos QWERTY.
ecall

end:
nop