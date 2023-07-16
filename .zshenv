alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

export PATH=$PATH:/Users/yukini/.local/bin
# react-native android simulator
export PATH=/Applications/Genymotion.app/Contents/MacOS/tools:$PATH
export JAVA_HOME=`/usr/libexec/java_home -v 13`
export PATH=~/.npm-global/bin:$PATH
# export PATH=/opt/homebrew/bin:$PATH

export DOCKER_HOST_IP=$(ipconfig getifaddr en1)
. "$HOME/.cargo/env"
