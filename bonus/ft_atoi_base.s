section .text
    global ft_atoi_base

ft_atoi_base:
    xor eax, eax
    mov cx, 1
    mov r8, rsi
   
.check_base_chars:
    mov bl, byte [r8]
    cmp bl, 0
    je .base_len
    cmp bl, '0'
    jl .error
    cmp bl, '9'
    jle .char_ok
    cmp bl, 'A'
    jl .error
    cmp bl, 'Z'
    jle .char_ok
    cmp bl, 'a'
    jl .error
    cmp bl, 'z'
    jle .char_ok
    jl .error

.char_ok:
    mov r9, r8  

.check_base_dupes:
    inc r9
    mov r10b, byte [r9]
    cmp r10b, 0
    je .dupes_ok
    cmp r10b, bl
    je .error
    jmp .check_base_dupes

.dupes_ok:
    inc r8
    jmp .check_base_chars

.base_len:
    xor r11d, r11d
    mov r8, rsi

.base_len_loop:
    mov bl, byte [r8]
    cmp bl, 0
    je .check_base_len
    inc r11d
    inc r8
    jmp .base_len_loop

.check_base_len:
    cmp r11d, 1
    jle .error

.check_minus:
    cmp byte [rdi], '-'
    jne .check_plus
    mov cx, -1
    inc rdi
    jmp .respect_base

.check_plus:
    cmp byte [rdi], '+'
    jne .respect_base
    inc rdi

.respect_base:
    mov r8, rdi

.respect_base_outer:
    mov r9, rsi
    mov bl, byte [r8]
    cmp bl, 0
    je .loop

.respect_base_inner:
    mov r10b, byte [r9]
    cmp r10b, 0
    je .error
    cmp bl, r10b
    je .in_base
    inc r9
    jmp .respect_base_inner

.in_base:
    inc r8
    jmp .respect_base_outer

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
    imul eax, r11d
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