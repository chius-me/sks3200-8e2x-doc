# Link aggregation

Page: **Advanced → Link aggregation** (`/link_aggregation.html?nav=2-4`).

This is written from the 2.0.0.1 fields. No aggregate group was actually built, and no LACP handshake with a peer was verified.

## What is on the page

One row per port, plus a global LACP system priority (32768 at inspection).

| Label on the page | Options or range | In Static mode |
|---|---|---|
| Port type (first column) | Static, LAG, LACP | All Static at inspection |
| Port type (second column, 1–65535) | Number | 128, input disabled |
| LACP timeout | Short, Long | Short, control disabled |
| Aggregate group | 0–15 | 0, input disabled |
| LAG status | Read-only | Follows link |

Two fields named 端口类型 is the UI wording, not a docs typo. The second column looks like port priority on other switches. **That is a guess.**

Groups 0–15 match some reviews that say “16 groups”. Group 0 disabled everywhere is not evidence that a working bundle exists.

Not seen:

- Hash algorithm (src/dst MAC / IP / port)
- LACP active / passive
- Partner system ID, partner port, or “in sync”
- A separate logical port object to attach VLANs to

VLAN membership is still chosen per physical port 1–10. Order versus VLAN, and whether a bundle inherits members, is unverified.

## How to read the three modes

The page has no help text. Separate “what the UI says” from “what reviews say”.

| UI option | What we can say | What we cannot say |
|---|---|---|
| Static | Every port was here; the last three columns disabled | Whether it means “not bundled” or “a kind of static bundle” |
| LAG | Looks like static aggregation | Whether a non-zero group is required, whether the peer must be static, how hashing is chosen |
| LACP | Looks like 802.3ad | Actual short/long seconds, active vs passive, how many links before forwarding |

Older-batch reviews (different VLAN UI) have said:

- Default Static = no aggregation
- LAG = static bundle, LACP = dynamic
- Short timeout about 3 s, Long about 90 s
- At most 16 groups

Those numbers were **not** checked on 2.0.0.1. Do not treat timeout seconds as verified.

## Suggested order (not run on this unit)

If the NAS, router, or peer switch is already set up for the same bundle:

1. Download a config backup.
2. Confirm these ports are not a mirror destination, and sort VLAN membership first if you can. Mutual exclusion with mirroring and STP edge is unverified.
3. Bundle ports of the **same class**: do not mix 2.5G copper with 10G fibre unless you accept being limited by the slowest member (also unverified here).
4. Set the peer to the same mode (static both sides, or LACP both sides).
5. On this unit, set the first column to LAG or LACP, the same non-zero group, then Apply and Save.
6. Watch LAG status, the peer, and whether traffic still flows. Capture LACP PDUs if you can.

If management uses a physical port you are about to bundle, keep another path into the Web UI.

## Older tooling

GitHub has `swctl`-style scripts for SKS3200-8E2X that write “native VLAN + create bridge entries”.
That is for **older firmware**. 2.0.0.1 has no Bridge ID to fill in. Do not pour that output into this Web UI.
