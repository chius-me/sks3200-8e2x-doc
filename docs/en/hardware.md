# Hardware

The SKS3200-8E2X is a lightly managed Layer 2 switch from XikeStor / 兮克: eight 2.5G copper ports and two 10G SFP+ ports.
This page keeps **what this Web UI showed** separate from **public specifications**. Public numbers may not match every batch.

## Identifiers from this Web UI

Source: System → System Information (firmware 2.0.0.1, hardware A0, seen in UI / value at inspection).

| Field | Value |
|---|---|
| Device description | SKS3200-8E2X |
| Firmware | 2.0.0.1 |
| Hardware | A0 |
| IPv4 address | This unit already used a private static address, not the factory value |

Temperature is a live reading. The page does not give a working-temperature threshold, so one number cannot tell you whether it is overheating.

## Ports

The panel is typically power, eight RJ45, two SFP+, and an RST pinhole on the far side.
The Web UI numbers ports **1–10**. Combined with link state at inspection and public materials:

| Web port | Physical | Link at inspection (value at inspection) |
|---|---|---|
| 1–8 | 2.5G RJ45 | Ports 1 and 2 were 1G full duplex, 3 was 100M full duplex, 8 was 2.5G full duplex; other copper ports were down |
| 9–10 | 10G SFP+ | Port 10 was 10G full duplex, 9 was down |

The Chinese port-settings dropdown listed 10M / 100M / 1G / 2.5G / 10G together. Vendor manual V2.0 splits them: copper 10/100/1000/2500 Mbps as listed; SFP/SFP+ 1000/2500/10G full, subject to model and module. This walkthrough did not submit the form port-by-port.

## Public specifications (not measured here)

The figures below come from vendor pages, packaging, and teardowns. They are **not** read out of the 2.0.0.1 Web UI.

| Item | Public claim | Notes |
|---|---|---|
| Switching capacity | 80 Gbps | Wire-speed number for 8×2.5G + 2×10G |
| Forwarding rate | 59.52 Mpps | Vendor figure |
| Silicon | MaxLinear MXL86282S | Community teardown; the UI does not show the chip |
| Power | DC 12V 2A | Commonly a 5.5×2.1 mm barrel |
| Consumption | ≤ 12 W | Passive-cooled metal case |
| Size | about 207 × 136 × 35 mm | Packaging copy varies slightly |
| VLAN | 802.1Q; some copy says at most 32 VLAN IDs | This firmware’s tagged-VLAN form labels IDs 2–4094; the cap was not submitted |
| Aggregation | Static / LACP; V2.0: up to 16 groups | The page offers groups 0–15 |
| Factory management IP | 192.168.10.12/24 | See [First login](getting-started.md) |
| Factory login | admin / admin | Change it |

MAC-table size appears as both 4K and 16K in public copy. This repo does not pick either until an export or UI field can be checked.

## SKS3200-8E2X-P

The `-P` SKU is the PoE variant. This repo only covers the non-PoE **SKS3200-8E2X**.
The visible 2.0.0.1 menus had no PoE pages.
