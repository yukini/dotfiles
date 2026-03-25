#################################
# Locale
#################################
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#################################
# Paths
#################################
export GOPATH=$HOME/go
export VOLTA_HOME="$HOME/.volta"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$GOPATH/bin"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$PATH:/Users/yukini/.local/bin"
export PATH="/Users/yukini/.antigravity/antigravity/bin:$PATH"

export KALEIDOSCOPE_DIR=/Users/yukini/playground/Kaleidoscope

#################################
# Misc
#################################
export DOCKER_HOST_IP=$(ipconfig getifaddr en1)
# export DOCKER_HOST='unix:///var/folders/6d/zq044wtd3yj5z051mk1gqk7m0000gn/T/podman/podman-machine-default-api.sock'

. "$HOME/.cargo/env"

export http_proxy=
export https_proxy=${http_proxy}
export HTTP_PROXY=${http_proxy}
export HTTPS_PROXY=${http_proxy}

export JAVA_HOME=`/usr/libexec/java_home -v 21`
