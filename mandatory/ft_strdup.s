section .text
	global ft_strdup
	extern ft_strlen
    extern ft_strcpy
    extern malloc
	extern __errno_location

; ---------------------------
; char *ft_strdup(const char *s);
; ---------------------------
ft_strdup:
	push rbx
	mov rbx, rdi						; Save s address for later

	call ft_strlen wrt ..plt			; Get len of s
	inc rax								; Add space for \0

	mov rdi, rax
	call malloc wrt ..plt				; Allocate memory of len + 1
	test rax, rax						; Check if allocation failed
	jnz .copy							; If not we copy the content of s to the new buffer
					
	call __errno_location wrt ..plt		; Get ptr to errno address
	mov edi, 12							; Store errno value in a 32 bits register
	mov [rax], edi						; Set errno value to 12
	xor rax, rax						; Set the return value to NULL
	ret

.copy:
	mov rdi, rax						; Give the new buffer address as dest
	mov rsi, rbx						; Get s address as src
	call ft_strcpy wrt ..plt			; Copy from s to new buffer

	pop rbx
	ret