; 库测试 #1: 整数输入/输出 (InputLoop.asm)

; 测试如下过程: Clrscr、Crlf、DumpMem、ReadInt、SetTextColor、
; WaitMsg、WriteBin、WriteHex, 以及 WriteString。

INCLUDE Irvine32.inc

.data
COUNT = 4
BlueTextOnGray = blue + (lightGray * 16)
DefaultColor = lightGray + (black * 16)
arrayD SDWORD 12345678h, 1A4B2000h, 3434h, 7AB9h
prompt BYTE "Enter a 32-bit signed integer: ", 0

.code
main PROC
    ; 选择淡灰色背景上的蓝色文本
    mov  eax, BlueTextOnGray
    call SetTextColor
    call Clrscr                 ; 清屏

    ; 使用 DumpMem 显示数组
    mov  esi, OFFSET arrayD     ; 起始偏移量
    mov  ebx, TYPE arrayD       ; 双字 = 4 字节
    mov  ecx, LENGTHOF arrayD   ; arrayD 中的单元数量
    call DumpMem                ; 显示内存

    ; 要求用户输入序列有符号整数
    call Crlf                   ; 新的一行
    mov  ecx, COUNT

L1:
    mov  edx, OFFSET prompt
    call WriteString
    call ReadInt                ; 输入整数到 EAX
    call Crlf                   ; 新的一行

    ; 以十进制、十六进制及二进制显示整数
    call WriteInt               ; 显示为有符号十进制数
    call Crlf
    call WriteHex               ; 显示为十六进制数
    call Crlf
    call WriteBin               ; 显示为二进制数
    call Crlf
    call Crlf
    loop L1                     ; 重复循环

    ; 将控制台窗口恢复为默认颜色
    call WaitMsg                ; "Press any key..."
    mov  eax, DefaultColor
    call SetTextColor
    call Clrscr

    exit
main ENDP
END main