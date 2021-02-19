# GNUPG

Linux will pinentry-gnome, macos will use pinentry-mac as interface client.

## GPG forwarding

1. Generate ssh config with gpg forwarding enabled using the following command. This will append a
   config to your `~/.ssh/config`.

   ```sh
   generate-ssh-gpg-config kuro 10.0.0.3 ztlevi
   ```

2. You can either add `StreamLocalBindUnlink yes` to your `/etc/ssh/sshd_config` and restart your
   sshd service. Or use `ssh-with-gpg-socket-deleted kuro 10.0.0.3 ztlevi` to kill remote gpg-agent
   and then create a ssh session with local gpg forwarded.
3. Copy the puclic key to the remote machine

   ```sh
   scp -r $HOME/.gnupg kuro:/home/ztlevi
   # Then on remote server, e.g. kuro, do:
   gpgconf --kill gpg-agent
   ```

   Or, if you exported already:

   ```sh
   cd ~/Downloads/mygpgexport
   gpg --import myprivatekeys.asc
   gpg --import mypubkeys.asc
   gpg -K
   gpg -k
   gpg --import-ownertrust otrust.txt

   # restart agent
   gpgconf --kill gpg-agent
   ```
