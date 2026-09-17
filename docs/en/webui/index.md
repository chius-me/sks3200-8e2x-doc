# Web UI overview

Firmware 2.0.0.1’s Simplified Chinese Web UI is **4 top-level menus and 17 pages**. It is mainly Layer 2 management.

The header shows the model, current user, and logout. Languages: Simplified Chinese, English, Русский язык, 日本語, 한국어.

The “Status” group also contains operations that can change the forwarding table. Do not treat that whole group as read-only.

## Menus

| Menu | Page | Purpose |
|---|---|---|
| System | [System information](system.md#system-information) | Identity, management address, temperature, versions |
| System | [IPv4 address](system.md#ipv4-address) | DHCP, static management address, mask, gateway |
| System | [Users](system.md#users) | Login username and password |
| System | [Loop & STP](system.md#loop-and-stp) | Loop detection, STP/RSTP, edge ports |
| System | [Reboot & restore](system.md#reboot-and-restore) | Reboot and restore |
| Advanced | [Port settings](switching.md#port-settings) | Enable/disable, speed/duplex, flow control |
| Advanced | [Port mirroring](switching.md#port-mirroring) | Destination, ingress/egress sources |
| Advanced | [Link aggregation](switching.md#link-aggregation) | Per-port mode, LACP parameters, groups |
| Advanced | [Port VLAN](switching.md#port-vlan) | PVID, admit frame type |
| Advanced | [Tagged VLAN](switching.md#tagged-vlan) | VLAN create, members, tagged/untagged |
| Advanced | [IGMP snooping](switching.md#igmp-snooping) | Snooping, fast leave, flood join |
| Advanced | [Storm control](switching.md#storm-control) | Per-port, per-traffic-type rate |
| Status | [Port statistics](status.md#port-statistics) | Link state and good/error frame counts |
| Status | [Static MAC](status.md#static-mac) | Static FDB entries |
| Status | [Dynamic MAC](status.md#dynamic-mac) | Learned entries, search, ageing |
| Tools | [Configuration](tools.md#configuration) | Download / upload user config |
| Tools | [Firmware](tools.md#firmware) | Download / upload firmware |

Paths are in the [menu map](../reference/menu-map.md).

## Common buttons

| Button (UI) | Where | What the page suggests | Verification bound |
|---|---|---|---|
| Refresh (刷新) | Most config and status pages | Reload page data | Whether it drops unsubmitted edits is unverified |
| Apply (应用) | IPv4, loop/STP, ports, mirror, LAG, port VLAN, storm control, … | Vendor manual V2.0: apply the new settings | Not clicked here |
| OK (确认) | VLAN, IGMP, static MAC dialogs | Likely submits the dialog | Not clicked |
| Save (保存) | Most pages, including Port Statistics | Vendor manual V2.0: save the current configuration | Whether that is startup-config across power loss is unverified |
| Add / Edit | VLAN, static MAC | Opens a form | Opened and closed, never confirmed |
| Delete / Clear | VLAN, MAC, statistics | May change config, FDB, or counters | Not clicked |

!!! note "Vendor wording vs this walkthrough"
    V2.0 lists Save even on Port Statistics as “save the current configuration”, so it is not “this page only”.
    The manual does not say that unsaved Apply survives reboot. This repo still has not power-cycled to check.

## Snapshot at inspection

That day (value at inspection, not factory defaults):

- Management address was already a static private address; DHCP client off
- Only VLAN 1; all 10 ports untagged members, PVID 1, admit type “all”
- All ports enabled, speed auto; mirroring off
- Aggregation group fields were 0 and disabled
- Loop prevention checked; STP page selected RSTP
- IGMP master switch off
- Storm-control rates showed 0 for all four types
- Static MAC table empty

## Outside the visible menus

The 17 pages did not show standalone ACL, QoS queues, 802.1X, SNMP, a log server, NTP/SNTP, an IPv6 **configuration** page, a DHCP server, L3 routing, PoE, a management VLAN selector, or jumbo-frame settings. Vendor manual V2.0 says System Information can **display** an IPv6 address; that field was not recorded in the Chinese walkthrough table.

The full list is in [unverified items](../reference/known-unknowns.md).
