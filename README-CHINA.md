# For users in China

## [Tsinghua homebrew mirror](https://mirrors.tuna.tsinghua.edu.cn/help/homebrew/)

## gitclone speedup

```sh
​git config --global url."https://gitclone.com/".insteadOf https://
```

## `Go get` speedup

```sh
export GOPROXY=https://goproxy.io
```

## Pip

升级 pip 到最新的版本 (>=10.0.0) 后进行配置：

```sh
pip install pip -U
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
```

如果您到 pip 默认源的网络连接较差，临时使用本镜像站来升级 pip：

```sh
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U
```

## NPM

你可以使用我们定制的 cnpm (gzip 压缩支持) 命令行工具代替默认的 npm:

```sh
npm install -g cnpm --registry=https://registry.npm.taobao.org
```

或者更改配置:

```sh
npm config set registry http://registry.npm.taobao.org
```
