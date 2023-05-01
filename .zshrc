set completion-ignore-case on

# history
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
setopt EXTENDED_HISTORY

# figlet morning!
alias vi='nvim'
alias vim='nvim'
alias ls='ls -Gp'
alias l='ls -lF'
alias ll='ls -lF'
alias la='ll -AF'

alias rm="rm -i"

# Go lang
if [ -x "`which go`" ]; then
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin
fi

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

# iTerm2 language
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# autojump
[ -f $(brew --prefix)/etc/profile.d/autojump.sh ] && . $(brew --prefix)/etc/profile.d/autojump.sh
export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"


# zsh completion
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
