        org 100h


	section	.text
    ;Llamaremos primero la funcion para que reconozca la clave
    call leerClaveRecibida
    ;Despues llamaremos a esta funcion para comparar la primera clave que se escriba y si este es correcta
    call comparado

    int 20h


    section	.data

    introClave 	    db 	"Escriba la Clave:$" 

    Bienvenida  	db 	"!BIENVENIDO!$"

    Incorrecto 	db 	"INCORRECTO$"	

    clave 	        db "labo6$"

    longitud times 10 db  " " ;Usaremos 10 characters


saltos: ;Lo que haremos en esta funciona la usaremos como punto referencia con la logica llamar del programa
    ;la funcion que usamos para cuando se escribe 
    call leerClaveRecibida
    ;Compara si es primera vez comparando la key   
    call comparado


input: ;Nuestra funcion de entrada
	mov 	AH, 09h
    
	int 	21h

	ret


leerClaveRecibida: ;En esta funcion vamos leer lo que se ingreso y almacenarlo en una direccion
    mov  DX, introClave	

    call input 
;le decimos que lo guardemos en la variable BP con la longitud
    mov BP, longitud 
    
    call readkey

    ret


readkey: ;la funcion usaremos para leer la entrada
    xor     SI, SI   


waitkey: ;Funcion para esperar una entrada, que pulse una letra
    mov     AH, 07h  

    int     21h

    ret


comparar: ;Aqui comparemos la entrada y veremos si es correcto  no
;primero le decimos a la variable de BH que almacene  SI y longitud
    mov BH, [SI + longitud]
;luego a BL hacemos lo mismo pero con la clave
    mov BL, [SI + clave]

    INC SI
;luego comparamos las dos y si coinciden salatara a bienvenida sino a incorrecto
    cmp BH, BL

    je bienvenida

    jnp incorrecto

    jmp funtion


bienvenida:  ; La funcion  que a la hora escribirlo manera correcta te da la bienvenida    
    xor DX, DX

	mov DX, Bienvenida

	jmp funtion


incorrecto:;La funcion que le diremos esta escrtito manera incorrecta
    MOV DX, Incorrecto 
    
    call input 

    call waitkey   


comparado:     ;Compara si es primera vez comparando la key si este ya habia dado     
    cmp DI, 0
    
    jg error  
    
    call input 
    
    call waitkey 
    
    ret


error: ;En eesta si la funcion le dio incorrecto le decimos que fue un error 
    xor DI,DI
    
    inc DI	
    
	jmp funtion


funtion:  ; la funcion principal 
    call    waitkey  
    
    cmp     AL, 0x0D   ; usaremos  0x0D: como EnterKey 
    
    je      exit  
    
    mov     [BP+SI], AL 
    
    jmp     comparar   
    


exit: ; Salimos
	mov 	byte [BP+SI], "$"	

    ret