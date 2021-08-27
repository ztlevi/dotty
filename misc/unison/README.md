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
- Choose "New Image"
- Enter a nice Name for your Volume, e.g "Workspace"
- Set the size to something that will most likely fit your needs (resizing is a whole another story)
- Select "APFS (Case-sensitive)" or encrypted in "Format".
- Save and create
