section .text
global ft_write
ft_write:
	cmp rsi, 0
	mov rax, 1
	syscall
	je .error
	ret

.error
	mov rax, -1
	ret
