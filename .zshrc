# export HOMEBREW_GITHUB_API_TOKEN=a8a47ca0ee1480d1055c5e530f544af25dbddf08
# export HOMEBREW_CASK_OPTS='--caskroom=/opt/homebrew-cask/Caskroom'
# export PATH=$PATH:/usr/bin
export PATH=$PATH:/Users/yukini/.local/bin

# 大文字、小文字
set completion-ignore-case on

RPROMPT='[%F{green}%d%f]'


######################################################
figlet morning!
alias ls='ls -Gp'
alias ll='ls -l'
alias la='ll -A'

#
echo $'\e[31m*  \e[32m*  \e[33m*  \e[34m*  \e[35m* \e[36m    user-name command to be executed \e[m'
echo $'\e[31m|  \e[32m|  \e[33m|  \e[34m|  \e[35m| \e[36m                                     \e[m'
echo $'\e[31m|  \e[32m|  \e[33m|  \e[34m|  \e[35m.---- day of week (0 - 6) (Sunday=0 or 7)    \e[m'
echo $'\e[31m|  \e[32m|  \e[33m|  \e[34m.------- month (1 - 12)                               \e[m'
echo $'\e[31m|  \e[32m|  \e[33m.---------- day of month (1 - 31)                              \e[m'
echo $'\e[31m|  \e[32m.------------- hour (0 - 23)                                            \e[m'
echo $'\e[31m.---------------- minute (0 - 59)                                                \e[m'
######################################################
