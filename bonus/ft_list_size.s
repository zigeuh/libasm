section .text
    global ft_list_size

; ---------------------------
; int ft_list_size(t_list *begin_list);
; ---------------------------
ft_list_size:
    xor eax, eax            ; Prepare our return register

.loop:
    test rdi, rdi           ; Test if current ptr isn't NULL
    jz .done
    inc eax                 ; Increment return register by 1
    mov rdi, [rdi + 8]      ; Get list->next and set it to rdx
    jmp .loop               ; Continue counting

.done:
    ret