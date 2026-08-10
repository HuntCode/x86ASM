# x86ASM

基于《汇编语言：基于 x86 处理器（第 8 版）》的 Windows/MASM 学习项目。

## 当前构建方式

`AddTwo.asm` 当前启用的是第 3 章的 32 位示例。请在 Visual Studio 2022 中选择：

```text
Debug | Win32
```

再执行“生成解决方案”。该示例使用 `.386`、`.model flat,stdcall` 和 `INVOKE`，不能通过切换到 x64 配置自动变成 64 位程序。

`.asm` 文件应保存为 UTF-8 无 BOM；仓库中的 `.editorconfig` 用于保持该约定。

## 仓库结构

```text
AddTwo.asm             当前学习示例
x86ASM.sln             Visual Studio 解决方案
x86ASM.vcxproj         项目配置
build/bin/<平台>/<配置>/  生成的 EXE、PDB 等最终产物
build/obj/<平台>/<配置>/  OBJ、ILK、TLOG、汇编清单等中间产物
```

`build/`、`.vs/` 和 `*.user` 都是本机生成状态，不提交到 Git。
