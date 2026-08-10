# x86ASM

基于《汇编语言：基于 x86 处理器（第 8 版）》的 Windows/MASM 学习项目。

## 当前构建方式

第 3 章的加法示例同时提供两个独立源文件：

```text
AddTwo_x86.asm  仅在 Win32 配置中编译
AddTwo_x64.asm  仅在 x64 配置中编译
```

请在 Visual Studio 2022 中选择：

```text
Debug | Win32
```

再执行“生成解决方案”。Win32 示例使用 `.386`、`.model flat,stdcall` 和 `INVOKE`；x64 示例使用 `RAX`、`RCX` 和 Windows x64 调用约定。两个文件不会在同一配置中同时参与链接。

`.asm` 文件应保存为 UTF-8 无 BOM；仓库中的 `.editorconfig` 用于保持该约定。

## 仓库结构

```text
AddTwo_x86.asm         第 3 章 Win32 学习示例
AddTwo_x64.asm         第 3 章 x64 对照示例
x86ASM.sln             Visual Studio 解决方案
x86ASM.vcxproj         项目配置
build/bin/<平台>/<配置>/  生成的 EXE、PDB 等最终产物
build/obj/<平台>/<配置>/  OBJ、ILK、TLOG、汇编清单等中间产物
```

`build/`、`.vs/` 和 `*.user` 都是本机生成状态，不提交到 Git。

## 后续练习

每个有独立入口点 `main` 的新练习都应创建为一个新的 Visual Studio 项目，并加入本解决方案，例如：

```text
examples/ch04-data-transfers/ch04-data-transfers.vcxproj
examples/ch05-procedures/ch05-procedures.vcxproj
```

这样每个练习可以独立选择 Win32/x64 对照源、独立调试，也不会因为多个 `main` 符号发生链接冲突。
