; AddTwo_x64.asm - Chapter 3: add three 64-bit integers.

ExitProcess PROTO

.data
firstval  QWORD 20002000h
secondval QWORD 11111111h
thirdval  QWORD 22222222h
sum       QWORD 0

.code
main PROC
    sub rsp, 28h                ; Shadow space and 16-byte stack alignment.

    mov rax, firstval
    add rax, secondval
    add rax, thirdval
    mov sum, rax

    xor ecx, ecx                ; ExitProcess first argument: exit code 0.
    call ExitProcess
main ENDP
END
