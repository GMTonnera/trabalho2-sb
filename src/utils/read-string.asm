; READ_STRING --> recebe um ponteiro aponta para a string lida e a quantidade maxima de caracteres que devem ser lidos.
;   Argumentos:
;       arg1 (ebp + 12) = ponteiro
;       arg2 (ebp + 8) = número máximo de caracteres

READ_STRING:
    push ebp 
    mov ebp, esp

    push ebx
    push ecx
    push edx

    mov eax, 3
    mov ebx, 0
    mov ecx, [ebp + 12]
    mov edx, [ebp + 8]
    int 80h

    pop edx
    pop ecx
    pop ebx
    
    pop ebp

    ret 8
