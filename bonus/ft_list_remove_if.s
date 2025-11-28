section .text
    global ft_list_remove_if

ft_list_remove_if:
    push rbp
    mov rbp, rsp

    push rbx
    push rdi
    push rsi

    test rdi, rdi
    jz .done

    test rsi, rsi
    jz .done

    test rdx, rdx
    jz .done

    test rcx, rcx
    jz .done

    mov r8, rsi
    mov rbx, [rdi]          ; rbx = current

.loop:
    test rbx, rbx
    jz .done

    push rbx

    sub rsp, 8
    mov rdi, [rbx]
    call rcx
    add rsp, 8

    pop rbx

.no_free:
    mov rbx, [rbx + 8]
    jmp .loop

.done:
    pop rsi
    pop rdi
    pop rbx
    pop rbp
    ret