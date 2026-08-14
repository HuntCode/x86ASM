; 测试ArraySum过程

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
array DWORD 10000h,20000h,30000h,40000h,50000h
theSum DWORD ?

.code
main PROC
    mov esi, OFFSET array
    mov ecx, LENGTHOF array

    call ArraySum
    mov theSum, eax

    INVOKE ExitProcess, 0
main ENDP

;----------------------------------------------
; ArraySum
; 参数: ESI -> 数组偏移量
;       ECX -> 数组元素个数
; 返回: EAX -> 总和
;----------------------------------------------
ArraySum PROC
    push esi
    push ecx
    mov eax, 0

L1:
    add eax, [esi]
    add esi, TYPE DWORD
    loop L1
    pop ecx
    pop esi

    ret
ArraySum ENDP
END main
