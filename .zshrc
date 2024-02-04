source ~/.zplug/init.zsh

zplug "zplug/zplug", hook-build:'zplug --self-manage'


# zplug "plugins/git",   from:oh-my-zsh

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", as:plugin, defer:2
zplug "zsh-users/zsh-autosuggestions", as:plugin, defer:2
zplug "zsh-users/zsh-completions"

zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

zplug "chrissicool/zsh-256color"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load


#################################
#  others
#################################

set completion-ignore-case on
# smart-case
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

#################################
#  Prompt
#################################
PURE_PROMPT_SYMBOL="%B%F{1}❯%F{3}❯%F{2}❯%f%b"

#################################
#  History
#################################
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
setopt EXTENDED_HISTORY

#################################
#  Aliases
#################################
alias vi='nvim'
alias vim='nvim'
alias ls='ls -Gp'
alias l='ls -lF'
alias ll='ls -lF'
alias la='ll -AF'
alias rm="rm -i"
alias cp="cp -i"

# Go lang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# iTerm2 language
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# zsh completion
if type brew &>/dev/null
then
  # FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  fpath+=("$(brew --prefix)/share/zsh/site-functions")

  autoload -Uz compinit
  compinit
fi

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# tmux shortcut
function ide () {
	if [ "$1" = "3" ]
	then
		tmux split-window -v -p 30
		tmux split-window -h -p 66
		tmux split-window -h -p 50
	else
		tmux split-window -v -p 30
		tmux split-window -h -p 50
	fi
}

export PATH="/opt/homebrew/sbin:$PATH"

eval "$(zoxide init zsh)"

# Add the following line to your ~/.bash_profile or ~/.zshrc file:
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

bindkey -e

export KALEIDOSCOPE_DIR=/Users/yukini/playground/keyboard/Kaleidoscope
