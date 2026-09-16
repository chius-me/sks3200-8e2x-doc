# System

Menus: system information, IPv4 address, users, loop & STP, reboot & restore.

## System information

Path: `/setup.html?nav=1-1`

Read-only display with Refresh and Save. This walkthrough read:

| Field | Value |
|---|---|
| Device description | SKS3200-8E2X |
| MAC address | Present on the page; do not publish any one unit’s MAC |
| IPv4 address | That unit’s management address (already changed, not factory) |
| Temperature | Instantaneous; no threshold on the page |
| Firmware | 2.0.0.1 |
| Hardware | A0 |

## IPv4 address

Path: `/ipv4_address.html?nav=1-2`

Buttons: Refresh, Apply, Save.

| Item | Options / input | At inspection |
|---|---|---|
| DHCP (IPv4) | Disable, Enable | Disable |
| IP address (IPv4) | IPv4 | Private static address |
| Subnet mask (IPv4) | IPv4 mask | `/24` at the time |
| Default gateway (IPv4) | IPv4 | Filled in |

This is the switch’s own management addressing. The page has no DHCP **server**, no inter-VLAN routing, and no management VLAN ID.

Vendor SKS32 notes say that after you change the IP, hosts in any VLAN can open the management UI. That is vendor text, not verified on this firmware.

Steps: [First login](../getting-started.md).

## Users

Path: `/user_account.html?nav=1-4`

Buttons: Apply, Save.

Fields: new username, current password, new password, confirm new password.

The visible page has no:

- User list
- Extra accounts
- Roles or privileges
- Password length / complexity text

Do not put real passwords in docs or Issues.

## Loop and STP

Path: `/loop_stp.html?nav=1-7`

Buttons: Refresh, Apply, Save, Disable all. Two tabs: loop detection and STP.

Task-oriented notes: [Loop protection and STP](../guides/loop-protection.md).

### Loop detection

| Item | Range / unit | At inspection |
|---|---|---|
| Loop prevention | Checkbox | Checked |
| Interval | 0 or 1–100, unit 0.1 s | 10, i.e. 1 s per the label |
| Recovery time | 0 or 1–100, unit seconds | 2 s |
| Loop-detect status | Per port 1–10 | Status cells were empty in the text dump; that is not a state reading |

The page does not explain special meaning for 0. This repo does not treat 0 as disable, immediate recover, or wait forever.

### STP

| Item | On the page | At inspection |
|---|---|---|
| Spanning tree | STP or RSTP | RSTP selected |
| STP edge port | Per-port checkbox and a select-all header | Ports 1–10 unchecked |
| Status | Per-port column | Ports 1–10 showed “forwarding” (转发) |

No bridge priority, path cost, Hello, Max Age, or Forward Delay.

Selecting RSTP only proves the radio state. It does not prove the implementation, or how it interacts with loop detection. Whether they are exclusive or auto-switch is unverified. The scope of “Disable all” is unverified.

## Reboot and restore

Path: `/reboot.html?nav=1-9`

Two buttons: Reboot (重启), Restore (恢复). Neither was clicked.

Restore especially: the page does not describe scope, so it is not “keep management IP”, “full factory”, or anything else. Hold time for the RST pinhole was not measured here either.
