# shell/unison

Ensure Passphrase-less SSH

# Increase file watch limit for Unison

## Increase MacOS File Descriptor Limits

Add to /etc/sysctl.conf to persist across reboots (use sudo):

```sh
kern.maxfiles=131072
kern.maxfilesperproc=65536
```

## Increase Linux File Watch Limit

Add to /etc/sysctl.conf to persist across reboots:

```sh
# Increase file watch limit for Unison
fs.inotify.max_user_watches = 131072
```

## TODO: macos create case sensitive volume
