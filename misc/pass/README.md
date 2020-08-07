TODO: pass

# [misc/pass](https://gist.github.com/abtrout/d64fb11ad6f9f49fa325)

[Password-store](http://www.zx2c4.com/projects/password-store/) keeps your passwords (or any other sensitive
information) saved in GnuPG encrypted files organized in `~/.password-store`. For more information about GPG, consult
the [GNU Privacy Handbook](https://www.gnupg.org/gph/en/manual.html).

### Getting started

To get started, install `pass` and generate a keypair.

```shell
$ brew install pass

$ sudo apt-get install pass
$ gpg --gen-key
$ gpg --list-keys
$ # cd ~/Dropbox/GPG
```

Back up the keypair and store it in a safe place.

```shell
$ gpg --export-secret-keys --armor <fingerprint> > privkey.asc
$ gpg --export --armor <fingerprint> > pubkey.asc
```

### Start using `pass`

```shell
$ pass init <fingerprint>
```

Each entry is its own file, so you can store whatever text information you'd like, eg. usernames, email addresses,
answers to secret questions, two factor auth backup codes, etc. Read the
[man page](http://git.zx2c4.com/password-store/about/) for a complete description of its features.

A particularly nice feature is the ability to keep your password store in a git repository.

### Managing your password-store with git

#### Initalization

Initialize a new bare repository on your server.

```shell
server $ git init --bare ~/.password-store
```

Make your local password store a git respository and add a remote URL that points to your server.

```shell
$ pass git init
$ pass git remote add origin user@server
$ pass git push
```

#### Utlize on a new PC

Using our password store on a new host is easy now.

Import your keypair.

```shell
$ gpg --import pubkey.asc
$ gpg --allow-secret-key-import --import privkey.asc
```

[Trust](https://www.gnupg.org/gph/en/manual.html#AEN346) them if necessary.

```shell
$ gpg --edit-key <fingerprint>
```

Clone your repository to `~/.password-store`.

```shell
$ git clone user@server ~/.password-store
$ # git clone https://github.com/ztlevi/pass-store.git ~/.password-store
```

At this point you can use `pass` on each host and manually synch them with `pass git push` and `pass git pull`. To
delete your password store, just `rm -rf ~/.password-store`.
