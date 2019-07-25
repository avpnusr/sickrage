![SickRage Logo](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/sickrage-banner.png)
**SickRage in container for devices with an ARM CPU**
====
Image was created on a TinkerBoard (S) and is automatically updated, when a new version of SickRage arrives on GitHub. The image is based on alpine Linux.

Versions in latest image
---
The image is based on the latest **[SickRage](https://sickrage.github.io/ "SickRage Homepage")** version from **[cytec](https://github.com/cytec/SickRage "cytec SickRage")** which is a version, optimized specially for german users. On request, I will provide a version from the standard SickRage git.

Tested and compatible with following devices
----
- Raspberry Pi
- Raspberry Pi2
- Raspberry Pi3
- Raspberry Pi4
- Raspberry Pi Zero
- Rock64
- TinkerBoard
- TinkerBoard S

Start your container
-----
For **[/cfg+db/location]**, use the volume, where your config-file and the database from SickRage is stored.

For **[/incoming/folder]**, you can use the volume, where the files will be stored, that SickRage should process.

For **[/media/folder]**, use the volume, where the postprocessed files will be stored.

```
docker run -d \
  -v [/cfg+db/location]:/data \
  -v [/incoming/folder]:/incoming \
  -v [/media/folder]:/media \
  -e UID=[Users UID] \
  -e GID=[Users GID] \
  -p 8081:8081 \
  --restart=always avpnusr/sickpi
```
