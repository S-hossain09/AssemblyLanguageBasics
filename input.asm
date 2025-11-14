section .bss        ; Uninitialized data written here
buffer: resb 4
bufferSize equ 4

section .data
inputMsg db "Enter a number: ",
; db - define bytes
inputLen equ $ - inputMsg     ; finds the length of msg

outputMsg db "The Number is: "
outputLen equ $ - outputMsg

section .text       ; code is written here
global _start

_start:
    ;-------- printing : "Enter A Number" --------
    mov rax, 1
    mov rdi, 1
    mov rsi, inputMsg
    mov rdx, inputLen
    syscall

    ;-------- Taking Input -------- 
    mov rax, 0
    mov rdi, 0
    mov rsi, buffer
    mov rdx, bufferSize
    syscall

    ;-------- Printing : "The Number is: " --------
    mov rax, 1
    mov rdi, 1
    mov rsi, outputMsg
    mov rdx, outputLen
    syscall

    ;-------- Printing user input --------
    mov rax, 1
    mov rdi, 1
    mov rsi, buffer
    mov rdx, bufferSize
    syscall

    ;-------- Exiting --------
    mov rax, 60
    xor rdi, rdi
    syscall
    