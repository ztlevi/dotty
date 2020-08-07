# shell/zsh

## ZSH ENV

1. ZSH load env via this order: `zshenv -> zprofile -> zshrc`. And it will inject
   `/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Frameworks/Mono.framework/Versions/Current/Commands:` into
   your system PATH at the beginning of zprofile (or the end of zshenv).
2. System PATH changes should go to profile.
