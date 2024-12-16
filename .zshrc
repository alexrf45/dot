#oh-my-zsh
#export ZSH="$HOME/.oh-my-zsh"
#ZSH_THEME="robbyrussell"
#zstyle ':omz:update' mode auto      # update automatically without asking
#zstyle ':omz:update' frequency 13
#ENABLE_CORRECTION="true"
#DISABLE_UNTRACKED_FILES_DIRTY="true"

#history config
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
HIST_STAMPS="mm/dd/yyyy"

#source aliases and env
source "$HOME/.zprofile"

for file in $HOME/.zsh/*; do
    source "$file"
done


#plugins
# plugins=(
#   colorize
#   python
#   ssh
#   themes
#   tmux
# )

#source $ZSH/oh-my-zsh.sh

fpath=(/tmp/zsh-completions/src $fp)

eval $(ssh-agent -s) &> /dev/null
ssh-add ~/.ssh/lab >/dev/null 2>&1
ssh-add ~/.ssh/home >/dev/null 2>&1
ssh-add ~/.ssh/dev >/dev/null 2>&1
ssh-add ~/.ssh/vps >/dev/null 2>&1


#persistant ssh agent
complete -C '/usr/local/bin/aws_completer' aws

. "$HOME/.cargo/env"

eval "$(fzf --zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"
