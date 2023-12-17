PRINT_INT:
    enter 11, 0

    push eax
    push ebx
    push ecx
    push edx
    

    mov eax, [ebp+8]
    test eax, eax
    jns loop_set_up_print_int
    not eax
	add eax, 1
    push negativo
    push len_negativo
    call PRINT_STRING

    loop_set_up_print_int:
        mov ebx, 10
        mov ecx, -1
        mov byte [ebp + ecx], 10
    
    loop_print_int:
        ; dividir o número por 10
        mov edx, 0
        div ebx
        ; somar o resto da divisão com 48
        add edx, 48
        dec ecx
        ; salvar o dígito na memória
        mov [ebp + ecx], dl
    
        cmp eax, 0
        jne loop_print_int
    
    loop_print_int2:
        lea eax, [ebp+ecx]
        push eax
        push 1
        call PRINT_STRING
        inc ecx
        cmp ecx, 0
        jne loop_print_int2

    pop edx
    pop ecx
    pop ebx
    push eax
    leave
    ret 4