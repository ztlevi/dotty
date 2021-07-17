#!/usr/bin/env zsh

# ClashX Pro: Copy shell command
clash_proxyon() {
  http_port=7890
  socks_port=7890
  export http_proxy="http://127.0.0.1:$http_port"
  export https_proxy="http://127.0.0.1:$http_port"
  export all_proxy="socks5://127.0.0.1:$socks_port"
  echo ${fg_bold[white]}${bg[blue]}"Clash proxy on"${reset_color}
}
ss_proxyon() {
  export http_proxy=socks5://127.0.0.1:1080
  export https_proxy=socks5://127.0.0.1:1080
  echo ${fg_bold[white]}${bg[blue]}"ShadowSockets proxy on"${reset_color}
}
proxyoff() {
  unset http_proxy
  unset https_proxy
  unset all_proxy
  echo ${fg_bold[white]}${bg[blue]}"Proxy off"${reset_color}
}
