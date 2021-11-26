# Setup local git config

After deploy `shell/git`, you will need to dump some personal user config to `~/work/dots`. Then the
configs will be sourced by `~/.config/git/config`.

## Create user config using the following script

```sh
mkdir -p ~/work/dots
cat <<EOF >~/work/dots/git-user-config
[user]
	name = <your-name>
	email = <your-email>
	signingkey = <your-email>
[github]
	user = <your-github-account-id>
EOF
```

## (Optional) Create gpg config using the following script

This will enable gpp sign. If you don't use gpg on your machine, don't do it. Otherwise you will
block your git operations.

```sh
cat <<EOF >~/work/dots/git-gpg-config
[commit]
	gpgsign = true
[tag]
	gpgsign = true
EOF
```

## Company config: when you work on a company based machine, and you have a different git account

```sh
cat <<EOF >~/work/dots/git-company-config
[user]
	name = <your-name>
	email = <you-comany-email>
	signingkey = <you-comany-email>
EOF
```

# Other Git terminal interfaces

I'm using Emacs's git client called Magit. It's a great interface. But I would not recommend to
non-Emacs users. There are other options there.

- [Lazygit](https://github.com/jesseduffield/lazygit): A simple terminal UI for git commands,
  written in Go with the gocui library.
- [Forgit](https://github.com/wfxr/forgit): This tool is designed to help you use git more
  efficiently. It's lightweight and easy to use. Built with FZF.

# [Git extras commands](https://github.com/tj/git-extras/blob/master/Commands.md)

# Git Setup

## Personal token as password

Git now uses personal tokens as password, go [here](https://github.com/settings/tokens) to create a
new token.

## (Deprecated) Credential Storage: default credential is stored in "~/.git-credentials".

https://git-scm.com/book/en/v2/Git-Tools-Credential-Storage

## (Optional) SSH Setup

Setup SSH key to prevent typing username and password each time you operate your github:

1. Paste the text below, substituting in your GitHub email address.
   ```sh
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```
   This creates a new ssh key, using the provided email as a label.
2. Adding your SSH key to the ssh-agent, ensure ssh-agent is enabled:
   ```sh
   eval "$(ssh-agent -s)"
   ```
3. Add your SSH key to the ssh-agent. If you used an existing SSH key rather than generating a new
   SSH key, you'll need to replace id_rsa in the command with the name of your existing private key
   file.
   ```sh
   ssh-add ~/.ssh/id_rsa
   ```
4. Adding a new SSH key to your GitHub account 1)Copy the SSH key to your clipboard:
   ```sh
   APT_INSTALL xclip
   xclip -sel clip < ~/.ssh/id_rsa.pub
   ```
5. Go to Github profile-->settings-->SSH and GPG keys-->New SSH key or Add SSH key-->paste ssh key
   you copy-->Add SSH key
6. Go to repo-->Clone or download-->Use SSH: git@github.com:ztlevi/dotty.git
   ```sh
   git remote set-url origin git@github.com:ztlevi/dotty.git
   ```
