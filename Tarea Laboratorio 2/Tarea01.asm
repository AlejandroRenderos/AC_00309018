        org     100h
        section .text
        ;Primero insertare las inicales usaramos byte
        ;Pondre mi nombre Alejandro Ernesto Renderos Mejia

        mov    byte [200h], "A"
        mov    byte [201h], "E"
        mov    byte [202h], "R"
        mov    byte [203h], "M"

        ;Direccionamiento directo
        mov    AX, [200h]

        ;Direccionamiento indirecto por registro
        mov    BX, 201h
        mov    CX, [BX]
        ;Haciendo que direccionamieto indirecto + indice 
        mov    SI, 1h     ;ya que tenenemos a bx que tiene 201,

        mov    DL, [BX + SI]

        ;luego pasaremos BX + Memoria, ocupando BX como el lugar que tiene guardado el registro
        ;se mandara la informacion de 203 a DI

        mov    DI, [BX + 2h]

        int 20h 