# Field index

Find the page from the configuration item. All of this is **seen in UI** on the 2.0.0.1 Simplified Chinese Web UI. Chinese labels are the strings on that UI; the English UI was not inventoried. Ranges that are not listed were missing from the page or not submitted.

| Item (UI label) | Menu | Options or range on the page |
|---|---|---|
| DHCP 设置（IPv4） | System → IPv4 address | Disable, Enable |
| IP地址（IPv4） | System → IPv4 address | IPv4 |
| 子网掩码（IPv4） | System → IPv4 address | IPv4 mask |
| 默认网关（IPv4） | System → IPv4 address | IPv4 |
| 新用户名 | System → Users | Text |
| 当前密码 / 新密码 / 确认新密码 | System → Users | Password |
| 环路预防 | System → Loop & STP | Checkbox |
| 时间间隔 | System → Loop & STP | 0 or 1–100, unit 0.1 s |
| 恢复时间 | System → Loop & STP | 0 or 1–100, unit seconds |
| 生成树协议 | System → Loop & STP | STP, RSTP |
| STP 边缘端口 | System → Loop & STP | Per-port checkbox, select-all |
| 重启 | System → Reboot & restore | Button, not clicked |
| 恢复 | System → Reboot & restore | Button, not clicked |
| 端口状态 | Advanced → Port settings | Enable, Disable |
| 速率 / 双工 | Advanced → Port settings | Auto; 10M half/full; 100M half/full; 1000M full; 2500M full; 10G full |
| 流量控制 | Advanced → Port settings | Off, On |
| 镜像目的端口 | Advanced → Port mirroring | Discard, ports 1–10 |
| 镜像入口 / 出口 | Advanced → Port mirroring | Disable, Enable |
| 端口类型 / Port Type | Advanced → Link aggregation | Static (no aggregation by default), LAG (static), LACP (dynamic) — vendor V2.0 |
| 端口类型 (number) / Priority | Advanced → Link aggregation | 1–65535; disabled in Static. V2.0: port priority |
| LACP超时时间 / LACP Timeout | Advanced → Link aggregation | Short / Long; V2.0: 3 s / 90 s; disabled in Static |
| 聚合组 / Aggregation Group | Advanced → Link aggregation | 0–15; V2.0: up to 16 groups; disabled in Static |
| LACP系统优先级 | Advanced → Link aggregation | Number; 32768 at inspection |
| PVID | Advanced → Port VLAN | All 1 at inspection; bounds not submitted |
| 接受的帧类型 | Advanced → Port VLAN | All, tagged only, untagged only |
| VLAN ID | Advanced → Tagged VLAN | Labelled 2–4094; VLAN 1 can still be opened |
| VLAN 名称 | Advanced → Tagged VLAN | Text, no length |
| VLAN 端口成员 | Advanced → Tagged VLAN | Untagged, tagged, non-member |
| IGMP开关 | Advanced → IGMP snooping | Checkbox; off at inspection |
| 快速离组 | Advanced → IGMP snooping | Disabled while master switch is off |
| 广播入组报文 | Advanced → IGMP snooping | Disabled while master switch is off |
| 风暴类型 | Advanced → Storm control | Broadcast, multicast, unknown unicast, unknown multicast |
| 风暴状态 | Advanced → Storm control | On, Off |
| 风暴速率 | Advanced → Storm control | 1–1000 Mbps; table showed 0 |
| 静态 MAC | Status → Static MAC | MAC, port, VLAN ID 1–4094 |
| 动态 MAC 查询 | Status → Dynamic MAC | MAC, VLAN ID |
| 老化计时器 / Aging Timer | Status → Dynamic MAC | Read-only remaining lifetime; V2.0 default 300 seconds |
| 下载 / 上传配置 | Tools → Configuration | File; format unverified |
| 下载 / 上传固件 | Tools → Firmware | File; format unverified |

Read-only displays (system information, port statistics, LAG status, STP status column, and so on) live on their pages and are not repeated here as “configuration items”.
