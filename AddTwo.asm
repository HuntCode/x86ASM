COMMENT !
; AddTwoSum_64.asm - Chapter 3 example.

ExitProcess proto

.data
sum qword 0

.code
main proc
   mov  rax,5
   add  rax,6
   mov  sum,rax

   mov  ecx,0
   call ExitProcess

main endp
end
!

; AddTwo.asm 将两个32为整数相加
; 第3章示例

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
sum DWORD 0

.code
main PROC
	mov eax, 5
	add eax, 6
    mov sum, eax

	INVOKE ExitProcess,0
main ENDP
END main
