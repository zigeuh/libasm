section .text
    global ft_atoi_base

%define REG_RET eax
%define REG_BASE r8
%define REG_TEMP r9
%define REG_LEN r11d
%define REG_SIGN rcx
%define REG_STR rdi

; ---------------------------
; int ft_atoi_base(char *str, char *base);
; ---------------------------
ft_atoi_base:
    push rbx
    xor REG_RET, REG_RET                ; Preparing return register
    mov REG_SIGN, 1                     ; Set default sign to positive
    mov REG_BASE, rsi                   ; Copy the base in REG_BASE

; Check if the base has valid chars (looping char by char)
.check_base_chars:
    mov bl, byte [REG_BASE]             ; Get the current char
    cmp bl, 0                           ; Check if the char if \0
    je .base_len                        ; Go to check the len of the base if we reached a \0

    cmp bl, '0'                         ; Compare char with '0'
    jl .error                           ; If < '0', char is invalid (can't be a base char under 48)
    cmp bl, '9'                         ; Compare char with '9'
    jle .char_ok                        ; If <= '9', char is valid (between '0' and '9')

    cmp bl, 'A'                         ; Compare char with 'A'
    jl .error                           ; If < 'A', char is invalid (can't be a base char under 65 after checking numbers)
    cmp bl, 'Z'                         ; Compare char with 'Z'
    jle .char_ok                        ; If <= 'Z', char is valid (between 'A' and 'Z')

    cmp bl, 'a'                         ; Compare char with 'a'
    jl .error                           ; If < 'a', char is invalid (can't be a base char under 98 after checking numbers and uppercases)
    cmp bl, 'z'                         ; Compare char with 'z'
    jle .char_ok                        ; If <= 'z', char is valid (between 'a' and 'z')

    jl .error                           ; Otherwise, error

.char_ok:
    mov REG_TEMP, REG_BASE              ; Store the current ptr of REG_BASE to REG_TEMP

; Check for duplicates in base
.check_base_dupes:
    inc REG_TEMP                        ; Increment REG_TEMP to avoid check the same char
    cmp byte [REG_TEMP], 0              ; Check if we reached the end of the base
    je .dupes_ok                        ; If we did, no dupe for the current char
    cmp byte [REG_TEMP], bl             ; Compare the current char with char on the REG_TEMP cursor
    je .error                           ; If equal, this is a dupe
    jmp .check_base_dupes               ; Otherwise we continue looping in the base

; Handle behavior when valid char and no dupe
.dupes_ok:
    inc REG_BASE                        ; Increment REG_BASE ptr
    jmp .check_base_chars               ; Jump back to check if the new char is valid

; ---------------------------
; Check base's len
; ---------------------------
.base_len:
    xor REG_LEN, REG_LEN                ; Set our counter to 0 (REG_LEN)
    mov REG_BASE, rsi                   ; Reset REG_BASE to the beginning

; Get len
.base_len_loop:
    mov bl, byte [REG_BASE]             ; Set the current char to REG_BASE ptr in bl
    cmp bl, 0                           ; Check if we reached the end of the base (\0)
    je .check_base_len                  ; If so, check the len
    inc REG_LEN                            ; Else, increment REG_LEN ptr 
    inc REG_BASE                        ; And increment REG_BASE ptr
    jmp .base_len_loop                  ; Continue looping

; Check len validity
.check_base_len:
    cmp REG_LEN, 1                      ; Comparing the base len with 1
    jle .error                          ; If <= 1, base len is incorrect (minimum 2)
    jmp .skip_whitespaces               ; Jump to the next part

; ---------------------------
; Skip whitespaces (if in first places)
; ---------------------------

; Skip a char
.skip_whitespace:
    inc REG_STR

; Check SPACE (ASCII 32)
.skip_whitespaces:
    cmp byte [REG_STR], 32              ; If current REG_STR char is a space
    je .skip_whitespace                 ; Skip it

; Check whitespaces between 9 and 13
.check_others_whitespaces:
    cmp byte [REG_STR], 13              ; If REG_STR char is greater than 13, it is not a whitespace
    jg .check_minus                     ; So we continue doing others checks
    cmp byte [REG_STR], 9               ; If 13 > REG_STR >= 9
    jge .skip_whitespace                ; Skip it

; Check if a char is '-'
.check_minus:
    cmp byte [REG_STR], '-'
    jne .check_plus                     ; If not a '-', check if it's a '+'
    mov REG_SIGN, -1                    ; If it is a '-', store the info
    inc REG_STR                         ; Skip the '-'
    jmp .respect_base_setup             ; Start checking if the REG_STR respects the given base

; Check if a char is '+'
.check_plus:
    cmp byte [REG_STR], '+'
    jne .respect_base_setup             ; If not a '+', start checking if the REG_STR respects the given base
    inc REG_STR                         ; If it is '+', skip it

; ---------------------------
; Check if str fits base
; ---------------------------

.respect_base_setup:
    mov REG_TEMP, REG_STR
    mov REG_BASE, rsi

; str in base main loop
.respect_base_loop:
    mov dl, byte [REG_TEMP]
    mov bl, byte [REG_BASE]
    cmp dl, 0                           ; If current char to check is null
    je .convert_loop                    ; str is fully valid and start converting
    cmp bl, 0                           ; If end of base is reached
    je .error                           ; No same char was find between str and base

    cmp dl, 32
    je .convert_loop
    cmp dl, 9
    je .convert_loop
    cmp dl, 10
    je .convert_loop
    cmp dl, 11
    je .convert_loop
    cmp dl, 12
    je .convert_loop
    cmp dl, 13
    je .convert_loop

    cmp dl, bl                          ; Comparing current str char and current base char
    je .in_base                         ; If they are the same, it is in base
    inc REG_BASE                        ; Otherwise, increment REG_BASE ptr 
    jmp .respect_base_loop              ; And continue testing

; *str in base
.in_base:
    inc REG_TEMP                        ; Increment REG_TEMP ptr
    mov REG_BASE, rsi                   ; Reset REG_BASE to the beginning
    jmp .respect_base_loop              ; Continue testing

; ---------------------------
; Convert str with base
; ---------------------------

; Get which char between (0-9, a-z, A-Z)
.convert_loop:
    mov bl, byte [REG_STR]
    cmp bl, 0
    je .check_neg                       ; If bl == \0, jump to the last part
    cmp bl, 'a'
    jge .a_z                            ; If bl >= a
    cmp bl, 'A'
    jge .A_Z                            ; If bl >= A
    cmp bl, '0'
    jge .0_9                            ; If bl <= 9
    jmp .check_neg                      ; Only others chars except in-base chars are whitespaces (that stops the conversion)

; Handle a-z conversion
.a_z:
    cmp bl, 'z'
    jg .error                           ; Shouldn't happen with all previous checks
    sub bl, 'a'
    add bl, 10                          ; Add 10 because letters in base start to appear at index 10
    jmp .accumulate

; Handle A-Z conversion
.A_Z:
    cmp bl, 'Z'
    jg .error                           ; Shouldn't happen with all previous checks
    sub bl, 'A'
    add bl, 10                          ; Add 10 because letters in base start to appear at index 10
    jmp .accumulate

; Handle 0-9 conversion
.0_9:
    cmp bl, '9'
    jg .error                           ; Shouldn't happen with all previous checks
    sub bl, '0'
    jmp .accumulate
    
; Update result with base
.accumulate:
    imul REG_RET, REG_LEN               ; Multiply the return value with the base's len
    movzx edx, bl                       ; Move the value of bl (8 bits register) into edx (32 bits register)
    add  REG_RET, edx                   ; Add the same value to REG_RET
    inc  REG_STR                        ; Increment REG_STR ptr
    jmp  .convert_loop                  ; Continue converting

; Check if stored negation
.check_neg:
    cmp REG_SIGN, -1
    jne .done
    neg REG_RET                         ; Negate the result if needed

.done:
    pop rbx
    ret

.error:
    pop rbx
    mov REG_RET, 0
    ret
