# Vendor manual V2.0

This repo is still community documentation. The live 2.0.0.1 / A0 Chinese Web UI walkthrough remains the baseline for “what the page showed”.

In 2026-08 XikeStor published **XikeStor Ethernet Switch WEB User Manual**, document version **V2.0**, English, covering:

- SKS3200-5E2X
- SKS3200-5E2X-P
- SKS3200-8E2X
- SKS3200-8E2X-P

Screenshots in that manual use the **SKS3200-8E2X**. The manual itself says appearance and available fields may vary slightly with firmware, and that the device UI is the reference.

That file is **not** stored in this repository (vendor copyright). Use the copy that came with the switch or from XikeStor. The rest of these pages cite it as **vendor manual V2.0**.

## How this repo uses it

Vendor text is labelled as such. It is **not** a substitute for Apply / reboot / packet tests on your unit.

| Topic | What V2.0 adds | Still not verified here |
|---|---|---|
| Factory login | `192.168.10.12`, `admin` / `admin`; PC in `192.168.10.2`–`.254` | Not read on the already-reconfigured walkthrough unit |
| Apply / Save | Apply = apply new settings; Save = save the current configuration (also listed on Port Statistics) | Unsaved lifetime, and whether Save equals startup-config across power loss |
| Restore | Factory defaults; removes the saved configuration; backup first | Whether management IP / users return to factory; RST pinhole timing |
| Port speed | Copper: 10/100/1000/2500 Mbps as listed; SFP/SFP+: 1000/2500/10G full, subject to model and module | Submitting every dropdown value on every port |
| Mirroring | One mirror group; ingress = received, egress = transmitted | Interaction with LAG / STP |
| LAG | Static = no aggregation by default; LAG = static aggregation; LACP = dynamic; **Priority** is port priority; short timeout **3 s**, long **90 s**; up to **16** groups; members should match speed, duplex, VLAN | Hash algorithm, active/passive, a working bundle on this unit |
| VLAN | VLAN name is administrative only; tagged ≈ 802.1Q trunk; untagged ≈ access; PVID ports **normally** appear as untagged members of that VLAN | VLAN 1 restrictions, reverse PVID rewrite, forwarding |
| IGMP | Enable snooping before other multicast options; Fast Leave removes a port immediately after leave; unknown multicast may still flood in the VLAN | Group table after enable; exact join-message flood set |
| Dynamic MAC | Ageing timer is remaining lifetime, refreshed by matching traffic; **default 300 seconds** | Editable global ageing (none seen) |
| Firmware | After a successful program the switch **restarts automatically**; do not cut power | Image format, checksum, config retention |

PoE SKUs: V2.0 says PoE cannot be turned on or off separately; the device configures it automatically. This repo still does not cover SKS3200-8E2X-P.
