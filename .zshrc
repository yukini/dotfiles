set completion-ignore-case on

RPROMPT='[%F{green}%d%f]'

if type lolcat cowsay 2>/dev/null 1>/dev/null
then
    echo "$(date)\n morning!" | cowsay | lolcat -F 0.6 -S 0 -a -s 800
fi

echo $'\e[32m##################################################'

# history
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt EXTENDED_HISTORY

# figlet morning!
alias ls='ls -Gp'
alias ll='ls -l'
alias la='ll -A'
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

######################################################
# echo ""
# echo $'\e[31m*  \e[32m*  \e[33m*  \e[34m*  \e[35m* \e[36m    user-name command to be executed \e[m'
# echo $'\e[31m|  \e[32m|  \e[33m|  \e[34m|  \e[35m| \e[36m                                     \e[m'
# echo $'\e[31m|  \e[32m|  \e[33m|  \e[34m|  \e[35m.---- day of week (0 - 6) (Sunday=0 or 7)    \e[m'
# echo $'\e[31m|  \e[32m|  \e[33m|  \e[34m.------- month (1 - 12)                               \e[m'
# echo $'\e[31m|  \e[32m|  \e[33m.---------- day of month (1 - 31)                              \e[m'
# echo $'\e[31m|  \e[32m.------------- hour (0 - 23)                                            \e[m'
# echo $'\e[31m.---------------- minute (0 - 59)                                                \e[m'
# ######################################################

# Go lang
if [ -x "`which go`" ]; then
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin
fi

export PATH=$PATH:~/bin
export PATH="$HOME/.rbenv/bin:$PATH"
if type rbenv 2>/dev/null 1>/dev/null
then
    eval "$(rbenv init -)"
fi

