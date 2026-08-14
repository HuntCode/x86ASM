; 链接库测试 #2: 随机整数 (TestLib2.asm)

; 测试 Irvine32 库中的过程

INCLUDE Irvine32.inc

TAB = 9                         ; Tab 的 ASCII 码

.code
main PROC
    call Randomize              ; 初始化随机数生成器
    call Rand1
    call Rand2
    exit
main ENDP

Rand1 PROC
    ; 生成 10 个伪随机整数 (无符号 32 位)
    mov  ecx, 10                ; 循环 10 次
L1:
    call Random32               ; 生成随机数
    call WriteDec               ; 写无符号十进制数
    mov  al, TAB                ; 水平制表符
    call WriteChar              ; 写制表符
    loop L1

    call Crlf
    ret
Rand1 ENDP

Rand2 PROC
    ; 生成 10 个在 -50 到 +49 之间的伪随机整数
    mov  ecx, 10                ; 循环 10 次
L1:
    mov  eax, 100               ; 数值范围: 0 到 99
    call RandomRange            ; 生成随机数
    sub  eax, 50                ; 数值范围: -50 到 +49
    call WriteInt               ; 写有符号十进制数
    mov  al, TAB                ; 水平制表符
    call WriteChar              ; 写制表符
    loop L1

    call Crlf
    ret
Rand2 ENDP

END main