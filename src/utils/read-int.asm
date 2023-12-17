%define ans dword [ebp-4]
%define char byte [ebp-5]
%define flag byte [ebp-6]
READ_INT:
    enter 6, 0

    push ebx
    push ecx
    push edx

    mov byte char, 0
    mov dword ans, 0
    mov byte flag, 0
    lea ecx, char

    loop_read_int:
        mov eax, 3
        mov ebx, 0
        mov edx, 1
        int 80h
        
        mov al, char
        cmp al, 10
        je fim_read_int

        cmp al, 45
        jne transform_to_digit
        mov byte flag, 1
        jmp loop_read_int

        ; mov al, flag
        ; add eax, 48
        ; push eax
        ; push 1
        ; call PRINT_INT

        transform_to_digit:
            shl dword ans, 1
            mov eax, ans
            shl ans, 2
            add ans, eax

            mov bl, char
            sub bl, 48
            add ans, ebx

            jmp loop_read_int

    fim_read_int:
        mov eax, ans
        cmp flag, 1
        jne return_read_int
        sub eax, 1
	    not eax
    return_read_int: 
        pop edx
        pop ecx
        pop ebx

        leave
        ret 

    