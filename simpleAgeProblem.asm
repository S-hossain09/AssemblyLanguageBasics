section .data
    prompt db "Enter age: ", 0
    prompt_len equ $ - prompt
    
    msg_greater db "Age is greater than 10", 10
    msg_greater_len equ $ - msg_greater
    
    msg_less db "Age is less than 10", 10
    msg_less_len equ $ - msg_less
    
    msg_equal db "Age is 10", 10
    msg_equal_len equ $ - msg_equal

section .bss
    input resb 3
    age resb 1

section .text
    global _start

_start:
    ; Print prompt
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt
    mov rdx, prompt_len
    syscall

    ; Read input
    mov rax, 0
    mov rdi, 0
    mov rsi, input
    mov rdx, 3
    syscall
    
    ; Convert string to integer
    xor rax, rax
    xor rcx, rcx
    mov rsi, input
    
convert_loop:
    movzx rdx, byte [rsi + rcx]
    cmp dl, 10          ; check for newline
    je ageCheck
    cmp dl, '0'
    jl ageCheck
    cmp dl, '9'
    jg ageCheck
    
    sub dl, '0'
    imul rax, 10
    add rax, rdx
    inc rcx
    jmp convert_loop

ageCheck:
    mov byte [age], al

    cmp byte [age], 10
    jg greater_than_10

    cmp byte [age], 10
    jl less_than_10

    jmp equal_to_10


greater_than_10:
    ; Print prompt
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_greater
    mov rdx, msg_greater_len
    syscall
    jmp exit_program


less_than_10:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_less
    mov rdx, msg_less_len
    syscall
    jmp exit_program

equal_to_10:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_equal
    mov rdx, msg_equal_len
    syscall
    jmp exit_program


exit_program:
    mov rax, 60
    xor rdi, rdi
    syscall
