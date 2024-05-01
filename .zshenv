export PATH=$PATH:/Users/yukini/.local/bin

export DOCKER_HOST_IP=$(ipconfig getifaddr en1)

. "$HOME/.cargo/env"

export http_proxy=
export https_proxy=${http_proxy}
export HTTP_PROXY=${http_proxy}
export HTTPS_PROXY=${http_proxy}

export JAVA_HOME=`/usr/libexec/java_home -v 21`
