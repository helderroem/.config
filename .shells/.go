if [ -n $(command -v go) ]; then
	export GOPATH="$HOME/.go"
  export PATH="$GOPATH:$PATH"
fi
