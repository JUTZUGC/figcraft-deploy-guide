# FigCraft 一键安装指南

> 第三方部署指南 · 非 FigCraft 官方仓库。官方项目：[storytold/figcraft](https://github.com/storytold/figcraft)
> 内容来自官方文档（2026-11-01）。项目迭代快，请以[官方文档](https://github.com/storytold/figcraft#readme)为准。

[![⚡ 一键安装](https://img.shields.io/badge/%E2%9A%A1_%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#一键安装推荐用百度搭子)

## 一键安装（推荐：用百度搭子）

> [!TIP]
> 同一个设计稿不用等云端加载：原生应用秒开，断网也能改，文件就在自己磁盘上。

⚠️ 官方把当前阶段标为 alpha，自评约完成商业工具的 49%；打开 `.fig` 文件只做尽力兼容，多人协作还是预览状态，也没在真实设计文档上验证过。安装包未签名时 Windows SmartScreen 与 macOS Gatekeeper 会拦一次。界面与文字工具的字体会回退到系统字体，想要一致效果需另外拉 craft-fonts。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/figcraft-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子会按系统下载安装包并比对 SHA256，装完带你打开一个文件试自动布局与组件变体，按它的提示确认即可，结束时它会告诉你结果。
   （下载地址与校验方式以官方文档为准。）



## FigCraft 是什么？

FigCraft 是开源的把帧、自动布局、组件变体、矢量网络和原型做进一个原生应用，秒开、离线、纯 Rust（协议：Apache-2.0，<img src="https://img.shields.io/github/stars/storytold/figcraft?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

原生界面设计工具：帧、自动布局、组件与变体、矢量网络、样式与变量、原型连线，桌面端离线可用，另有一个可自托管的协作服务器提供分享链接与共同编辑。

- 纯 Rust 原生：启动快，内存占用低
- 离线可用：文件在本地，不依赖云
- 核心功能齐：自动布局、组件变体、变量
- 五平台安装包：Win / macOS / Linux / FreeBSD / Web
- 可自建协作：分享链接与在线编辑
- Apache-2.0，可自由改造

（来源：[官方仓库](https://github.com/storytold/figcraft)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 4.0k stars 10 月新项目 | 名称搜索仅 54 条结果 |
| 纯 Rust 原生 | 启动与占用都优于 Electron 方案 |
| 离线可用 | 文件保存在本地 |
| 五平台安装包齐全 | Release 提供校验文件 |
| 可自建协作服务器 | — |
| Apache-2.0 | 可商用可二开 |

| 需要注意 | 说明 |
|---|---|
| 官方标注 alpha | 自评完成度约 49% |
| .fig 文件兼容性有限 | — |
| 协作功能仅预览 | 无账号与权限 |
| 字体需额外拉 craft-fonts | — |
| 自建协作要自己配 systemd 与反代 | — |

> 以上基于官方文档与社区反馈整理（2026-11-01），以官方最新文档为准。

## 官方安装方式（可手动执行）

```bash
curl -fL -o figcraft.AppImage https://github.com/storytold/figcraft/releases/download/v0.13.1/figcraft-0.13.1-linux-x86_64.AppImage
echo "2fa44efdf4878dea7eb79b1227f274bccb298aab6431d78d0e8370ea6c125474  figcraft.AppImage" | sha256sum -c -
chmod +x figcraft.AppImage
echo "安装完成：运行 ./figcraft.AppImage，新建文件试自动布局"
```

安装包来源：[https://github.com/storytold/figcraft/releases/latest](https://github.com/storytold/figcraft/releases/latest)

## 验证状态

| 场景 | 状态 |
|---|---|
| README 确认 alpha 状态、五平台安装包与自建服务器方式 | 已核对 2026-11-01 |
| Release v0.13.1 的 SHA256SUMS.txt 已下载核对（Windows 与 Linux） | 已核对 2026-11-01 |
| 未实测安装与设计操作 | 说明 2026-11-01 |
| MCP 冒烟：initialize / tools/list 返回 get_guide、search_guide、get_project_info | 已验证 2026-11-01 |
| 非目标宿主调用 get_guide 被拦截（HOST_NOT_ALLOWED） | 已验证 2026-11-01 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

项目本身不含 MCP；本仓库的 MCP 只提供安装步骤、版本说明与常见问题。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-11-01）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\figcraft-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 安装包对照（v0.13.1）

| 平台 | 文件 | 大小 |
|---|---|---|
| Windows x64 | figcraft-0.13.1-windows-x64.msi | 视版本而定 |
| Windows x64 便携版 | figcraft-0.13.1-windows-x64-portable.zip | 无需安装 |
| Windows ARM64 | figcraft-0.13.1-windows-arm64.msi | — |
| macOS 通用 | figcraft-0.13.1-macos-universal.dmg | 已签名公证 |
| Linux x64 | figcraft-0.13.1-linux-x86_64.AppImage / .deb | 90.9 / 98.2 MB |
| Linux ARM64 | AppImage / deb / rpm / flatpak | — |
| FreeBSD | tar.gz | — |

Release 里带 `SHA256SUMS.txt`，可一次核对全部文件。

## 自建协作服务器（可选）

官方在 `docs/server.md` 里给了 Linux 部署方式：装 `figcraft-server`，配 systemd 单元，前面挂 Caddy 或 nginx，也可以用 Docker。协作目前没有账号体系，访问权限就是分享链接本身。

## 从源码构建

```bash
cargo run --release -p figcraft
```

界面字体来自 `craft-fonts`，需要克隆到仓库同级目录，否则回退系统字体。

## 注意

- alpha 阶段，别把关键项目直接押上去
- `.fig` 导入是尽力兼容，复杂文件可能还原不全
- 协作是预览功能，没有账号与权限体系
- 分享链接等于访问凭证，别公开发到群里
- Apache-2.0，二次分发保留声明

## 常见坑

- Windows 安装被 SmartScreen 拦：核对 SHA256 后仍报，选「更多信息 → 仍要运行」
- macOS 提示无法验证：在隐私与安全性里允许
- AppImage 打不开：先 chmod +x，缺 FUSE 时用 --appimage-extract
- 字体显示不一致：克隆 craft-fonts 到仓库同级目录
- 打开 .fig 乱版：属尽力兼容，改用官方工具导出 SVG 再导入
- 协作连不上：确认服务端已起、证书与 wss 地址正确
- 分享链接被陌生人打开：链接即权限，泄露后重建房间

## 免责声明

本仓库为第三方指南，与 FigCraft 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-11-01），项目迭代快，请以[官方文档](https://github.com/storytold/figcraft#readme)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
