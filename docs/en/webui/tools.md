# Tools

## Configuration

Path: `/config_tool.html?nav=4-1`

Visible: a download area; Download config, Choose file, Upload config.

Nothing was downloaded, chosen, or uploaded. Therefore all of the following are unverified:

- Export format (text / binary / human-readable)
- Whether passwords are included
- Running vs startup config
- Whether import reboots or takes effect immediately

Before you change VLANs or LAG, at least try a download and confirm the file opens locally. Do not commit unredacted backups to this repo.

More notes: [Backup and firmware](../guides/backup-and-upgrade.md).

## Firmware

Path: `/firmware_manage.html?nav=4-2`

Visible: a download area; Download firmware, Choose file, Upload firmware.

“Download firmware” is the button label on the device. It does **not** mean “fetch the vendor’s latest” or “check for updates”. It looks more like dumping the image the unit is running. Nothing was downloaded; origin, format, and checksums are unknown.

Compatibility checks on upload, failed-upgrade rollback, and whether VLANs survive an upgrade are also unverified.

!!! danger "Do not mix images"
    Community threads mention flashing SKS3200-5E2X (and similar) images onto an 8E2X. This repo does not provide those steps. Use an image that matches the model and hardware revision, from a source you can trace.
