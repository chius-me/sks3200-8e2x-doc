# Firmware families

The same **SKS3200-8E2X** model has shipped with at least two Web configuration models.
Mixing their steps is the most common documentation pitfall for this switch.

## What this repo covers

| Item | Value |
|---|---|
| Model | SKS3200-8E2X |
| Hardware | A0 |
| Firmware | 2.0.0.1 |
| VLAN | Port VLAN + Tagged VLAN |
| Visible menus | 4 groups, 17 pages |

Community reports of new units preloaded with 2.0.0.1 describe VLAN as ordinary Port / Tagged VLAN, with nothing Bridge-related to configure. That matches this walkthrough.

## An older UI (not documented step-by-step here)

Reviews, teardowns, and some scripts from around 2025 describe a different Web UI:

| Trait | Older UI (community) | 2.0.0.1 (seen in UI here) |
|---|---|---|
| VLAN | Ports bound to Bridge IDs; one physical port can join several bridges | Port VLAN (PVID / admit type) + tagged VLAN (member / tagged / untagged) |
| Management reachability | Some notes say you must be on Bridge ID 0 to open the Web UI | IPv4 page has no management VLAN; vendor SKS32 notes say any VLAN can reach the new IP (not verified on this firmware) |
| Other pages | Reviews mention IPv6, system time, SNTP | Those entries were not in the visible menus |
| Automation | [`ren-e/xikestor`](https://github.com/ren-e/xikestor) `swctl` writes native VLAN + bridge entries | No Bridge ID to fill in; do not apply that script here |

The older UI’s exact fields were not opened in this walkthrough. This repo **does not** expand those steps into a how-to, so they do not tangle with 2.0.0.1.

## Rules of use

1. Open **System → System Information** and read firmware and hardware first.
2. If the left nav is Port VLAN / Tagged VLAN, follow this repo’s [VLAN guide](../guides/vlan.md).
3. If the left nav is Bridge ID, you are on the other firmware. Do not click through this repo’s two-page model, and do not point `swctl` at 2.0.0.1.
4. New observations must include the firmware version. If you have a page-by-page record of the older UI, add it as a separate family rather than rewriting 2.0.0.1 sections.

## Nearby SKUs

| Model | Relation to this text |
|---|---|
| SKS3200-8E2X-P | PoE variant; extra power pages; not covered |
| SKS3200-5E2X and similar | Different port counts; community mix-flash discussion exists; this repo has no mix-flash steps |
| SKS3200M earlier line | Login page and menus may differ |

Hardware A0 is the string on this System Information page. If yours shows another hardware version, file the differences; do not assume every field matches.
