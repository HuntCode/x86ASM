; 字符串反转

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
aName BYTE "This is a test string",0
nameSize = ($-aName)-1

.code
main PROC
    mov ecx, nameSize
    mov esi, 0

L1: movzx eax, aName[esi]
    push eax
    inc esi
    loop L1

    mov ecx, nameSize
    mov esi, 0

L2: pop eax
    mov aName[esi], al
    inc esi
    loop L2

    INVOKE ExitProcess, 0
main ENDP
END main
