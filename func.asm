global _start

_start:
    call func
    mov eax, 1
    int 0x80