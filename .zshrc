#################################
# Plugin Manager (zplugの初期化とロード)
#################################
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

zplug "greymd/docker-zsh-completion"

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
# Zsh System Configurations (補完・履歴・キーバインド等)
#################################
# zsh completion
if type brew &>/dev/null
then
  fpath+=("$(brew --prefix)/share/zsh/site-functions")

  autoload -Uz compinit
  compinit
fi

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
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt SHARE_HISTORY

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
alias k="kubectl"

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

eval "$(zoxide init zsh --cmd j)"

bindkey -e

source <(fzf --zsh)

