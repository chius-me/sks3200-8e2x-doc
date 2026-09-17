# Switching

Menus: ports, mirroring, link aggregation, port VLAN, tagged VLAN, IGMP, storm control.

## Port settings

Path: `/port_settings.html?nav=2-1`

Buttons: Refresh, Apply, Save.

| Item | Options on the page |
|---|---|
| Port | Port picker; table lists 1–10 |
| Status | Enable, Disable |
| Speed / duplex | Auto; 10 Mbps half/full; 100 Mbps half/full; 1000 Mbps full; 2500 Mbps full; 10 Gbps full |
| Flow control | Off, On |

The table below shows configured vs actual speed/duplex and flow control.

At inspection every port was enabled, speed auto, flow control **configured** on. Actual links change with what you plug in:

- Copper ports negotiated 100M / 1G / 2.5G
- Fibre negotiated 10G
- A down port can still show flow control “on”; that is not pause frames on the wire
- One copper port sitting at 100M is not, by itself, a fault

The Chinese dropdown listed every speed on one control. Vendor manual V2.0 splits them:

- **Copper:** 10 Mbps half/full, 100 Mbps half/full, 1000 Mbps full, 2500 Mbps full
- **SFP/SFP+:** 1000 Mbps full, 2500 Mbps full, or 10 Gbps full, subject to model and module

This walkthrough did not submit the form port-by-port to confirm the UI greys out illegal values.

## Port mirroring

Path: `/port_mirror.html?nav=2-3`

Buttons: Refresh, Apply, Save.

| Item | Options | At inspection |
|---|---|---|
| Destination | Discard (丢弃), ports 1–10 | Discard |
| Mirror ports | Port picker | Table covers 1–10 |
| Ingress | Disable, Enable | All disabled |
| Egress | Disable, Enable | All disabled |

Vendor manual V2.0: the switch supports **one** mirror group. Ingress = traffic **received** by the source port; egress = traffic **transmitted** by it. Connect a packet analyzer to the destination (monitor) port.

!!! warning "Discard is not dropping user traffic"
    丢弃 is the destination dropdown’s wording for “no mirror destination selected”.
    It does not mean the switch is discarding normal forwarding.

No ingress/egress mirror source was enabled. Interaction with LAG and STP is unverified.

## Link aggregation

Path: `/link_aggregation.html?nav=2-4`

Buttons: Refresh, Apply, Save. How-to: [Link aggregation guide](../guides/lag.md).

| Field (Chinese UI / V2.0 English) | Options / range | At inspection |
|---|---|---|
| 端口类型 / Port Type | Static, LAG, LACP | All Static |
| 端口类型 (numeric) / Priority | 1–65535 | All 128, input disabled |
| LACP超时时间 / LACP Timeout | Short, Long | All Short, control disabled |
| 聚合组 / Aggregation Group | 0–15 | All 0, input disabled |
| LAG状态 / LAG Status | Read-only | Follows link up/down |
| LACP系统优先级 | Number | 32768 |

The Chinese UI labels **both** the mode and the numeric columns 端口类型. Vendor manual V2.0 names the second one **Priority** (port priority used by the aggregation protocol).

Vendor meanings (not exercised on this unit):

- **Static:** no aggregation by default
- **LAG:** static link aggregation
- **LACP:** dynamic aggregation
- **LACP Timeout:** Long = 90 seconds, Short = 3 seconds
- **Aggregation Group:** up to 16 groups (matches the 0–15 control)
- Member ports should use compatible speed, duplex, and VLAN settings

Group 0 disabled on every port is not evidence that a working bundle exists. No hash algorithm, no LACP neighbour info, no active/passive. Modes were not switched here.

## Port VLAN

Path: `/port_based_vlan.html?nav=2-5`

Buttons: Refresh, Apply, Save.

| Item | Options / role | At inspection |
|---|---|---|
| Port | Physical port to edit | Table covers 1–10 |
| PVID | VLAN for untagged ingress | All 1 |
| Admit frame type | All, tagged only, untagged only | All “all” |

The menu is named 端口VLAN. The fields are PVID and admit type. Vendor manual V2.0: All = tagged and untagged; Tagged Only = tagged frames only; Untagged Only = untagged frames only. Ports with the same PVID are described as one broadcast domain **when tagging rules also match**. PVID bounds were not submitted.

How it works with tagged VLAN: [VLAN guide](../guides/vlan.md).

## Tagged VLAN

Path: `/tag_based_vlan.html?nav=2-6`

Buttons: Refresh, Add, Delete, Save; each VLAN also has edit and delete.

List columns: VLAN ID, name, member ports, tagged ports, untagged ports.

Add / edit form:

| Field | On the page |
|---|---|
| VLAN ID | Labelled 2–4094; editing existing VLAN 1 still shows that hint, box contains 1 |
| VLAN name | Text; no length hint. V2.0: administrative label only, does not affect forwarding |
| Ports 1–10 | Each port is untagged, tagged, or non-member |
| Select all | Per membership column |
| Submit / leave | OK, Close |

At inspection only VLAN 1 existed: empty name, members 1–10, no tagged ports, untagged 1–10.

New forms start every port as non-member. While editing VLAN 1, non-member is disabled on every port.

Vendor manual V2.0: tagged ports keep the VLAN tag (similar to an 802.1Q trunk); untagged ports strip it (similar to an access port). Ports given a PVID on the Port VLAN page **normally appear as untagged members** of that VLAN. That auto-link was not submitted here.

Why VLAN 1 cannot select non-member is still unclear. Do not assume changing PVID lifts the restriction. A Delete control also does not prove VLAN 1 can be deleted.

## IGMP snooping

Path: `/igmp_snooping.html?nav=2-7`

Main buttons: IGMP config, Refresh, Save. The main page said multicast snooping was not on.

Config dialog:

| Item | At inspection |
|---|---|
| IGMP switch | Unchecked |
| Fast leave | Checked, but disabled |
| Flood join frames | Checked, but disabled |

Vendor manual V2.0: enable IGMP snooping **before** the other multicast options (that matches the greyed fields). Snooping builds port-to-multicast-MAC mappings; known multicast goes only to interested receivers; **unknown multicast may still flood in the VLAN**. Fast Leave removes a port from a group immediately after a leave — only where the receiver topology allows it. Broadcast Join Message = broadcast the join message.

With the master switch off, the two greyed checkboxes are not evidence the features are active. The group table shown in V2.0 after enable was not opened here. No per-VLAN, querier, version, or timer fields were visible while it was off.

## Storm control

Path: `/storm_control.html?nav=2-8`

Buttons: Refresh, Apply, Save.

| Item | Options / range |
|---|---|
| Storm type | Broadcast, multicast, unknown unicast, unknown multicast |
| Port ID | 1–10 |
| Status | On, Off |
| Rate | 1–1000 Mbps |

The table lists four rates per port. At inspection every value on ports 1–10 was 0.

The editor defaults to “on” with an empty rate. That default is not the real per-port state.

0 is unexplained: unused, or unconfigured — not “all of this traffic is limited to zero”. The page is per traffic class, not a generic port shaper.
