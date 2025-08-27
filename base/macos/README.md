# base/macos

## MacOS create case sensitive volume

- Launch Disk Utility
- Select the master disk, e.g. Macintosh HD, then, click volume plus sign on top.
- Give a name for the volume and select APFS case sensitive for format.
- Click add.

### symlink your newly created volume

```sh
ln -s /Volumes/dev ~/
```

### Case-sensitivity test

```sh
cd ~/dev; touch test_case; [[ $(ls TEST_CASE 2>/dev/null) ]] && echo 'CASE-SENSITIVITY ERROR' || echo 'Success'; rm test_case
```
