# First login

## Factory management entry

The two values below were **not** read on this 2.0.0.1 walkthrough (the unit’s address and account had already been changed).
They come from the vendor SKS32 notes and several independent reviews, which agree, so they are written as factory values:

| Item | Value |
|---|---|
| URL | `http://192.168.10.12` |
| Username | `admin` |
| Password | `admin` |

Browser requirements vary by document. The vendor manual mentions IE9+ / Chrome 23+ / Firefox 20+; use a current Chrome, Firefox, or Safari. This walkthrough used HTTP. Forced HTTPS was not seen.

## How to connect a PC

1. Ethernet from the PC to any RJ45 port (the console port is not how you reach the Web UI).
2. Set the PC IPv4 address in `192.168.10.0/24` except `.12`, for example `192.168.10.10/24`. Gateway can stay empty.
3. Open `http://192.168.10.12`.
4. Languages: Simplified Chinese, English, Русский язык, 日本語, 한국어. Field names in this repo follow Simplified Chinese.

If your LAN is already `192.168.10.0/24` and `.12` is taken, do not plug the switch into the live network first. Use a single cable to the PC, change the management address, then join the LAN.

## Three things after login

### 1. Change the password

**System → Users** (系统功能 → 用户)

The form is new username / current password / new password / confirm new password.
The visible page has no user list, extra accounts, or roles. Password length and complexity are not documented on the page.

### 2. Change the management address

**System → IPv4 Address** (系统功能 → IPv4地址)

| Item | Options |
|---|---|
| DHCP (IPv4) | Disable, Enable |
| IP address | IPv4 |
| Subnet mask | IPv4 mask |
| Default gateway | IPv4 |

This is the switch’s own management address, not a DHCP server and not inter-VLAN routing.
The page has **no** management VLAN ID. Vendor SKS32 notes say that after you change the IP, any VLAN can reach the management UI — that is vendor text, not verified on this firmware.

After you change the IP, the browser must use the new address. Put the PC on the new subnet (or back on DHCP).

### 3. Click Save (保存)

Most pages have both Apply (应用) and Save (保存). Vendor videos and some reviews treat Apply as immediate and Save as “still there after reboot”.

This walkthrough **did not** reboot to check that. Conservative approach: Apply, then Save once on the same or another page, then reboot in a maintenance window of your own.
See [common buttons](webui/index.md#common-buttons).

## If you cannot open the page

- PC and switch are not on the same subnet.
- Someone already changed the IP. Use the router client list, `arp -a`, or a direct cable and a scan.
- The account is no longer `admin`. Public notes use the RST pinhole for factory reset; hold time varies by write-up. **RST was not pressed here**, so this repo does not treat a specific number of seconds as verified. Whether restore keeps the management IP is also unverified.

## Do not do this on first login

- Do not change VLAN membership on a production uplink unless you can accept losing the management path.
- Do not upload firmware from an unknown source.
- Do not assume Restore (恢复) keeps the management address. The page does not explain the restore scope.
