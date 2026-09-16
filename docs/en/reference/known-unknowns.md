# Unverified items

After the 2.0.0.1 / A0 Simplified Chinese Web UI walkthrough, these still cannot be written as determined behaviour.
They make a reasonable Issue backlog. When you verify one, include firmware, whether you submitted, whether you rebooted, and whether you captured traffic.

## Apply, Save, persist

- Scope of Apply vs OK vs Save
- How long unsaved config lives (refresh? logout? power loss?)
- Whether Save writes startup config
- Whether Save on a status page is the same action as on a config page

## VLAN

- Why VLAN 1 cannot select non-member
- After changing PVID, whether VLAN 1 allows dropping members
- Whether VLAN 1 can be deleted
- Whether setting untagged rewrites PVID
- Whether one port can be untagged in more than one VLAN
- Whether a non-member port drops ingress for that VID
- VID 0, 4095, and the form that says 2–4094 while VLAN 1 is still editable
- Hidden ingress filtering
- Whether management is glued to VLAN 1; which VLANs can open the Web UI (the IPv4 page has no control)

## Aggregation

- Exact meaning of Static / LAG / LACP
- What the 1–65535 field under the second “port type” label is
- Meaning of group 0
- Actual LACP short / long seconds
- Hash algorithm
- How bundled ports appear on the VLAN pages

## Loop and STP

- How loop detection and STP cooperate
- What “Disable all” turns off
- Meaning of interval / recovery = 0
- Whether edge port skips learning / listening
- Status words other than “forwarding”

## Storm control and IGMP

- Whether table rate 0 means unused or limited to zero
- Direction (in / out / both) and metering grain
- How the editor default “on” relates to the table
- Which extra fields appear after the IGMP master switch is enabled
- Which ports receive “flood join frames”

## Maintenance

- Whether Restore keeps management IP, users, firmware
- RST pinhole short vs long press
- Whether config import or firmware upgrade reboots, and whether VLANs survive
- File format of downloaded config / firmware
- Whether the export contains passwords

## Outside the visible menus

No standalone entry was seen (that is not “hardware or other firmware never has it”):

ACL, QoS, 802.1X, SNMP, syslog, NTP/SNTP, IPv6, DHCP server, L3 routing, PoE, management VLAN, jumbo frames, HTTPS, multiple users.

`nav` gaps: [menu map](menu-map.md).
