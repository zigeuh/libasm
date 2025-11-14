section .text
global ft_strcpy
ft_strcpy:
	push rdi
	mov rcx, rdi
.loop:
	mov al, byte [rsi]
	mov byte [rcx], al
	inc rcx
	inc rsi
	test al, al
	jnz .loop
	pop rax
	ret
.error:
	ret
