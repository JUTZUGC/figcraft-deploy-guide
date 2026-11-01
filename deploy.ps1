# FigCraft 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/storytold/figcraft#readme
# 更新日期：2026-11-01
# 类型：binary
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command curl.exe -ErrorAction SilentlyContinue)) { throw '需要先安装 curl（Windows 10+ 自带 curl.exe）' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

curl.exe -fL -o figcraft.msi https://github.com/storytold/figcraft/releases/download/v0.13.1/figcraft-0.13.1-windows-x64.msi
$h=(Get-FileHash .\figcraft.msi -Algorithm SHA256).Hash.ToLower()
if ($h -ne "c9807ae713de0960d4de274b3a16c40837dea364978754e6b123c050b15af424") { throw "SHA256 校验失败" }
Start-Process msiexec.exe -ArgumentList '/i', "$PWD\figcraft.msi" -Wait
Write-Host "安装完成：从开始菜单打开 FigCraft"

Write-Host ''

Write-Host '下载与校验完成，安装包在 .download 目录'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/storytold/figcraft#readme'
