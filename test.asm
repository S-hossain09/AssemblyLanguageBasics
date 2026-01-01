section .data
    num1 dq 10          ; first number
    num2 dq 20          ; second number

section .text
    global _start

_start:
    ; Load numbers into registers
    mov rax, [num1]     ; rax = 10
    mov rbx, [num2]     ; rbx = 20
    
    ; Swap using arithmetic (same logic as your code)
    add rax, rbx        ; rax = 30
    sub rbx, rax        ; rbx = 20 - 30 = -10
    neg rbx             ; rbx = 10
    sub rax, rbx        ; rax = 30 - 10 = 20
    
    ; Store results back
    mov [num1], rax     ; num1 = 20
    mov [num2], rbx     ; num2 = 10
    
    ; Exit with code (rbx value = 10)
    mov rax, 60         ; sys_exit
    mov rdi, rbx        ; exit code = 10
    syscall