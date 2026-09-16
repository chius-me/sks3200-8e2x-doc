# 菜单与页面路径

基准：固件 2.0.0.1，硬件 A0，简体中文。管理面是设备上的 HTTP 服务，需要已登录。

## 页面一览

| 主菜单 | 页面 | 路径 | nav |
|---|---|---|---|
| 系统功能 | 系统信息 | `/setup.html` | 1-1 |
| 系统功能 | IPv4地址 | `/ipv4_address.html` | 1-2 |
| 系统功能 | 用户 | `/user_account.html` | 1-4 |
| 系统功能 | 环路与STP | `/loop_stp.html` | 1-7 |
| 系统功能 | 重启与恢复 | `/reboot.html` | 1-9 |
| 高级设置 | 端口设置 | `/port_settings.html` | 2-1 |
| 高级设置 | 端口镜像 | `/port_mirror.html` | 2-3 |
| 高级设置 | 链路聚合 | `/link_aggregation.html` | 2-4 |
| 高级设置 | 端口VLAN | `/port_based_vlan.html` | 2-5 |
| 高级设置 | 标签VLAN | `/tag_based_vlan.html` | 2-6 |
| 高级设置 | IGMP侦听 | `/igmp_snooping.html` | 2-7 |
| 高级设置 | 风暴控制 | `/storm_control.html` | 2-8 |
| 状态信息 | 端口统计 | `/port_statistics.html` | 3-1 |
| 状态信息 | 静态MAC | `/br_static_mac_entries.html` | 3-2 |
| 状态信息 | 动态MAC | `/br_dynamic_mac_entries.html` | 3-3 |
| 系统工具 | 配置 | `/config_tool.html` | 4-1 |
| 系统工具 | 固件 | `/firmware_manage.html` | 4-2 |

查询参数 `nav` 是打开页面时地址栏里的值，用来对应左侧菜单高亮。它是观察结果，不是公开 API 文档。

## 编号空缺

可见入口不连续。缺号包括：

- 系统功能：`1-3`、`1-5`、`1-6`、`1-8`
- 高级设置：`2-2`

旧固件和厂商手册里出现过 IPv6、系统时间 / SNTP 等页面，位置无法从本次可见菜单还原。

空缺**只说明**当前账号看到的入口不连续，不能用来断言「固件里仍藏着这些页」或「硬件没有这些功能」。

静态 / 动态 MAC 的文件名带 `br_` 前缀，可能是更早 bridge 模型留下的路径；2.0.0.1 的可见 VLAN 配置已经改走端口 VLAN + 标签 VLAN。

## 没在这 17 页里出现的东西

当前账号与固件的可见 WEBUI 没有展示：

ACL、QoS 队列、802.1X、SNMP、日志服务器、NTP / SNTP、IPv6 管理、DHCP 服务器、三层路由、PoE、管理 VLAN 选择、巨帧、CLI、SSH、HTTPS 开关。

部分功能在厂商宣传或其它 SKU / 旧固件里出现过。不要把宣传页的能力表直接抄到 2.0.0.1。
