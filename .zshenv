export PATH=$PATH:/Users/yukini/.local/bin

export DOCKER_HOST_IP=$(ipconfig getifaddr en1)
# export DOCKER_HOST='unix:///var/folders/6d/zq044wtd3yj5z051mk1gqk7m0000gn/T/podman/podman-machine-default-api.sock'

. "$HOME/.cargo/env"

export http_proxy=
export https_proxy=${http_proxy}
export HTTP_PROXY=${http_proxy}
export HTTPS_PROXY=${http_proxy}

export JAVA_HOME=`/usr/libexec/java_home -v 21`
