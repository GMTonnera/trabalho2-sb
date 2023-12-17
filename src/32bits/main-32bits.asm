%include "src/utils/print-string.asm"
%include "src/utils/read-string.asm"
%include "src/utils/read-int.asm"
%include "src/utils/get-len-string.asm"
%include "src/utils/print-int.asm"
%include "src/32bits/sum-32bits.asm"
%include "src/32bits/sub-32bits.asm"
%include "src/32bits/div-32bits.asm"
%include "src/32bits/mul-32bits.asm"
%include "src/32bits/exp-32bits.asm"
%include "src/32bits/mod-32bits.asm"

section .data
;MENSAGENS

msg1  db 'Bem vindo. Digite seu nome: '
len_msg1 EQU $-msg1

msg2  db 'Hola, '
len_msg2 EQU $-msg2

msg3  db ', bem vindo ao programa de CALC IA-32', 0dh, 0ah
len_msg3 EQU $-msg3

msg4  db 'ESCOLHA UMA OPCAO: ', 0dh, 0ah
len_msg4 EQU $-msg4

msg5  db '- 1: SOMA', 0dh, 0ah
len_msg5 EQU $-msg5

msg6  db '- 2: SUBTRACAO', 0dh, 0ah
len_msg6 EQU $-msg6

msg7  db '- 3: MULTIPLICACAO', 0dh, 0ah
len_msg7 EQU $-msg7

msg8  db '- 4: DIVISAO', 0dh, 0ah
len_msg8 EQU $-msg8

msg9  db '- 5: EXPONENCIACAO', 0dh, 0ah
len_msg9 EQU $-msg9

msg10 db '- 6: MOD', 0dh, 0ah
len_msg10 EQU $-msg10

msg11 db '- 7: SAIR', 0dh, 0ah
len_msg11 EQU $-msg11

msg12 db 'Primeiro número = '
len_msg12 EQU $-msg12

msg13 db 'Segundo número = '
len_msg13 EQU $-msg13

msg14 db 'Resultado = '
len_msg14 EQU $-msg14

msg_overflow db 'OCORREU OVERFLOW', 0dh, 0ah
len_msg_overflow EQU $-msg_overflow


negativo db '-'
len_negativo EQU $-negativo
new_line db 0dh, 0ah
len_new_line EQU $-new_line

len_max_nome EQU 100

section .bss
nome_usuario resb len_max_nome
input resb 11
section .text

global _start

_start:
    ; Printar mensagem solicitando o nome
    push msg1
    push len_msg1
    call PRINT_STRING
    
    ; Adquirir o nome do usuário
    push nome_usuario
    push len_max_nome
    call READ_STRING 

    ; Printar mensagem de Hello
    push msg2
    push len_msg2
    call PRINT_STRING
    
    ; Printar nome do usuario
    push nome_usuario
    call GET_LEN_STRING
    push nome_usuario
    push eax
    call PRINT_STRING

    ; Printar mensagem de boas vindas
    push msg3
    push len_msg3
    call PRINT_STRING 

    main_loop:
        ; Printar o menu    
        push msg4
        push len_msg4
        call PRINT_STRING

        push msg5
        push len_msg5
        call PRINT_STRING 
        
        push msg6
        push len_msg6
        call PRINT_STRING 
        
        push msg7
        push len_msg7
        call PRINT_STRING 
        
        push msg8
        push len_msg8
        call PRINT_STRING 
        
        push msg9
        push len_msg9
        call PRINT_STRING 
        
        push msg10
        push len_msg10
        call PRINT_STRING 
        
        push msg11
        push len_msg11
        call PRINT_STRING 
    
        ; Adquirir a operacao
        push input
        push 2
        call READ_STRING

        ; Colocar em ebx o input do usuario
        mov bl, [input]

        ; Verificar se o input foi 1
        cmp bl, 0x31
        je input1
        
        ; Verificar se o input foi 2
        cmp bl, 0x32
        je input2
        
        ; Verificar se o input foi 3
        cmp bl, 0x33
        je input3
        
        ; Verificar se o input foi 4
        cmp bl, 0x34
        je input4
        
        ; Verificar se o input foi 5
        cmp bl, 0x35
        je input5
        
        ; Verificar se o input foi 6
        cmp bl, 0x36
        je input6
        
        ; Verificar se o input foi 7
        cmp bl, 0x37
        je fim
        
        ; Se não for nenhuma das opções, ignorar
        jmp main_loop
        
        
        input1:
            call SUM_32BITS
            jmp main_loop

        input2:
            call SUB_32BITS
            jmp main_loop

        input3:
            call MUL_32BITS
            cmp eax, 1
            je fim
            jmp main_loop

        input4:
            call DIV_32BITS
            jmp main_loop

        input5:
            call EXP_32BITS
            cmp eax, 1
            je fim
            jmp main_loop

        input6:
            call MOD_32BITS
            jmp main_loop
        
        print_result:
            ; push eax
            ; push input
            ; call PRINT_INT
            jmp main_loop
    
    ; Finalizar o programa
    fim:
        mov eax, 1
        mov ebx, 0
        int 80h