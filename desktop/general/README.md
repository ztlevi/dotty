# Not really a module

Some resource files shared across linux desktop environment.

# Run desktop environment inside another one

Insatll `xorg-server-xephyr`.

```sh
Xephyr -br -ac -noreset -screen 2560x1440 :1 &
DISPLAY=:1 awesome
```
