export GOPATH="$XDG_DATA_HOME/go"
export GOROOT=$(go env GOROOT)

# Adds $GOPATH/bin's to PATH
path=( `printf '%s/bin\n' ${(@s/:/)GOPATH}` $path )
