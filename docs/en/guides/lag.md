# Link aggregation

Page: **Advanced → Link aggregation** (`/link_aggregation.html?nav=2-4`).

Field names and ranges are from the 2.0.0.1 Chinese UI. Meanings for Static / LAG / LACP, Priority, and timeouts come from [vendor manual V2.0](../reference/vendor-manual.md). No aggregate group was actually built here, and no LACP handshake was captured.

## What is on the page

One row per port, plus a global LACP system priority (32768 at inspection).

| Chinese UI | V2.0 English | Options or range | In Static mode |
|---|---|---|---|
| 端口类型 (first column) | Port Type | Static, LAG, LACP | All Static at inspection |
| 端口类型 (1–65535) | Priority | Port priority for the aggregation protocol | 128, input disabled |
| LACP超时时间 | LACP Timeout | Short = **3 s**, Long = **90 s** (vendor) | Short, control disabled |
| 聚合组 | Aggregation Group | 0–15; vendor: up to **16** groups | 0, input disabled |
| LAG状态 | LAG Status | Read-only | Follows link |

Two columns named 端口类型 is the Chinese UI, not a docs typo. V2.0 calls the numeric column **Priority**.

Vendor: member ports should use compatible speed, duplex, and VLAN settings.

Not seen on the page:

- Hash algorithm (src/dst MAC / IP / port)
- LACP active / passive
- Partner system ID, partner port, or “in sync”
- A separate logical port object to attach VLANs to

VLAN membership is still chosen per physical port 1–10. Order versus VLAN, and whether a bundle inherits members, is unverified.

## The three modes (vendor)

| UI option | Vendor manual V2.0 | Still unverified here |
|---|---|---|
| Static | No aggregation by default | — |
| LAG | Static link aggregation (also called Eth-Trunk in the manual) | Building a working static bundle on this unit |
| LACP | Dynamic aggregation using LACP | Active/passive, PDUs, how many members before forwarding |

Group 0 disabled on every port at inspection is not a working bundle.

## Suggested order (not run on this unit)

If the NAS, router, or peer switch is already set up for the same bundle:

1. Download a config backup.
2. Confirm these ports are not a mirror destination, and sort VLAN membership first if you can. Mutual exclusion with mirroring and STP edge is unverified.
3. Bundle ports of the **same class**: vendor wants matching speed/duplex/VLAN. Do not mix 2.5G copper with 10G fibre unless you accept being limited by the slowest member.
4. Set the peer to the same mode (LAG both sides, or LACP both sides).
5. On this unit, set Port Type to LAG or LACP, the same non-zero group, then Apply and Save.
6. Watch LAG status, the peer, and whether traffic still flows. Capture LACP PDUs if you can.

If management uses a physical port you are about to bundle, keep another path into the Web UI.

## Older tooling

GitHub has `swctl`-style scripts for SKS3200-8E2X that write “native VLAN + create bridge entries”.
That is for **older firmware**. 2.0.0.1 has no Bridge ID to fill in. Do not pour that output into this Web UI.
