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

    pop rsi                             ; Recover saved rsi
    pop rdi                             ; Recover saved rdi

    test rax, rax                       ; Check if allocation failed
    jnz .ok
    ret

.ok:                       
    
    mov [rax], rsi                      ; Set *data value to *data value of the new node
    mov rdx, [rdi]                      ; Set *begin_list to rdx
    mov [rax + 8], rdx                  ; Set rdx (*begin_list) to *next of the new node
    mov [rdi], rax                      ; Change head to the new node

    ret



