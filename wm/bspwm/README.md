# wm/bspwm

If you're a Manjaro user like me, I recommend install Manjaro Gnome. It's more stable while bspwm
version is kind of out dated.

bspwm doesn't come with handy system settings app. I use `gnome-control-center` or
`unity-control-center` instead.

You might encounter some werid issue, e.g. auth problem when using `Add/Remove Software` ,
`gnome-control-center` cannot open on Manjaro with bspwm. My solution is to take a look at the
offical repo's config. For example, this
[`.xinitrc` file](https://gitlab.manjaro.org/profiles-and-settings/desktop-settings/-/blob/master/community/pantheon/skel/.xinitrc#L16).

## Monitor resolution

Most of the scripts is compatible for both 2K and 4K monitors. It's controlled by `GDK_SCALE` env.

Take a look at the [wiki](https://wiki.archlinux.org/index.php/HiDPI#Qt_5) for resolving HIDPI
problems on Arch.

## Using Gnome apps

`gnome-control-center` sometimes breaks on Manjaro. If it cannot be opened, try
`dconf reset -f /org/gnome/control-center/`.

## Polybar network device

You will need to config your network device in `shell/zsh/local.zsh`.

```sh
export ETHERNET_DEVICE=eno1
export WIRELESS_DEVICE=wlp6s0
```
