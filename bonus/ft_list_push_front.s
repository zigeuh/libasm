section .text
    global ft_list_push_front
    extern malloc
    extern __errno_location

; ---------------------------
; void ft_list_push_front(t_list **begin_list, void *data);
; ---------------------------
ft_list_push_front:
    push rdi                            ; Save rdi to return the same address
    push rsi

    mov rdi, 16
    call malloc wrt ..plt               ; Allocate a t_list node (16 bytes = 8 bytes *void + 8 bytes *t_list)
    cmp rax, 0                          ; Check if allocation failed
    jne .ok

    ; Set errno and return
    mov edi, 12
    call __errno_location wrt ..plt
    mov [rax], edi                      ; Set errno value to 12
    pop rdi
    ret

.ok:
    pop rsi
    pop rdi                             ; Recover saved rdi
    
    mov [rax], rsi                      ; Set *data value to *data value of the new node
    mov rdx, [rdi]                      ; Set *begin_list to rdx
    mov [rax + 8], rdx                  ; Set rdx (*begin_list) to *next of the new node
    mov [rdi], rax                      ; Change head to the new node

    ret



