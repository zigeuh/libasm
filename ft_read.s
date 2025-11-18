section .text
global ft_read
ft_read:
	cmp rsi, 0
	mov rax, 0
	syscall
	je .error
	ret
	
.error:
	mov rax, -1
	ret
