section .text
    global ft_list_size

ft_list_size:
    xor eax, eax
    mov rdx, rdi

.loop:
    test rdx, rdx
    jz .done
    inc eax
    mov rdx, [rdx + 8]
    jmp .loop

.done:
    ret