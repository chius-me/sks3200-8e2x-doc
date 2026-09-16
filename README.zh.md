<p align="right">
  <a href="./README.md">English</a> | 简体中文
</p>

<h1 align="center">SKS3200-8E2X 配置文档</h1>

<p align="center">
  兮克 / XikeStor SKS3200-8E2X Web 管理界面的社区配置文档。
</p>

<p align="center">
  <img alt="firmware" src="https://img.shields.io/badge/firmware-2.0.0.1-0f766e">
  <img alt="hardware" src="https://img.shields.io/badge/hardware-A0-0f766e">
  <img alt="license" src="https://img.shields.io/badge/license-CC%20BY--SA%204.0-22863a">
</p>

本仓库**不是**厂商官方手册，也与兮克 / XikeStor 无关。

正文依据一台硬件 A0、固件 2.0.0.1 设备的中文 WEBUI 逐页核对写成，并明确标出尚未用抓包、提交或重启验证的行为。

**文档站：** [English](https://chius-me.github.io/sks3200-8e2x-doc/) · [简体中文](https://chius-me.github.io/sks3200-8e2x-doc/zh/)

## 这台交换机

| | |
|---|---|
| 型号 | SKS3200-8E2X |
| 端口 | 8 × 2.5G RJ45 + 2 × 10G SFP+ |
| 角色 | 轻管理二层交换机 |
| 出厂管理地址（厂商 / 社区） | `http://192.168.10.12` |
| 出厂账号（厂商 / 社区） | `admin` / `admin` |

完整规格和来源见 [硬件概览](docs/zh/hardware.md)。

## 先看这些

1. [第一次登录](docs/zh/getting-started.md) — 改管理地址、改密码
2. [VLAN](docs/zh/guides/vlan.md) — 这台机器没有 Access/Trunk 按钮，PVID 和 Tagged/Untagged 要两页一起配
3. [链路聚合](docs/zh/guides/lag.md) — 静态 / LAG / LACP 在页面上怎么出现
4. [文档怎么读](docs/zh/methodology.md) — 「已见 UI」和「已验证转发」不是一回事

本地预览文档站点：

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
mkdocs serve
```

浏览器打开 <http://127.0.0.1:8000>。推送 `main` 后由 `.github/workflows/pages.yml` 发布到 GitHub Pages。

## 文档范围

当前正文对应：

- 型号：SKS3200-8E2X
- 硬件版本：A0
- 固件：2.0.0.1
- 界面：简体中文 WEBUI，4 个主菜单、17 个页面

核对过程中**没有**提交配置，也没有执行保存、清除、重启、恢复、上传或升级。
表中的「当时显示」是读取快照，不是出厂默认值。

同一型号存在另一套更早的 Web 界面（按 Bridge ID 配 VLAN）。
不要把旧评测或 `swctl` 一类工具的步骤直接套到 2.0.0.1 上。
说明见 [固件分代](docs/zh/reference/firmware-families.md)。

## 仓库结构

```text
docs/en/              英文 MkDocs 页面
docs/zh/              中文 MkDocs 页面
sources/              脱敏后的原始核对记录（中文）
.github/              Issue 模板与 GitHub Pages 构建
```

## 贡献

欢迎补充其他固件版本、语言界面或经过验证的转发行为。请先读 [CONTRIBUTING.zh.md](CONTRIBUTING.zh.md)。

提交观察时请写明：**固件 / 硬件 / 页面 / 是否点击了应用或保存 / 是否用抓包验证**。
不要上传含密码的配置文件。

## 许可

文档采用 [CC BY-SA 4.0](LICENSE)。产品名称仅用于标识被记录的硬件。
