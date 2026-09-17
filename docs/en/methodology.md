# How to read this

These pages are deliberately conservative. What you can tick on a switch page, and what the packets actually do, are separated by submit and by verification. A lot of write-ups skip both.

## Where the material comes from

| Source | Used for | Not used for |
|---|---|---|
| 2026-09-16 walkthrough of a 2.0.0.1 / A0 unit, Simplified Chinese Web UI | Menus, fields, options, values at inspection, page paths | Factory defaults, or forwarding behaviour |
| [Vendor manual V2.0](reference/vendor-manual.md) (WEB User Manual for 5E2X / 8E2X and PoE variants) | Factory login, Apply/Save wording, LAG/VLAN/IGMP/MAC ageing, firmware restart | Packet forwarding, reboot tests, fields the Chinese walkthrough did not show |
| Other vendor pages and “change the IP” notes | Extra SKS32 remarks (e.g. management reachability) | Anything that contradicts the device UI |
| Community reviews and forums | Older firmware (Bridge ID), teardown chip | Direct 2.0.0.1 how-to steps when the V2.0 manual already defines the field |

Every visible menu was opened, including VLAN / static MAC edit dialogs. All of them were **cancelled or closed**. Nothing was confirmed.

Redacted original notes: [sources/2026-09-16-webui-inventory.md](https://github.com/chius-me/sks3200-8e2x-doc/blob/main/sources/2026-09-16-webui-inventory.md).

## Four evidence levels

**Seen in UI**  
The control exists. Example: tagged VLAN ports are untagged / tagged / non-member.

**Value at inspection**  
The number or option on screen at that moment. Example: PVID was 1 everywhere. That is a snapshot; a previous owner may have changed it.

**Submitted**  
Clicked Apply, OK, or Save, and saw the page react. The current text almost never has this level.

**Forwarding verified**  
Confirmed with a capture, a peer VLAN port, or live traffic. The current text has none of this. The Access/Trunk mapping in the VLAN guide is a **configuration sketch**. It was not applied on the device.

There is also **vendor / community**: public sources, labelled as such.

## How to read “current value”

- Management IP, username, link speed, and error counters belong to **that unit at that time**.
- The published pages usually rewrite those as “at inspection”. Factory values use vendor/community sources.
- Temperature is instantaneous. A down port can still show historical counters.

## How to read buttons

| Button | Seen in UI | How this repo writes it |
|---|---|---|
| Refresh (刷新) | Most config and status pages | Reload the page; whether it discards unsubmitted edits is unverified |
| Apply (应用) | IPv4, loop/STP, ports, mirror, LAG, port VLAN, storm control, … | V2.0: apply the new settings; not clicked here |
| OK (确认) | VLAN, IGMP, static MAC dialogs | Likely submits the dialog; not clicked |
| Save (保存) | Most pages, including Port Statistics | V2.0: save the current configuration; power-loss survival unverified |
| Add / Edit | VLAN, static MAC | Forms were opened and closed |
| Delete / Clear | VLAN, MAC, statistics | May change config, the FDB, or counters; not clicked |

Do not infer Save’s scope from which page it sits on. V2.0 lists Save on Port Statistics as “save the current configuration”.
Do not write “unsaved Apply survives reboot” as a fact already verified on this firmware.

## Visible is not “supported”; missing is not “absent”

- The speed list includes 10G. That does not mean port 1 can run 10G.
- Loop prevention was checked. That does not mean a loop test was run.
- No QoS / IPv6 menu only means **no visible entry this time**. Menu `nav` numbers skip around; they may match other SKUs or older firmware. See [menu map](reference/menu-map.md).

## Production networks

If you verify an unverified item on a live switch:

1. Back up first (Tools → Configuration → Download). Whether the export contains passwords is unverified.
2. Write down the topology. Half-finished VLAN edits can drop the management path.
3. File the result as in [CONTRIBUTING](https://github.com/chius-me/sks3200-8e2x-doc/blob/main/CONTRIBUTING.md).
