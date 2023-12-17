EXP_32BITS:
    ; salvar base da pilha
    push ebp
    ; colocar a base da pilha para o topo
    mov ebp, esp

    ; colocar registradores na pilha
    push ebx
    push ecx
    push edx

    ; printar mensagem do primeiro número
    push msg12
    push len_msg12
    call PRINT_STRING

    ; Adquirir o primeiro número
    call READ_INT
    
    ; Mover primeiro número para ebx
    mov ebx, eax

    ; printar mensagem do segundo número
    push msg13
    push len_msg13
    call PRINT_STRING

    ; adquirir o segundo número
    call READ_INT
    mov ecx, eax
    mov eax, 1

    loop_exp_32bits:
        ; multiplicar os números
        mov edx, 0
        imul eax, ebx
        jo overflow_exp_32bits
        dec ecx
        cmp ecx, 0
        jne loop_exp_32bits
        
    ; colocar argumentos na pilha
    push msg14
    push len_msg14

    ; printar mensagem de resultado
    call PRINT_STRING

    ; colocar argumentos na pilha
    push eax

    ; printar resultado
    call PRINT_INT

    jmp fim_exp_32bits

    overflow_exp_32bits:
        push msg_overflow
        push len_msg_overflow
        call PRINT_STRING
        mov eax, 1

    fim_exp_32bits:
    ; tirar registradores da pilha e retornar
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret 