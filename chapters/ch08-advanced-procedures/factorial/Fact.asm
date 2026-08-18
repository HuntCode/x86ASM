; 计算阶乘
INCLUDE Irvine32.inc
.code
main PROC
    push 5
    call Fact
    call WriteDec
    call Crlf
    exit
main ENDP

Fact PROC
; 递归计算n的阶乘
; 接收：[epd+8]=n
; 返回：EAX=n的阶乘
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]
    cmp eax, 0
    ja L1
    mov eax, 1
    jmp L2
L1: dec eax
    push eax
    call Fact

ReturnFact:
    mov ebx, [ebp + 8]
    mul ebx
L2: pop ebp
    ret 4
Fact ENDP
END main
