# Menu map

Baseline: firmware 2.0.0.1, hardware A0, Simplified Chinese. The management plane is HTTP on the device; you must be logged in.

## Pages

| Menu | Page | Path | nav |
|---|---|---|---|
| System | System information | `/setup.html` | 1-1 |
| System | IPv4 address | `/ipv4_address.html` | 1-2 |
| System | Users | `/user_account.html` | 1-4 |
| System | Loop & STP | `/loop_stp.html` | 1-7 |
| System | Reboot & restore | `/reboot.html` | 1-9 |
| Advanced | Port settings | `/port_settings.html` | 2-1 |
| Advanced | Port mirroring | `/port_mirror.html` | 2-3 |
| Advanced | Link aggregation | `/link_aggregation.html` | 2-4 |
| Advanced | Port VLAN | `/port_based_vlan.html` | 2-5 |
| Advanced | Tagged VLAN | `/tag_based_vlan.html` | 2-6 |
| Advanced | IGMP snooping | `/igmp_snooping.html` | 2-7 |
| Advanced | Storm control | `/storm_control.html` | 2-8 |
| Status | Port statistics | `/port_statistics.html` | 3-1 |
| Status | Static MAC | `/br_static_mac_entries.html` | 3-2 |
| Status | Dynamic MAC | `/br_dynamic_mac_entries.html` | 3-3 |
| Tools | Configuration | `/config_tool.html` | 4-1 |
| Tools | Firmware | `/firmware_manage.html` | 4-2 |

The `nav` query is what the address bar showed when the page opened, matching the left-hand highlight. It is an observation, not a public API.

## Numbering gaps

Visible entries are not consecutive. Missing numbers include:

- System: `1-3`, `1-5`, `1-6`, `1-8`
- Advanced: `2-2`

Older firmware and vendor manuals mention IPv6 and system time / SNTP. Their locations cannot be reconstructed from the menus seen here.

A gap only means this account’s visible entries skip around. It does not prove “the firmware still hides those pages” or “the hardware lacks the feature”.

Static / dynamic MAC filenames still use a `br_` prefix, possibly leftover from an earlier bridge model. Visible VLAN config on 2.0.0.1 is already port VLAN + tagged VLAN.

## Not on these 17 pages

The visible Web UI for this account and firmware did not show:

ACL, QoS queues, 802.1X, SNMP, syslog, NTP/SNTP, IPv6 management, a DHCP server, L3 routing, PoE, a management VLAN selector, jumbo frames, CLI, SSH, or an HTTPS toggle.

Some of those appear in vendor marketing or other SKUs / older firmware. Do not copy a marketing feature list onto 2.0.0.1.
