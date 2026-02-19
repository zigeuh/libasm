section .text
	global ft_strcmp

ft_strcmp:
.loop:
	mov al, [rdi]
	mov dl, [rsi]
	cmp al, dl
	jne .not_equal

	cmp al, 0
	je .equal

	inc rdi
	inc rsi
	jmp .loop 
.not_equal:
	ja .first_big
	jb .first_small
.first_big:
	mov rax, 1
	ret
.first_small:
	mov rax, -1
	ret
.equal:
	mov rax, 0
	ret
