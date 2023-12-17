; PRINT_STRING --> recebe uma string e seu tamanho e printa essa string.
;   Argumentos:
;       arg1 (ebp + 12) = ponteiro da string
;       arg2 (ebp + 8) = tamanho da string 

PRINT_STRING:
    push ebp 
    mov ebp, esp

    push eax
    push ebx
    push ecx
    push edx

    mov eax, 4
    mov ebx, 1
    mov ecx, [ebp + 12]
    mov edx, [ebp + 8]
    int 80h
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    
    pop ebp

    ret 8

; %macro PRINT_BYTE 2

; %endmacro

; %macro GET_LEN_STRING 2
;     mov eax, -1
;     mov ebx, 10
;     mov ecx, %1
;     loop_get_len_string:
;         add eax, 1
;         cmp [ecx+eax], ebx
;         jne loop_get_len_string

;     mov [%2], eax
; %endmacro