section .text
    global ft_list_sort

ft_list_sort:
    push rbp
    mov rbp, rsp

    push rdi
    push rsi

    test rdi, rdi
    jz .done

    mov rdx, [rdi]          ; rdx = current

    test rdx, rdx
    jz .done

    test rsi, rsi
    jz .done

    mov r8, rsi
    mov eax, 1

.outer_loop:
    test eax, eax
    jz .done

    mov rcx, [rdx + 8]      ; rdx = current->next
    mov eax, 0

.inner_loop:
    test rcx, rcx
    jz .end_inner_loop

    mov rdi, [rdx]
    mov rsi, [rcx]
    push rdx
    push rcx
    push r8
    sub rsp, 8
    call r8
    add rsp, 8
    pop r8
    pop rcx
    pop rdx

    test eax, eax
    jz .not_swap

    mov r9, [rdx]           ; tmp = current->data
    mov r10, [rcx]          ; tmp2 = current->next->data
    mov [rdx], r10          ; current->data = tmp2
    mov [rcx], r9           ; current->next->data = tmp
    mov eax, 1

.not_swap:
    mov rcx, [rcx + 8]      ; current->next = current->next->next
    jmp .inner_loop

.end_inner_loop:
    mov rdx, [rdx + 8]      ; current = current->next
    jmp .outer_loop

.done:
    pop rsi
    pop rdi
    pop rbp
    ret