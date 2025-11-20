section .text
    global ft_atoi_base

ft_atoi_base:
    xor eax, eax
    mov cx, 1
   
.check_base_chars:
    mov bl, byte [rsi]
    cmp bl, 0
    je .check_minus
    cmp bl, '0'
    jl .error
    cmp bl, '9'
    jle .ok
    cmp bl, 'A'
    jl .error
    cmp bl, 'Z'
    jle .ok
    cmp bl, 'a'
    jl .error
    cmp bl, 'z'
    jle .ok
    jl .error

.ok:
    inc rsi
    jmp .check_base

.check_minus:
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
    je .check_neg
    cmp bl, '9'
    jle .0_9
    cmp bl, 'a'
    jge .a_z
    cmp bl, 'A'
    jge .A_Z
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
    imul eax, 2
    movzx edx, bl
    add  eax, edx
    inc  rdi
    jmp  .loop

.check_neg:
    cmp cx, -1
    jne .done
    neg eax

.done:
    ret

.error:
    mov eax, 0
    ret