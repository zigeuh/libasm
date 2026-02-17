section .text
    global ft_list_remove_if
    extern free

ft_list_remove_if:
    push rbp
    mov rbp, rsp
    
    push rbx
    push r12

    xor rbx, rbx
    mov rbx, [rdi]
    test rbx, rbx
    jz .done

    xor r12, r12
    mov r12, rcx
    test r12, r12
    jz .done

.loop:
    mov rdi, [rbx]
    call r12

    mov rdi, rbx
    mov rbx, [rbx + 8]
    call free wrt ..plt
    
    test rbx, rbx
    jnz .loop

.done:
    pop r12
    pop rbx
    leave
    ret