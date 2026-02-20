section .text
    global ft_list_sort

%define REG_CURR rbx
%define REG_CMP r12
%define REG_NEXT r13
%define REG_SWAPPED r14
%define REG_HEAD r15

; ---------------------------
; void ft_list_sort(t_list **begin_list, int (*cmp)());
; ---------------------------

ft_list_sort:

    ; Saves used registers
    push rbx
    push r12
    push r13
    push r14
    push r15

    mov REG_HEAD, rdi
    test REG_HEAD, REG_HEAD
    jz .done

    mov REG_CURR, [rdi]
    test REG_CURR, REG_CURR
    jz .done

    mov REG_CMP, rsi
    test REG_CMP, REG_CMP
    jz .done

    mov REG_SWAPPED, 1

; Main loop
.outer_loop:
    test REG_SWAPPED, REG_SWAPPED
    jz .done

    xor REG_SWAPPED, REG_SWAPPED
    mov REG_CURR, [REG_HEAD]

; Inner loop where current->data is compared with next->data
.inner_loop:
    mov REG_NEXT, [REG_CURR + 8]
    test REG_NEXT, REG_NEXT
    jz .outer_loop

    mov rdi, [REG_CURR]
    mov rsi, [REG_NEXT]
    call REG_CMP
    cmp eax, 0
    jg .swap
    jmp .end_inner_loop

; Swap 2 datas
.swap:
    mov r10, [REG_CURR]
    mov r11, [REG_NEXT]
    mov [REG_CURR], r11
    mov [REG_NEXT], r10
    mov REG_SWAPPED, 1

.end_inner_loop:
    mov REG_CURR, REG_NEXT
    jmp .inner_loop

.done:
    pop r15
    pop r14
    pop r13
    pop r12
    pop rbx
    ret