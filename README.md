<p align="right">
  English | <a href="./README.zh.md">简体中文</a>
</p>

<h1 align="center">SKS3200-8E2X Docs</h1>

<p align="center">
  Community configuration docs for the XikeStor SKS3200-8E2X Web UI.
</p>

<p align="center">
  <img alt="firmware" src="https://img.shields.io/badge/firmware-2.0.0.1-0f766e">
  <img alt="hardware" src="https://img.shields.io/badge/hardware-A0-0f766e">
  <img alt="license" src="https://img.shields.io/badge/license-CC%20BY--SA%204.0-22863a">
</p>

This is **not** an official vendor manual, and it is not affiliated with XikeStor / 兮克.

The pages are based on a live walkthrough of firmware **2.0.0.1** on hardware **A0**, using the Simplified Chinese Web UI. Settings were read, not applied. Anything that still needs a submit, reboot, or packet capture is marked as such.

**Docs site:** [English](https://chius-me.github.io/sks3200-8e2x-doc/) · [简体中文](https://chius-me.github.io/sks3200-8e2x-doc/zh/)

## The switch

| | |
|---|---|
| Model | SKS3200-8E2X |
| Ports | 8 × 2.5G RJ45 + 2 × 10G SFP+ |
| Role | Lightly managed Layer 2 switch |
| Factory management URL (vendor / community) | `http://192.168.10.12` |
| Factory login (vendor / community) | `admin` / `admin` |

Full specs and sources: [Hardware](docs/en/hardware.md).

## Start here

1. [First login](docs/en/getting-started.md) — management address and password
2. [VLAN](docs/en/guides/vlan.md) — no Access/Trunk button; PVID and tagged/untagged membership are two pages
3. [Link aggregation](docs/en/guides/lag.md) — Static / LAG / LACP, including the duplicated “port type” label
4. [How to read this](docs/en/methodology.md) — “seen in the UI” is not “verified forwarding”

Preview the site locally:

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
mkdocs serve
```

Open <http://127.0.0.1:8000>. GitHub Pages is built from `main` by `.github/workflows/pages.yml`.

## Scope

Current pages cover:

- Model: SKS3200-8E2X
- Hardware: A0
- Firmware: 2.0.0.1
- UI: Simplified Chinese Web UI, 4 top-level menus, 17 pages

Nothing was submitted. No save, clear, reboot, restore, upload, or upgrade. “Value at inspection” is a snapshot, not a factory default.

The same model also shipped with an older Web UI that configured VLANs via Bridge IDs. Do not mix those tutorials with 2.0.0.1. See [firmware families](docs/en/reference/firmware-families.md).

## Layout

```text
docs/en/              English MkDocs pages
docs/zh/              Chinese MkDocs pages
sources/              Redacted original inventory (Chinese)
.github/              Issue templates and GitHub Pages workflow
```

## Contributing

Observations for other firmware, UI languages, or packet-tested forwarding are welcome. Read [CONTRIBUTING.md](CONTRIBUTING.md) first.

Please include **firmware / hardware / page / whether you clicked Apply or Save / whether you packet-tested**. Do not upload config files that contain passwords.

## License

Documentation is [CC BY-SA 4.0](LICENSE). Product names identify the hardware being documented.
