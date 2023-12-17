; GET_LEN_STRING --> recebe um ponteiro de uma string e retorna o tamanho da string.
;   Argumentos:
;       arg1 (ebp + 8) = ponteiro
;   Retorno:
;       eax --> Tamanho da string

GET_LEN_STRING:
    push ebp
    mov ebp, esp

    push ebx
    push ecx

    mov eax, -1
    mov ebx, 10
    mov ecx, [ebp + 8]
    loop_get_len_string:
        add eax, 1
        cmp [ecx+eax], ebx
        jne loop_get_len_string

    pop ecx
    pop ebx
    pop ebp

    ret 4