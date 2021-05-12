        org 100h
        section .text
        
        xor     AX, AX ;Se limpia Ax para que se pueda usar sin valores en otra ope
        mov     CX, 8d ;Iniciamos Cx como el contador que se va disminuir hasta 0
        ; Mi carnet es 00309018 
        mov     byte [300h], 0d
        mov     byte [301h], 0d
        mov     byte [302h], 3d
        mov     byte [303h], 0d
        mov     byte [304h], 9d
        mov     byte [305h], 0d
        mov     byte [306h], 1d
        mov     byte [307h], 8d    

        mov     BX, 200h ; Le mandamos este valor donde estara el primer Digito Carnet 
        jmp sum ; Este es el salto para moverse al siguiente funcion con el codigo:

sum:

        add     AL, [BX]; Se suma el valor almacenado en la direccion de memoria de BX
        add     BX, 1H ; Le sumo 1 al valor que esta en BX asi se podra avanzar en las posiciones de memoria
        loop sum ; Hacemos el loop hasta que CX se haga 0, esto es debido a que se resta 1 por cada iteracion que se haga 
        ; Siki se hara 8 veces por los digitos del carnet 



        mov     CL, 8d ; Al poner en este  valor el numero de la cantidad de datos que ocuparemos de divisor 
        div     CL ;Se manda a CL lo que vale 8d, al dividirlo AX que tiene 16 bytes
        ;La division de 29 entre 8 

        mov     byte [20Ah], AL ; SE manda a la celda de la memoria 20Ah el conciente de la division almacenado en AL
        int     20h ; 
