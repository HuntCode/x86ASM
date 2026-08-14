; 链接库测试 #3: 性能计时 (TestLib3.asm)

; 计算嵌套循环的执行时间

INCLUDE Irvine32.inc

.data
OUTER_LOOP_COUNT = 3
startTime DWORD ?
msg1 BYTE "Please wait...", 0dh, 0ah, 0
msg2 BYTE "Elapsed milliseconds: ", 0

.code
main PROC
    mov  edx, OFFSET msg1       ; "Please wait..."
    call WriteString

    ; 保存起始时间
    call GetMSeconds
    mov  startTime, eax

    ; 开始外层循环
    mov  ecx, OUTER_LOOP_COUNT
L1:
    call innerLoop
    loop L1

    ; 计算执行时间
    call GetMSeconds
    sub  eax, startTime

    ; 显示执行时间
    mov  edx, OFFSET msg2       ; "Elapsed milliseconds: "
    call WriteString
    call WriteDec               ; 写毫秒数
    call Crlf

    exit
main ENDP

innerLoop PROC
    push ecx                    ; 保存当前 ECX 的值
    mov  ecx, 0FFFFFFFh         ; 设置循环计数器
L1:
    mul  eax                    ; 消耗一些时钟周期
    mul  eax
    mul  eax
    loop L1                     ; 重复内层循环

    pop  ecx                    ; 恢复 ECX 被保存的值
    ret
innerLoop ENDP

END main