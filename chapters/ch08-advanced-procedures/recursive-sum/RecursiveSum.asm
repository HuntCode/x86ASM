; 整数求和

INCLUDE Irvine32.inc
.code
main PROC
    mov ecx, 5
    mov eax, 0
    call CalcSum
L1: call WriteDec
    call Crlf
    exit
main ENDP

CalcSum PROC
; 计算整数列表的和数
; 接收：ECX=计算数
; 返回：EAX=和数

    cmp ecx, 0
    jz L2
    add eax, ecx
    dec ecx
    call CalcSum
L2: ret
CalcSum ENDP
END main
