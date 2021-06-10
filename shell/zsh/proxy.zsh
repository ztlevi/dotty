#!/usr/bin/env zsh

# ClashX Pro: Copy shell command
http_port=7890
socks_port=7890
proxyon() {
  export http_proxy="http://127.0.0.1:$http_port"
  export https_proxy="http://127.0.0.1:$http_port"
  export all_proxy="socks5://127.0.0.1:$socks_port"
  echo "Proxy on"
}
proxyoff() {
  unset http_proxy
  unset https_proxy
  unset all_proxy
  echo "Proxy off"
}
