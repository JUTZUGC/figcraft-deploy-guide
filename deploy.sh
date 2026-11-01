#!/usr/bin/env bash
set -euo pipefail
# FigCraft 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/storytold/figcraft#readme
# 更新日期：2026-11-01
# 类型：binary
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v curl >/dev/null 2>&1 || { echo "需要先安装 curl"; exit 1; }

mkdir -p .download
cd .download

curl -fL -o figcraft.AppImage https://github.com/storytold/figcraft/releases/download/v0.13.1/figcraft-0.13.1-linux-x86_64.AppImage
echo "2fa44efdf4878dea7eb79b1227f274bccb298aab6431d78d0e8370ea6c125474  figcraft.AppImage" | sha256sum -c -
chmod +x figcraft.AppImage
echo "安装完成：运行 ./figcraft.AppImage，新建文件试自动布局"

echo ""

echo "下载与校验完成，安装包在 .download 目录"
echo "若结果异常或需要改配置，请参考官方文档：https://github.com/storytold/figcraft#readme"
