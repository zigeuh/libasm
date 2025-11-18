section .text
	global ft_strdup
	extern ft_strlen
    extern ft_strcpy
    extern malloc

ft_strdup:
	push rdi
	call ft_strlen wrt ..plt
	inc rax

	mov rdi, rax
	call malloc wrt ..plt
	
	pop rsi
	mov rdi, rax
	call ft_strcpy wrt ..plt
	ret