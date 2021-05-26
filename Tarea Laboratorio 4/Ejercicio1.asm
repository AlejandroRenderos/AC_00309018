          org    100h

          section .text

          xor SI, SI; 
          xor DI, DI;
          xor BX, BX;
          xor CX, CX;
          xor DX, DX;
          mov BL, 2;
          call oddProcess;

          int 20h

          section .data

arreglo     db      1,3,8,87,25,4,10,2,9,7;

oddProcess:
          mov BL, 2; 

iteration:
          xor AX, AX;
          mov AL, [arreglo+SI];
          inc SI;
          mov BH,AL
          div BL;
          cmp AH,0;
          JE process;
          JA odd;

process:
          mov BH, CX
          mov byte [0300h + DI], BH;
          inc DI;
          mov CX, DI
          cmp SI, len;
          JE exit;
          jmp iteration;

odd:
          mov BH, DX
          mov byte [0320h + DI], BH;
          inc DI;
          mov DX, DI
          cmp SI, len;
          JE exit;
          jmp iteration;

exit:
          ret;



