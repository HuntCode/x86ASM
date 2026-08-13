; SumArray_x64.asm - Chapter 4: sum a 64-bit integer array.

ExitProcess PROTO

.data
intarray QWORD 1000000000000h, 2000000000000h, 3000000000000h, 4000000000000h
sum      QWORD 0

.code
main PROC
    sub rsp, 28h                ; Shadow space and 16-byte stack alignment.

    mov rdi, OFFSET intarray
    mov rcx, LENGTHOF intarray
    xor rax, rax

L1:
    add rax, [rdi]
    add rdi, TYPE intarray
    loop L1

    mov sum, rax
    xor ecx, ecx                ; ExitProcess first argument: exit code 0.
    call ExitProcess
main ENDP
END
