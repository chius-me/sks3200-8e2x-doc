# SKS3200-8E2X configuration docs

Community documentation for the XikeStor / 兮克 **SKS3200-8E2X** Web UI.

!!! warning "Not an official manual"
    This site is not affiliated with the vendor. The text matches firmware **2.0.0.1 / hardware A0** on the Simplified Chinese Web UI.
    An option on a page does not mean that option’s forwarding behaviour was verified on this unit.

## Start here

<div class="grid cards" markdown>

-   :material-login: **[First login](getting-started.md)**

    ---

    Factory address, changing the management IP and password, and what Apply vs Save can currently be claimed

-   :material-lan: **[VLAN](guides/vlan.md)**

    ---

    How PVID, admit frame type, and tagged / untagged members fit together. There is no Access/Trunk button.

-   :material-link-variant: **[Link aggregation](guides/lag.md)**

    ---

    Static / LAG / LACP fields, including the duplicated “port type” label

-   :material-file-search: **[Menu map](reference/menu-map.md)**

    ---

    4 top-level menus, 17 pages, and `*.html` paths

</div>

## What this unit can configure

On the visible 2.0.0.1 UI this is a **lightly managed Layer 2 switch**:

- Port speed, flow control, mirroring
- 802.1Q VLANs (split across “Port VLAN” and “Tagged VLAN”)
- Static aggregation / LACP
- Simplified loop detection and STP/RSTP
- IGMP snooping, storm control
- Static / dynamic MAC
- Config backup and firmware upload

The same UI **did not show** ACL, QoS queues, 802.1X, SNMP, a log server, NTP, IPv6 management, a DHCP server, L3 routing, PoE, or a management VLAN selector.
That only means this account and firmware build had no visible entry. It does not prove the hardware never supports those features.

## Older tutorials

Many 2025 reviews describe a different UI: VLANs by Bridge ID, plus system time / SNTP pages.
That is earlier SKS32 firmware. **Do not** apply those steps to 2.0.0.1.

See [firmware families](reference/firmware-families.md).

## Evidence labels

The same labels are used everywhere so “saw it” is not written as “tested it”:

| Label | Meaning |
|---|---|
| Seen in UI | The field or button is on the page |
| Value at inspection | What the screen showed then; not a factory default |
| Not submitted | Apply / OK / Save was not clicked |
| Forwarding not verified | No capture or peer traffic |
| Vendor / community | Public sources, not this walkthrough |

The redacted inventory from that day is in [`sources/`](https://github.com/chius-me/sks3200-8e2x-doc/tree/main/sources).
