# x86ASM

基于《汇编语言：基于 x86 处理器（第 8 版）》的 Windows/MASM 学习项目。

## 当前构建方式

解决方案按章节示例拆分为独立项目。每个项目都提供一对源文件：

```text
*_x86.asm  仅在 Win32 配置中编译
*_x64.asm  仅在 x64 配置中编译
```

请在 Visual Studio 2022 中选择：

```text
Debug | Win32
```

再执行“生成解决方案”。Win32 示例使用 `.386`、`.model flat,stdcall` 和 `INVOKE`；x64 示例使用 `RAX`、`RCX` 和 Windows x64 调用约定。每个项目中，两个文件不会在同一配置中同时参与链接。

`.asm` 文件应保存为 UTF-8 无 BOM；仓库中的 `.editorconfig` 用于保持该约定。

## 仓库结构

```text
x86ASM.sln                         Visual Studio 解决方案
chapters/ch03-add-two/             第 3 章：三个整数相加
chapters/ch04-sum-array/           第 4 章：数组求和
chapters/ch05-procedures/          第 5 章：过程与栈
  revstr/                          示例：使用栈反转字符串（Win32）
  test-array-sum/                  示例：调用 ArraySum 过程（Win32）
  test-lib-1-input-loop/           Irvine32 测试 1：整数输入输出（Win32）
  test-lib-2-random/               Irvine32 测试 2：随机整数（Win32）
  test-lib-3-timing/               Irvine32 测试 3：性能计时（Win32）
chapters/ch08-advanced-procedures/ 第 8 章：高级过程
  recursive-sum/                   示例：递归计算整数和（Win32）
  factorial/                       示例：递归计算阶乘（Win32）
third_party/irvine32/              仓库内共享的 Irvine32 教学库依赖
build/bin/<项目>/<平台>/<配置>/     EXE、PDB 等最终产物
build/obj/<项目>/<平台>/<配置>/     OBJ、ILK、TLOG、汇编清单等中间产物
```

`build/`、`.vs/` 和 `*.user` 都是本机生成状态，不提交到 Git。

## 后续练习

每个有独立入口点 `main` 的新练习都应创建为一个新的 Visual Studio 项目，并加入本解决方案。为保持目录清晰，放在 `chapters/` 下，例如：

```text
chapters/ch05-procedures/ch05-procedures.vcxproj
chapters/ch06-conditional-jumps/ch06-conditional-jumps.vcxproj
```

这样每个练习可以独立选择 Win32/x64 对照源、独立调试，也不会因为多个 `main` 符号发生链接冲突。新项目应沿用按 `$(ProjectName)/$(Platform)/$(Configuration)` 隔离的输出路径，避免覆盖其他练习的程序。
