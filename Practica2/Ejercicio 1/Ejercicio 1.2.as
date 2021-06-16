.data
str: .string "hola buenos dias." #Creamos una variable y la inicializamos.
     .word 0

newline: .word 10

.text
begin: 
li t6, 32 #Diferencia entre letras y espacio en ASCII.

la a1, str  #Imprimimos el string sin modificar.
li a0, 4
ecall

la a1, newline #Imprimimos el salto de linea.
li a7, 11
ecall

la a1, str #Metemos en a1 la dirección de memoría del string.

#Bucles y excepción de salida:

loop:                 #Creamos una etiqueta llamada loop. Aquí estará nuesto bucle.      
li t5, 46             #Cargamos en t5 el valor 46, que es ASCII corresponde a un punto.
lb t1, 0(a1)          
beq t1, t5, end_loop  #Si nuestro valor t1 = t5, es decir, igual a un punto, se imprime el string.

beq t1, t6, continue  #Este bucle es para evitar que al restar al string 32, el espacio se combierta en un NULL.

sub t5, t1, t6        #Nuestro caracter -32, guardada en t5 para ver correctamente el auto-stepping
sb t5, 0(a1)          #Guardamos el byte modificado en el string original.
addi a1, a1, 1        #Por cada loop se suma 1 a a1, esto recorre el string.

j loop                #Llama al loop para que se repita hasta que salte la condición de salida.

continue:             #Una excepción para evitar que el espacio se combierta en null al ser restado.

sb t6, 0(a1)          #Guardamos diractamente el espacio sin restarlo.
addi a1, a1, 1        #Pasamos al siguiente caracter del string.
j loop                #Llamamos al loop para que siga hasta que se cumpla la expceción de salida.

end_loop:             #Una vez llegado al punto, se imprime el string.

la a1, str            #Imprimimos el string modificado.
li a0, 4
ecall