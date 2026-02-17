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

.loop:
    push rbx
    mov rdi, [rbx]
    mov rsi, r14
    call r13
    pop rbx

    test rax, rax
    jz .free
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
    call free wrt ..plt
    
    jmp .loop_end

.done:
    pop r14
    pop r13
    pop r12
    pop rbx
    leave
    ret