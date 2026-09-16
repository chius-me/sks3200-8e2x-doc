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

The speed list is the full UI option set. It does not mean every physical port supports every speed. Limits were not probed by submitting the form.

## Port mirroring

Path: `/port_mirror.html?nav=2-3`

Buttons: Refresh, Apply, Save.

| Item | Options | At inspection |
|---|---|---|
| Destination | Discard (丢弃), ports 1–10 | Discard |
| Mirror ports | Port picker | Table covers 1–10 |
| Ingress | Disable, Enable | All disabled |
| Egress | Disable, Enable | All disabled |

Typical use: copy frames a source port receives or sends to a capture box on the destination port.

!!! warning "Discard is not dropping user traffic"
    丢弃 is the destination dropdown’s wording for “no mirror destination selected”.
    It does not mean the switch is discarding normal forwarding.

No ingress/egress mirror source was enabled. Interaction with LAG and STP is unverified.

## Link aggregation

Path: `/link_aggregation.html?nav=2-4`

Buttons: Refresh, Apply, Save. How-to: [Link aggregation guide](../guides/lag.md).

| Field | Options / range | At inspection |
|---|---|---|
| Port type (first same-named column) | Static, LAG, LACP | All Static |
| Port type (second same-named column) | Integer 1–65535 | All 128, input disabled |
| LACP timeout | Short, Long | All Short, control disabled |
| Aggregate group | 0–15 | All 0, input disabled |
| LAG status | Read-only | Follows link up/down |
| LACP system priority | Number | 32768 |

The Chinese UI labels **both** columns 端口类型. The second numeric field **might** be port priority. That is a guess, not a confirmed name.

The page does not explain what Static vs LAG means internally. You cannot treat “every port is Static” as “every port is already in a static bundle”. Group 0 was disabled on every port, which is not evidence that a working bundle exists.

No hash algorithm, no LACP neighbour info, no active/passive. Modes were not switched to see when the extra fields unlock.

## Port VLAN

Path: `/port_based_vlan.html?nav=2-5`

Buttons: Refresh, Apply, Save.

| Item | Options / role | At inspection |
|---|---|---|
| Port | Physical port to edit | Table covers 1–10 |
| PVID | VLAN for untagged ingress | All 1 |
| Admit frame type | All, tagged only, untagged only | All “all” |

The menu is named 端口VLAN, but the fields are **ingress classification** and admit type, not a second independent port-group VLAN. PVID bounds were not submitted.

How it works with tagged VLAN: [VLAN guide](../guides/vlan.md).

## Tagged VLAN

Path: `/tag_based_vlan.html?nav=2-6`

Buttons: Refresh, Add, Delete, Save; each VLAN also has edit and delete.

List columns: VLAN ID, name, member ports, tagged ports, untagged ports.

Add / edit form:

| Field | On the page |
|---|---|
| VLAN ID | Labelled 2–4094; editing existing VLAN 1 still shows that hint, box contains 1 |
| VLAN name | Text; no length hint |
| Ports 1–10 | Each port is untagged, tagged, or non-member |
| Select all | Per membership column |
| Submit / leave | OK, Close |

At inspection only VLAN 1 existed: empty name, members 1–10, no tagged ports, untagged 1–10.

New forms start every port as non-member. While editing VLAN 1, non-member is disabled on every port.

Why VLAN 1 is restricted is unclear: reserved rule, or a side effect of PVID 1, or something else. Do not assume changing PVID lifts the restriction. A Delete control also does not prove VLAN 1 can be deleted.

## IGMP snooping

Path: `/igmp_snooping.html?nav=2-7`

Main buttons: IGMP config, Refresh, Save. The main page said multicast snooping was not on.

Config dialog:

| Item | At inspection |
|---|---|
| IGMP switch | Unchecked |
| Fast leave | Checked, but disabled |
| Flood join frames | Checked, but disabled |

Usual role: constrain multicast forwarding from membership info; fast leave affects what happens after a leave. With the master switch off, the two greyed checkboxes are not evidence the features are active. The exact flood scope of “broadcast join frames” is unverified.

The visible form has no per-VLAN config, querier, version, or timers. The UI after enabling the feature was not explored.

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
