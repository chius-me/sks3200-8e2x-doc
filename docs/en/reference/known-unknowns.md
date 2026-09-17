# Unverified items

After the 2.0.0.1 / A0 Chinese Web UI walkthrough **and** [vendor manual V2.0](vendor-manual.md), some items moved from “unknown” to “vendor-defined, not independently tested here”. What remains below still cannot be written as determined behaviour on this unit.

When you verify one, include firmware, whether you submitted, whether you rebooted, and whether you captured traffic.

## Still open

### Apply, Save, persist

- How long unsaved Apply lives (refresh? logout? power loss?)
- Whether Save equals startup-config that survives power loss (V2.0 only says “save the current configuration”)
- Whether OK in a dialog is the same as Apply on a page

### VLAN

- Why VLAN 1 cannot select non-member
- After changing PVID, whether VLAN 1 allows dropping members
- Whether VLAN 1 can be deleted
- Reverse auto-link: setting untagged membership rewriting PVID (V2.0 describes PVID → untagged member, not the other way)
- Whether one port can be untagged in more than one VLAN
- Whether a non-member port drops ingress for that VID
- VID 0, 4095, and the form that says 2–4094 while VLAN 1 is still editable
- Hidden ingress filtering
- Whether management is glued to VLAN 1; which VLANs can open the Web UI (the IPv4 page has no control)

### Aggregation

- Meaning of group **0**
- Hash algorithm
- LACP active / passive
- How bundled ports appear on the VLAN pages
- A working LAG/LACP bundle on this hardware

### Loop and STP

- How loop detection and STP cooperate (V2.0 only says enable what the topology needs)
- What “Disable all” turns off
- Meaning of interval / recovery = 0
- Whether edge port skips learning / listening
- Status words other than “forwarding”

### Storm control and IGMP

- Whether table rate 0 means unused or limited to zero
- Direction (in / out / both) and metering grain
- How the editor default “on” relates to the table
- Group table and extra fields after IGMP is enabled (V2.0 screenshots show a group page; not opened here)
- Exact ports that receive Broadcast Join Message

### Maintenance

- Whether factory Restore returns IP `192.168.10.12` and `admin` / `admin`
- RST pinhole short vs long press
- Config import reboot behaviour
- File format of downloaded config / firmware
- Whether the export contains passwords
- Whether VLANs survive a firmware upgrade (V2.0: the switch restarts automatically after a successful write)

## Outside the visible menus

No standalone entry was seen (that is not “hardware or other firmware never has it”):

ACL, QoS, 802.1X, SNMP, syslog, NTP/SNTP, IPv6 **settings page** (V2.0: System Information can display an IPv6 address), DHCP server, L3 routing, PoE on this non-P SKU, management VLAN, jumbo frames, HTTPS, multiple users.

`nav` gaps: [menu map](menu-map.md).
