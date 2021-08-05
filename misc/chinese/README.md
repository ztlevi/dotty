# misc/chinese

## Rime

1. Run the command: `sudo pacman -Syu fcitx fcitx-im fcitx-configtool fcitx-rime librime`
2. Edit ~/.xinitrc ( as I use startx):
   ```sh
   # .xprofile or .xinitrc
   export GTK_IM_MODULE=fcitx
   export QT_IM_MODULE=fcitx
   export XMODIFIERS="@im=fcitx"
   ```
3. Logout and then login
4. Launch Fcitx Config GUI, add Rime as input method.

## Rime sougou dict

https://github.com/metowolf/rime-sogou

## Chinese Encoding and font issue

1. Install **noto-fonts-cjk** (Google Noto CJK fonts), which supports Chinese, Japanese, Korean.
2. Edit **/etc/fonts/conf.d/65-nonlatin.conf**, put the preferred font e.g. Noto Sans CJK SC in the
   file under **sans-serif** family tag.
   ```
   <!-- chinese fonts are actually serifed -->
   <family>Noto Sans CJK SC</family> <!-- han (zh-cn,zh-tw) -->
   ```
