section .text
	global ft_write
	extern __errno_location

; ---------------------------
; ssize_t ft_write(int fd, const void *buf, size_t count);
; ---------------------------
ft_write:
	mov rax, 1							; syscall 1 = write
	syscall

	cmp rax, 0							; if syscall result is < 0,
	jl .error							; it handles the error
	ret

.error:
	neg rax								; convert errno to a positive value
	mov rdi, rax
	call __errno_location wrt ..plt		; get ptr to errno address
	mov [rax], rdi						; set errno value
	mov rax, -1							; set return value to -1
	ret
