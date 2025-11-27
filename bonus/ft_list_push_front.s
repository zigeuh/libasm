section .text
    global ft_list_push_front
    extern malloc
    extern __errno_location

ft_list_push_front:
    push rdi

	mov rdi, 16
	call malloc wrt ..plt
    cmp rax, 0
    jne .ok

    mov edi, 12
	call __errno_location wrt ..plt
	ret

.ok:
    pop rbx

    mov [rax], rsi
    mov rdx, [rbx]
    mov [rax + 8], rdx
    mov [rbx], rax
    ret
