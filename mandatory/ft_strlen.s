section .text
	global ft_strlen

; ---------------------------
; size_t ft_strlen(const char *s);
; ---------------------------
ft_strlen:
	xor rax, rax					; set our counter to 0

.loop:
	mov cl, byte [rdi + rax]		; parse the string byte by byte
	test cl, cl						; check if current byte is null
	je .done						; if so we can return
	inc rax							; otherwise we increase counter value
	jmp .loop

.done:
	ret
