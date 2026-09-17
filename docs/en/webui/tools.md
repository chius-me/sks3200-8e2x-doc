# Tools

## Configuration

Path: `/config_tool.html?nav=4-1`

Visible: a download area; Download config, Choose file, Upload config.

Nothing was downloaded, chosen, or uploaded. Therefore all of the following are unverified:

- Export format (text / binary / human-readable)
- Whether passwords are included
- Whether unsaved Apply changes appear in the file
- Whether import reboots immediately

Vendor manual V2.0: download the **current** configuration; upload a previously saved file to restore it. Keep backups **per device and firmware branch**; upload only a file compatible with the target model and firmware.

Before you change VLANs or LAG, at least try a download and confirm the file opens locally. Do not commit unredacted backups to this repo.

More notes: [Backup and firmware](../guides/backup-and-upgrade.md).

## Firmware

Path: `/firmware_manage.html?nav=4-2`

Visible: a download area; Download firmware, Choose file, Upload firmware.

“Download firmware” is the button label on the device. It does **not** mean “fetch the vendor’s latest” or “check for updates”. It looks more like dumping the image the unit is running. Nothing was downloaded; origin, format, and checksums are unknown.

Vendor manual V2.0: after the image is programmed successfully the switch **restarts automatically**; back up first; do not cut power, close the session, or interrupt the network while writing. Use the file for the **exact model**.

Compatibility checks, failed-upgrade rollback, and whether VLANs survive are still unverified here.

!!! danger "Do not mix images"
    Community threads mention flashing SKS3200-5E2X (and similar) images onto an 8E2X. This repo does not provide those steps. Use an image that matches the model and hardware revision, from a source you can trace.
