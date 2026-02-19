section .text
	global ft_strcmp

; ---------------------------
; int ft_strcmp(const char *s1, const char *s2);
; ---------------------------
ft_strcmp:
.loop:
	mov al, byte [rdi]			; Get the current s1 char
	mov dl, byte [rsi]			; Get the current s2 char
	cmp al, dl					; Check if any difference between the 2 current chars
	jne .end

	cmp al, 0					; If there is not difference, and current s1 char is null
	je .end						; We reached the end

	inc rdi						; Increment s1 ptr
	inc rsi						; Increment s2 ptr
	jmp .loop 

.end:
	sub al, dl
	movsx eax, al
	ret
