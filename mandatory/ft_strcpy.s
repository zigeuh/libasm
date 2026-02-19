section .text
	global ft_strcpy

; ---------------------------
; char *ft_strcpy(char *dest, const char *src);
; ---------------------------
ft_strcpy:
	mov rax, rdi

.loop:
	mov dl, byte [rsi]				; Get current src char
	mov byte [rdi], dl				; Write in dest the char
	inc rdi							; Increment dest ptr
	inc rsi							; Increment src ptr
	test dl, dl						; Test if current src char is \0
	jnz .loop						; If not continue copying
	ret
