# shell/unison

Ensure Passphrase-less SSH

# Increase file watch limit for Unison

## Increase MacOS File Descriptor Limits

if encountered "No space left on device" issue, increase the size limit.

```sh
sudo sysctl kern.maxfiles=524288 kern.maxfilesperproc=262144
```

Add to /etc/sysctl.conf to persist across reboots (use sudo):

```sh
kern.maxfiles=524288
kern.maxfilesperproc=262144
```

## Increase Linux File Watch Limit

```sh
sudo sysctl -w fs.inotify.max_user_watches=524288
```

Add to /etc/sysctl.conf to persist across reboots:

```sh
# Increase file watch limit for Unison
fs.inotify.max_user_watches = 524288
```
