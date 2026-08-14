# Irvine32 dependency

This directory contains the minimum files needed by the repository's 32-bit
Irvine library examples:

- `Irvine32.lib`
- `Irvine32.inc`
- `SmallWin.inc`
- `VirtualKeys.inc`

They were copied without modification from `Irvine.zip` in Kip Irvine's
official `surferkip/asmbook` repository:

https://github.com/surferkip/asmbook

Downloaded on 2026-08-14. The downloaded archive had SHA-256:

`91F08E4DACF517CBE14B08F9AF5AC3CDD676DBAB8E452671BAA81443B3C0D881`

The files remain the property of Kip Irvine. The upstream README permits their
download and use for educational purposes and prohibits claiming ownership,
selling, or relicensing them. See the upstream repository for the authoritative
terms and the full library source code.

`Irvine32.props` is repository-local build configuration. Projects importing it
use this directory for MASM includes and library lookup, link `Irvine32.lib`
and `user32.lib`, and apply the compatibility settings used by the official
32-bit sample project.
