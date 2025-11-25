section .text
	global _ft_strlen

_ft_strlen:
	xor rax, rax
.loop:
	mov cl, byte [rdi + rax]
	test cl, cl
	je .done
	inc rax
	jmp .loop
.done:
	ret
