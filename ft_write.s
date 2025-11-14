section .text
global ft_write
ft_write:
	cmp rsi, 0
	je .error
	mov rax, 1
	syscall
	ret

.error
	mov rax, -1
	ret
