set completion-ignore-case on

RPROMPT='[%F{green}%d%f]'

# if type lolcat cowsay 2>/dev/null 1>/dev/null
# then
#     echo "$(date)\n morning!" | cowsay | lolcat -F 0.7
#     echo $'\e[32m##################################################'
# fi


# history
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
setopt EXTENDED_HISTORY

# figlet morning!
alias vi='nvim'
alias vim='nvim'
alias ls='ls -Gp'
alias l='ls -l'
alias ll='ls -l'
alias la='ll -A'
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

alias ssh="~/bin/ssh-change-profile.sh"
alias cjob="code ~/dev/jobshot/jobshot-front/ & code ~/dev/jobshot/jobshot-server"

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

# completion
autoload -Uz compinit
compinit

# smart-case
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'


# origin
TERM=xterm-256color
autoload colors
colors
PROMPT="%{$fg[green]%}[%n]%(!.#.$) %{$reset_color%}"
PROMPT2="%{$fg[green]%}%_> %{$reset_color%}"
SPROMPT="%{$fg[red]%}correct: %R -> %r [nyae]? %{$reset_color%}"
RPROMPT="%{$fg[cyan]%}[%~]%{$reset_color%}"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
# Genymotion
export PATH=$PATH:/Applications/Genymotion.app/Contents/MacOS/tools

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/mukuna/.nodebrew/node/v8.11.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/mukuna/.nodebrew/node/v8.11.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh

# iTerm2 language
export LANG="ja_JP.UTF-8"

