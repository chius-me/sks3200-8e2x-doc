<p align="right">
  English | <a href="./SECURITY.zh.md">简体中文</a>
</p>

# Security

## This is not a bug-bounty repo

This project only documents Web UI configuration items. Do not post exploitable attack details in Issues. If you think the firmware has a security problem, contact the vendor.

## Using the switch

Public sources give the factory login as `admin` / `admin` at `192.168.10.12`. After first login you should:

1. Change the username and password
2. Move the management address onto the subnet you actually use
3. Keep the Web UI off untrusted networks

The 2.0.0.1 Chinese Web UI **did not show**:

- Multiple users / roles
- An HTTPS toggle
- A management VLAN selector
- ACL, 802.1X, or SNMP

Do not describe this unit as if it already had enterprise-grade management-plane isolation.

## When contributing here

Do not submit:

- Passwords, full config files, or unredacted backups
- Full device MACs, public IPs, or identifiable station MAC tables
- Firmware binaries (size and copyright do not belong in a docs repo)

You may describe export format. Examples must be redacted.
