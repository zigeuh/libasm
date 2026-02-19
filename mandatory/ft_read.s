section .text
	global ft_read
	extern __errno_location

; ---------------------------
; ssize_t ft_read(int fd, void *buf, size_t count);
; ---------------------------
ft_read:
	mov rax, 0							; syscall 1 = write
	syscall

	cmp rax, 0							; if syscall result is < 0,
	jl .error							; it handles the error
	ret
	
.error:
	neg rax								; convert errno to a positive value
	call __errno_location wrt ..plt		; get ptr to errno address
	mov [rax], rdi						; set errno value
	mov rax, -1							; set return value to -1
	ret
