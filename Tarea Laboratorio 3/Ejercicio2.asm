        org 100h
        section .text
        
        xor     AX, AX ;Se limpia Ax para que se pueda usar sin valores en otra operacion
        xor     CX, CX ;De igual manera en CX
        mov     CL, 5d ;Iniciamos Cl como el contador
        mov      AL, 1d ;Al hacer esto nos aseguramos que AL donde se guardara todo se almacene ya que si tiene 0 
        ; todo numero que le mandemos se a multiplicarlo se hace 0
        call    fac ; mandamos a llamar a la funcion con el codigo


        mov     CH, 1d; Se ocupa CH para hacer la diferencia de que es otro numero distinto a los utilizados antes
        mul     CH ; Se multiplica CH 

        mov     [208h], AL ; Mandamos el resultado del n! asi en la celda 208h que es 120d equivale a 78h

        jmp     exit; Nos vamos a un apartado donde el cual solo se encuentra el codigo que finaliza programa
fac:

        mul     CL ;Se  multiplica el valor de CL con el que ya se encuentra Al donde ambos son de 8 bits
        sub     CL, 1d ;Se le resta uno al contador ya que este nos hace ver que pasamos de n! a (n-1)!

        cmp     CL, 0d ;  
        JNZ     fac ; Aqui usamos el JNZ para iterar otra vez en caso cuando CL no sea 0 aun ya que comparamos 
        ;si CL aun no es 0 entonces se seguira haciendo 0

        ret ; si ya no se ejecuto JNZ se salta al MAIN
        
exit:
        int     20h ; 
