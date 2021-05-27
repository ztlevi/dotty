# base/arch

## System backup

1. Generate package list

```sh
pacman -Qqe > $DOTFILES/ArchPackageList.txt
```

2. Reinstall the packages

```sh
sudo pacman -S `cat $DOTFILES/ArchPackageList.txt`
# This will also work, but Pacman will exit if you have a package
# installed that is not in the repositories.
```

3. **Grsync**: My backup path is `/home/run/media/ztlevi/65e80ac4-1f5a-4028-bfa2-885178ebdfa4`

```sh
# Grsync additional options
--exclude-from="/home/ztlevi/.dotty/grsync-rules"
```

## Nvidia Drivers

And we have the nvidia-installer doing all this automatic:

```sh
sudo pacman -S nvidia-installer
# To test the installation (-t)
nvidia-installer -b -t
# real installation:
sudo nvidia-installer -b
```

## AMD Drivers

```sh
sudo pacman -S xf86-video-amdgpu
```

## Other tools

- **Grub-customizer** :boot menu setting
- Dropbox: Sync files
- Grsync: backup tool
- Typora: Markdown editor
- Pandoc: Conversion between markup formats
- Xflux-gui(Not working right now): GUI flux, like night shift
- Redshift: night shift
- OBS: video recorder
- Webtorrent: torrent downloader
- Netease: Music client
- Slack
- Telegram
- Electronic Wechat: Wechat built on Electron
- Youdao-dict: Chinese <-> English Dictionary

## Reduce startup and shutdown timeout

1. `/etc/systemd/system.conf`:

   ```
   DefaultTimeoutStartSec=10s
   DefaultTimeoutStopSec=10s
   ```

2. Then reload systemd by
   ```sh
   systemctl daemon-reload
   ```

## Fix Dual Boot time conflicts

Linux: The hardware clock can be queried and set with the timedatectl command. To change the hardware clock time
standard to localtime, use: `timedatectl set-local-rtc 1`

OR

Windows: To fix it, just hit Start and type regedit.exe in the search box. Hit Enter and navigate to
`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation`. Right click anywhere in the right pane and
hit New > DWORD (32-bit) Value. Name it RealTimeIsUniversal, then double click on it and give it a value of 1.
