section .text
	global _ft_strdup
	extern _ft_strlen
    extern _ft_strcpy
    extern malloc
	extern __errno_location

_ft_strdup:
	push rdi
	call _ft_strlen wrt ..plt
	inc rax

	mov rdi, rax
	call malloc wrt ..plt
	cmp rax, 0
	jne .copy

	mov edi, 12
	call __errno_location wrt ..plt
	mov dword [rax], edi
	xor rax, rax
	ret

.copy:
	pop rsi
	mov rdi, rax
	call _ft_strcpy wrt ..plt
	ret