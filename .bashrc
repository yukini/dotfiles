# export HOMEBREW_GITHUB_API_TOKEN=a8a47ca0ee1480d1055c5e530f544af25dbddf08
# export HOMEBREW_CASK_OPTS='--caskroom=/opt/homebrew-cask/Caskroom'

figlet morning!
alias ls='ls -Gp'
alias ll='ls -l'
alias la='ll -a'

#
echo $'\e[31m*  \e[32m*  \e[33m*  \e[34m*  \e[35m* \e[36m    user-name command to be executed \e[m'
echo $'\e[31m|  \e[32m|  \e[33m|  \e[34m|  \e[35m| \e[36m                                     \e[m'
echo $'\e[31m|  \e[32m|  \e[33m|  \e[34m|  \e[35m.---- day of week (0 - 6) (Sunday=0 or 7)    \e[m'
echo $'\e[31m|  \e[32m|  \e[33m|  \e[34m.------- month (1 - 12)                               \e[m'
echo $'\e[31m|  \e[32m|  \e[33m.---------- day of month (1 - 31)                              \e[m'
echo $'\e[31m|  \e[32m.------------- hour (0 - 23)                                            \e[m'
echo $'\e[31m.---------------- minute (0 - 59)                                                \e[m'
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
. "$HOME/.cargo/env"

source /Users/yukini/.config/broot/launcher/bash/br

export KALEIDOSCOPE_DIR=/Users/yukini/playground/keyboard/Kaleidoscope

