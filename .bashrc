shopt -s histappend
shopt -s checkwinsize
HISTFILE="$HOME/.history"
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth
HISTTIMEFORMAT='%Y-%m-%d %T - '

force_color_prompt=yes

source "$HOME/.profile"

for file in $HOME/.bash/*; do
  source "$file"
done

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

PROMPT_COMMAND='PS1_CMD1=$(git branch 2>/dev/null | grep '"'"'*'"'"' | colrm 1 2)'
PS1='\[\e[93;2;3m\]${AWS_VAULT}\[\e[0m\] \n\[\e[92;1m\]${PS1_CMD1}\[\e[0m\] \[\e[95m\]\W\[\e[0m\] → '

complete -C '/usr/local/bin/aws_completer' aws

eval $(ssh-agent) >/dev/null 2>&1

ssh-add ~/.ssh/lab >/dev/null 2>&1
ssh-add ~/.ssh/home >/dev/null 2>&1
ssh-add ~/.ssh/fr3d >/dev/null 2>&1
ssh-add ~/.ssh/vps >/dev/null 2>&1

. "$HOME/.cargo/env"

eval "$(fzf --bash)"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#eval "$(starship init bash)"
