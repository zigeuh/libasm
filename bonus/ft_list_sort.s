section .text
    global ft_list_sort

ft_list_sort:
    test rdi, rdi
    jz .done

    mov rdx, [rdi]
    test rdx, rdx
    jz .done

    test rsi, rsi
    jz .done

    mov rbx, rsi ; rbx = cmp function
    mov rax, 1 ; swapped = 1

.outer_loop:
    cmp rax, 0
    je .done

    mov rax, 0     ; swapped = 0
    mov rdx, [rdi] ; rdx = current

.inner_loop:
    mov r8, [rdx + 8] ; r8 = current->next
    test r8, r8
    jz .outer_loop

    mov rdi, [rdx]
    mov rsi, [r8]
    call rbx
    cmp rax, 0 ; swapped = 0
    jne .no_swap

    mov r9, [rdx]         ; tmp = current->data
    mov r10, [r8]          ; tmp2 = current->next->data
    mov [rdx], r10
    mov [r8], r9
    
    mov rax, 1

.no_swap:
    mov rdx, r8            ; current = current->next
    jmp .inner_loop

.done:
    ret