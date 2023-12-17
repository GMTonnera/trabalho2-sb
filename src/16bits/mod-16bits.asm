MOD_16BITS:
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
    mov bx, ax

    ; printar mensagem do segundo número
    push msg13
    push len_msg13
    call PRINT_STRING

    ; adquirir o segundo número
    call READ_INT
    mov cx, ax
    mov ax, bx

    ; dividir os números
    mov edx, 0
    idiv cx
    
    ; colocar argumentos na pilha
    push msg14
    push len_msg14

    ; printar mensagem de resultado
    call PRINT_STRING

    ; colocar argumentos na pilha
    push edx

    ; printar resultado
    call PRINT_INT

    ; tirar registradores da pilha e retornar
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret 