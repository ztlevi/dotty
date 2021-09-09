# shell/unison

Ensure Passphrase-less SSH

# Increase file watch limit for Unison

## Increase MacOS File Descriptor Limits

if encountered "No space left on device" issue, increase the size limit.

```sh
sudo sysctl kern.maxfiles=131072 kern.maxfilesperproc=65536
```

Add to /etc/sysctl.conf to persist across reboots (use sudo):

```sh
kern.maxfiles=131072
kern.maxfilesperproc=65536
```

## Increase Linux File Watch Limit

```sh
sudo sysctl -w fs.inotify.max_user_watches=131072
```

Add to /etc/sysctl.conf to persist across reboots:

```sh
# Increase file watch limit for Unison
fs.inotify.max_user_watches = 131072
```

## MacOS create case sensitive volume

- Launch Disk Utility
- Select the master disk, e.g. Macintosh HD, then, click volume plus sign on top.
- Give a name for the volume and select APFS case sensitive for format.
- Click add.

### symlink your newly created volume

```sh
ln -s /Volumes/workplace ~/
```

### Case-sensitivity test

```sh
cd ~/workplace; touch test_case; [[ $(ls TEST_CASE 2>/dev/null) ]] && echo 'CASE-SENSITIVITY ERROR' || echo 'Success'; rm test_case
```
