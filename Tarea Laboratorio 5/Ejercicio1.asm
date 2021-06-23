          org    100h

          section .text


;Declaracion de Variables para usar las interrupciones en modo Video

          xor SI, SI;
          xor AX, AX;
          xor DX, DX;
          xor BX, BX;
          xor CX, CX;


          mov DI 0d; Usamos para movernos de posicion de las filas cuando se este iterando
          mov SI, 0;


;Llamamos a las funciones 

          call textMode
          call waitkey
          call movecursor
          call writechain
          call firstchain
          call movecur1
          call secondchain
          call movecur2
          call thirdchain
          call movecur3
          call exit



textmode: ; Usamos la funcion para usar el modo texto 

         mov AH, 0h;

         mov AL, 03h ;le asignamos 03h porque es modo texto de 80 columnas

         INT 10h; establecemos el modo texto

         ret


waitkey: ;Usaremos la funcion para leer al pulsar una tecla

         mov AH, 00h ;limpiamos la variable

         INT 16h ; establecemos que espere una tecla

         ret


movecursor: ;La funcion para establecer posicion del cursor

         mov AH, 02h ; el argumento de entrada

         mov DH, 08 ;la posicion de la fila para el cursor

         mov DL, 18 ;La posicion de la columna para el cursor

         mov BH, 2h ; número de página

         INT 10h; establecemos que posicion del cursor cuando queramos moverlo

         ret


writechain: ;En esta funcion nos permitira escrbir una cadena de caracteres o string en la poscion donde esta el cursor

         mov AH, 09h ; Argumento de entra

         mov DX, chain ; aqui usaremos la direccion para la cadena que vamos a ingresar para que se guarde en la variable

         INT 21h; Le decimos que este debe de tener como terminacion caracter
         
         ret

firstchain: ;Igual que la funcion writechar de tal manera que ahora almacenemos otra cadena para el segundo Nombre
         mov AH, 09h ; Argumento de entra

         mov DX, c1; La direccion donde se iniciara la cadena c1

         INT 21h;

         ret  


secondchain: ;De igual manera continuacion con las 2 funciones anteriores la usaremos para la tercera cadena para el apellido
         mov AH, 09h ;Argumento de entra

         mov DX, c2 ; le decimos la direccion donde se iniciara la cadena c2

         INT 21h;

         ret 


thirdchain: ;Por ultimo en la tercera cadena con la misma dinamica de las anteriores para almacenar el segundo apellido
         mov AH, 09h  ;Argumento de entra

         mov DX, c3  ;le damos la direccion donde se iniciara la cadena c2

         INT 21h;

         ret 


movecur1:; En esta funcion usaremos la posicion del cursor para la c1 
         mov AH, 02h 

         mov DH, 10 ;donde iniciara en la fila

         mov DL, 18;donde iniciara en la columna


         mov BH, 2h ;la pagina usaremos

         INT 10h

         ret 


movecur2: ;En esta funcion usaremos la posicion del cursor para la c2
         mov AH, 02h 

         mov DH, 12 ;donde iniciara en la fila

         mov DL, 18 ;donde iniciara en la columna

         mov BH, 2h ;la pagina usaremos

         INT 10h

         ret

movecur3: ;En esta funcion usaremos la posicion del cursor para la c3
         mov AH, 02h 

         mov DH, 14;donde iniciara en la fila

         mov DL, 18 ;donde iniciara en la columna

         mov BH, 2h ;la pagina usaremos

         INT 10h

         ret                     
exit:
         int 20h;Finalizamos el programa

section .data
;aqui estan las variables donde guaderemos las variables
chain DB ""
c1 DB ""
c2 DB ""
c3 DB ""