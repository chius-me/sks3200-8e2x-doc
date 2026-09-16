# SKS3200-8E2X 配置文档

社区维护的兮克 / XikeStor **SKS3200-8E2X** Web 配置文档。

!!! warning "不是官方手册"
    本站与厂商无关。正文对应 **固件 2.0.0.1 / 硬件 A0** 的简体中文 WEBUI。
    页面提供某个选项，不等于该选项的转发行为已经在这台机器上验证过。

## 从这里开始

<div class="grid cards" markdown>

-   :material-login: **[第一次登录](getting-started.md)**

    ---

    出厂地址、改管理 IP、改密码，以及「应用」和「保存」现在能确定什么

-   :material-lan: **[VLAN](guides/vlan.md)**

    ---

    PVID、接收帧类型、Tagged / Untagged 成员怎么配合，没有 Access/Trunk 按钮

-   :material-link-variant: **[链路聚合](guides/lag.md)**

    ---

    静态 / LAG / LACP 在页面上的字段，以及重复的「端口类型」标签

-   :material-file-search: **[菜单与页面路径](reference/menu-map.md)**

    ---

    4 个主菜单、17 个页面，以及 `*.html` 路径

</div>

## 这台机器能配什么

在 2.0.0.1 的可见界面里，这是一台**二层轻管理交换机**：

- 端口速率、流控、镜像
- 802.1Q VLAN（拆成「端口 VLAN」和「标签 VLAN」两页）
- 静态聚合 / LACP
- 环路检测和 STP/RSTP 的简化开关
- IGMP 侦听、风暴控制
- 静态 / 动态 MAC
- 配置备份和固件上传

同一界面**没有看到** ACL、QoS 队列、802.1X、SNMP、日志服务器、NTP、IPv6 管理、DHCP 服务器、三层路由、PoE 或管理 VLAN 选择。
这只说明当前账号和这份固件的可见菜单没有这些入口，不能推广成「硬件永远不支持」。

## 和网上旧教程的差别

不少 2025 年评测写的是另一套界面：用 Bridge ID 划分 VLAN，还有系统时间 / SNTP 等页面。
那是更早的 SKS32 固件，**不能**直接用在 2.0.0.1 上。

详见 [固件分代](reference/firmware-families.md)。

## 证据约定

全文使用同一套标记，避免把「看见了」写成「测过了」：

| 标记 | 含义 |
|---|---|
| 已见 UI | 页面上有这个字段或按钮 |
| 已读当前值 | 记录了当时显示；不是出厂默认 |
| 未提交 | 没有点应用 / 确认 / 保存 |
| 未验证转发 | 没有用抓包或对端流量证实 |
| 厂商 / 社区 | 来自公开资料，不是本次逐页核对 |

核对当天的脱敏原始记录在仓库 [`sources/`](https://github.com/chius-me/sks3200-8e2x-doc/tree/main/sources)。
