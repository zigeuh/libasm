section .text
    global ft_atoi_base

ft_atoi_base:
    xor eax, eax
        mov cx, 1
    mov bl, byte [rdi]
    cmp bl, '-'
    jne .check_plus
    mov cx, -1
    inc rdi

.check_plus:
    cmp byte [rdi], '+'
    jne .loop
    inc rdi

.loop:
    mov bl, byte [rdi]
    cmp bl, 0
    je .done
    cmp bl, '9'
    jl .0_9
    cmp bl, 'a'
    jg .a_z
    cmp bl, 'A'
    jg .A_Z
    jmp .error

.0_9:
    cmp bl, '0'
    jl .error
    sub bl, '0'
    jmp .valid_char

.a_z:
    cmp bl, 'z'
    jg .error
    sub bl, 'a'
    add bl, 10
    jmp .valid_char
    
.A_Z:
    cmp bl, 'Z'
    jg .error
    sub bl, 'A'
    add bl, 10

.valid_char:
    inc rdi
    jmp .loop

.done:
    ret

.error:
    mov eax, 0
    ret