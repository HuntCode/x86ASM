; SumArray_x86.asm - Chapter 4: sum a 32-bit integer array.

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
intarray DWORD 10000h, 20000h, 30000h, 40000h
sum      DWORD 0

.code
main PROC
    mov edi, OFFSET intarray
    mov ecx, LENGTHOF intarray
    xor eax, eax

L1:
    add eax, [edi]
    add edi, TYPE intarray
    loop L1

    mov sum, eax
    INVOKE ExitProcess, 0
main ENDP
END main
