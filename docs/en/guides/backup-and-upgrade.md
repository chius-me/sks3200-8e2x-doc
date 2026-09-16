# Backup and firmware

Related pages:

- [Tools → Configuration](../webui/tools.md#configuration)
- [Tools → Firmware](../webui/tools.md#firmware)
- [System → Reboot & restore](../webui/system.md#reboot-and-restore)

This walkthrough did not download config, download firmware, upload, reboot, or click Restore. The notes below are only the visible entry points and what must not be treated as fact.

## Backup

The configuration page offers Download config. Do that before you change VLANs, LAG, or the management IP. It is the only backup control visible in the UI.

Unknown:

- File extension and whether a text editor can open it
- Whether it contains passwords or usernames
- Running vs startup config
- Whether unsaved changes appear in the export

Treat the file as if it contains credentials: keep it local, do not commit it to git.

## Restore config

The same page has Choose file and Upload config. Whether import requires a reboot, checks the model, or can brick the unit is unknown.

The RST pinhole and the page’s Restore button are not the same verified operation. Restore’s scope is unknown; RST hold time was not measured here.

## Firmware

The firmware page also has download and upload.

Download firmware looks like dumping the running image, not checking the vendor site. Whether that file can be flashed back, and whether it has a checksum, is unknown.

On upload:

- Use a file that matches **SKS3200-8E2X** and your hardware revision
- Do not flash 5E2X, 8E2X-P, or other series packages unless you have an independent, repeatable success and accept a brick
- Keep power applied during the upgrade
- Whether VLANs / management IP survive is unverified — still download config first

Vendor firmware comes from the vendor. This repo does not host binaries.

## Save, reboot, power loss

If you accept the usual vendor/community reading of Save: after you finish, click Save, then reboot once in a maintenance window and confirm VLANs and the management IP are still there.

That is a suggested check, not an experiment already run on 2.0.0.1. Before/after reboot notes are welcome as Issues.
