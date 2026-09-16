<p align="right">
  English | <a href="./CONTRIBUTING.zh.md">简体中文</a>
</p>

# Contributing

This repository records the **SKS3200-8E2X** Web UI as it actually appears, and forwarding behaviour only when there is evidence. Prefer observations that can be checked. Do not write generic switch lore as if it were this device.

## Confirm firmware first

From **System → System Information**, note:

- Device description
- Firmware version
- Hardware version
- Web UI language

2.0.0.1 / A0 is the baseline for the current pages. Older firmware uses a different VLAN model (Bridge ID). Mark that as a different family; do not fold those steps into the 2.0.0.1 guides.

## Welcome

- Fields, options, or missing pages that disagree with the current text
- What happens after Apply / OK / Save, and after a reboot
- VLAN / LAG / STP / mirroring behaviour confirmed with captures or a peer device
- UI wording in other languages
- Redacted notes on exported config format
- Typos, dead links, structure

## Not accepted

- Unredacted config files, full firmware images, passwords, full MAC tables
- Copying vendor marketing or another SKU’s features as “present on this unit”
- “It should work like this” without an evidence level
- Exploits, login bypasses, or attacks against the device

## Evidence levels

Use the same four levels as the docs:

| Level | Meaning | Example |
|---|---|---|
| Seen in UI | The control is on the page | “Tagged VLAN add form has untagged / tagged / non-member” |
| Value at inspection | What the screen showed then | “PVID was 1 on every port”; not a factory default |
| Submitted | Clicked Apply / OK / Save | Which button, and whether the page changed |
| Forwarding verified | Capture, peer, or live traffic | Topology, VID, tagged/untagged, result |

If it is unclear, add it to [Unverified items](docs/en/reference/known-unknowns.md). Do not promote it to a how-to step.

## How to send it

1. Open an [Issue](.github/ISSUE_TEMPLATE/observation.yml) first when it conflicts with the current text.
2. Documentation changes go in a pull request against `docs/en/` and/or `docs/zh/`. Keep the two languages in sync when you change meaning.
3. Raw inventories can go in `sources/`. Strip passwords, full MACs, public IPs, and personal accounts.

Preview:

```bash
pip install -r requirements.txt
mkdocs serve
```

Before you finish, `mkdocs build --strict` should pass.
