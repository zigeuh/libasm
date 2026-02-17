section .text
    global ft_list_remove_if
    extern free

%define REG_CURR rbx
%define REG_FREE r12
%define REG_CMP r13
%define REG_REF r14
%define REG_PREV r15

; ---------------------------
; void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
; ---------------------------
ft_list_remove_if:
    push rbp
    mov rbp, rsp
    
    ; Saves used registers
    push REG_CURR
    push REG_FREE
    push REG_CMP
    push REG_REF
    push REG_PREV
    sub rsp, 8                              ; Aligns the stack on 16 bytes

    ; Gathers *begin_list
    xor REG_CURR, REG_CURR
    mov REG_CURR, [rdi]
    test REG_CURR, REG_CURR
    jz .done                                ; Leaves if the list is empty

    ; Gathers the data_ref
    xor REG_REF, REG_REF
    mov REG_REF, rsi
    test REG_REF, REG_REF
    jz .done                                ; Leaves if no data_ref is given

    ; Gathers int (*cmp)()
    xor REG_CMP, REG_CMP
    mov REG_CMP, rdx
    test REG_CMP, REG_CMP
    jz .done                                ; Leaves if no cmp function is given

    ; Gathers void (*free_fct)(void *)
    xor REG_FREE, REG_FREE
    mov REG_FREE, rcx
    test REG_FREE, REG_FREE
    jz .done                                ; Leaves if no free function is given

.first:
    xor REG_PREV, REG_PREV
    mov REG_PREV, rdi                       ; Store temporaly *begin_list in case we need to delete the first node

    ; cmp(node->data, data_ref)
    push REG_CURR
    mov rdi, [REG_CURR]
    mov rsi, REG_REF
    call REG_CMP
    pop REG_CURR

    test rax, rax
    jnz .loop

    ; Changes the head node                        Need fix if multiples bad nodes in a row
    mov rdi, REG_PREV
    mov REG_PREV, [REG_CURR + 8]
    mov [rdi], REG_PREV

    ; Call free_fct on node->data
    mov rdi, [REG_CURR]
    call REG_FREE

    ; free(node)
    mov rdi, REG_CURR
    mov REG_CURR, [REG_CURR + 8]
    mov REG_PREV, REG_CURR
    call free wrt ..plt
    jmp .loop_end

; ---------------------------
; Parse the given linked list
; ---------------------------
.loop:
    ; Verify is the current node needs to be removed
    push REG_CURR
    mov rdi, [REG_CURR]
    mov rsi, REG_REF
    call REG_CMP
    pop REG_CURR 

    test rax, rax
    jz .free                                ; If cmp returns 0, it needs to be removed
    mov REG_PREV, REG_CURR                  ; Else, keep this node as the previous one
    mov REG_CURR, [REG_CURR + 8]            ; and go onto the next one

.loop_end:
    test REG_CURR, REG_CURR
    jz .done
    jmp .loop

; ---------------------------
; Removing the current node
; ---------------------------
.free:
    ; Call free_fct on node->data
    mov rdi, [REG_CURR]
    call REG_FREE

    ; free(node)
    mov rdi, REG_CURR
    mov REG_CURR, [REG_CURR + 8]            ; Goes onto the next node
    mov [REG_PREV + 8], REG_CURR            ; and changes the previous node->next to the new current one
    call free wrt ..plt
    
    jmp .loop_end

.done:
    pop REG_PREV
    pop REG_REF
    pop REG_CMP
    pop REG_FREE
    pop REG_CURR
    leave
    ret