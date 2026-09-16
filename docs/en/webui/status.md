# Status

This group is not all read-only: static MAC can add entries; dynamic MAC and port statistics have Clear.

## Port statistics

Path: `/port_statistics.html?nav=3-1`

Buttons: Refresh, Clear, Save.

Columns: port, port status, link status, good TX, error TX, good RX, error RX.

These are cumulative frame counts. There is no live Mbps, byte count, or error-type breakdown.

At the read:

- TX errors were 0 on every port
- RX errors were non-zero on a couple of ports
- Ports that were already down still kept historical counts

There is no counter start time, so you cannot date the errors or their rate. Compare reads spaced in time. Counters were not cleared here.

Clear may reset counters; it was not clicked, and it is unknown whether it affects other pages.

## Static MAC

Path: `/br_static_mac_entries.html?nav=3-2`

Buttons: Refresh, Add, Delete, Clear, Save.

The table was empty. List and create fields:

| Field | Hint on the page |
|---|---|
| MAC address | `xx:xx:xx:xx:xx:xx` |
| Port | Text input, no format or range hint |
| VLAN ID | 1–4094 |

Typical use: pin a unicast destination to a port and VLAN.

A static MAC is **not** IP/MAC binding, ARP protection, or 802.1X. Those features are not on this page.

## Dynamic MAC

Path: `/br_dynamic_mac_entries.html?nav=3-3`

Buttons: Refresh, Next page, Clear, Save. Filters: MAC address, VLAN ID, plus Search.

Columns: index, MAC, port, VLAN ID, ageing timer.

Visible entries were all VLAN 1. Ageing showed values such as 300, 281, 150. No unit is labelled, and there is no editable global ageing field. Do not treat 300 as a confirmed global setting.

One row is the switch’s own MAC on port **0**. That may be an internal management / CPU port. The page does not say so; it is not a faceplate port 0.

Do not paste a full dynamic MAC table into a public Issue: it is a list of stations that were on the LAN.
