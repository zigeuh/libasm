section .text
    global ft_list_remove_if
    extern free

ft_list_remove_if:
    push rbp
    mov rbp, rsp
    
    push rbx
    push r12
    push r13
    push r14
    push r15
    sub rsp, 8

    xor rbx, rbx
    mov rbx, [rdi]
    test rbx, rbx
    jz .done

    xor r14, r14
    mov r14, rsi
    test r14, r14
    jz .done

    xor r13, r13
    mov r13, rdx
    test r13, r13
    jz .done

    xor r12, r12
    mov r12, rcx
    test r12, r12
    jz .done

.first:
    xor r15, r15
    mov r15, rdi

    push rbx
    mov rdi, [rbx]
    mov rsi, r14
    call r13
    pop rbx

    test rax, rax
    jnz .loop

    mov rdi, r15
    mov r15, [rbx + 8]
    mov [rdi], r15

    mov rdi, [rbx]
    call r12

    mov rdi, rbx
    mov rbx, [rbx + 8]
    mov r15, rbx
    call free wrt ..plt
    
    jmp .loop_end


.loop:
    push rbx
    mov rdi, [rbx]
    mov rsi, r14
    call r13
    pop rbx

    test rax, rax
    jz .free
    mov r15, rbx
    mov rbx, [rbx + 8]

.loop_end:
    test rbx, rbx
    jz .done
    jmp .loop

.free:
    mov rdi, [rbx]
    call r12

    mov rdi, rbx
    mov rbx, [rbx + 8]
    mov [r15 + 8], rbx
    call free wrt ..plt
    
    jmp .loop_end

.done:
    pop r15
    pop r14
    pop r13
    pop r12
    pop rbx
    leave
    ret