# Loop protection and STP

Page: **System → Loop & STP** (`/loop_stp.html?nav=1-7`).

Two tabs: **loop detection** and **STP**. This walkthrough only read options and values. No loop was created, and no BPDUs were captured.

## Selection at inspection

| Item | At inspection |
|---|---|
| Loop prevention | Checked |
| Interval | 10 × 0.1 s = 1 s per the label |
| Recovery time | 2 s |
| Spanning tree | RSTP |
| STP edge port | Ports 1–10 unchecked |
| Per-port STP status | All “forwarding” (转发) |

## Loop detection

Fields:

- Loop prevention: master switch
- Interval: 0 or 1–100, unit **0.1 seconds**
- Recovery time: 0 or 1–100, unit **seconds**
- Per-port status: cells were empty in the text dump, so they cannot tell you whether a port was already blocked for a loop

0 is unexplained. Do not read it as disable, recover immediately, or never recover.

The scope of “Disable all” is unverified: loop detection, STP, or both.

## STP / RSTP

The page only offers:

- STP vs RSTP
- Per-port edge-port checkboxes (with select-all)
- Per-port status

No bridge priority, port path cost, Hello, Max Age, Forward Delay, or root/designated detail.

So:

- “RSTP is selected” does not prove a full 802.1w implementation
- There is no description of which function wins if both loop detect and STP act
- A home topology with one switch and no intentional loop, RSTP selected, every port forwarding, does not prove loop protection works

## Conservative use

- If a loop is possible (two switches with two cables, a mesh port mis-patched), do not turn both functions off.
- Edge port on PC/NAS ports may be reasonable; whether it equals PortFast, and whether forwarding delay is skipped, is unverified.
- Do not casually set edge on a port toward another switch or a wired AP backhaul.
- After changes, see whether status stays “forwarding”. If other Chinese (or English) status words appear, bring them to an Issue with the firmware version.

Creating a loop to test will take the network down. Do not do that on production just to fill a gap in this repo.
