setopt extended_glob null_glob


#history config
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
HIST_STAMPS="mm/dd/yyyy"

setopt extended_glob null_glob
#enable prompt output
setopt PROMPT_SUBST

setopt HIST_IGNORE_SPACE  # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS   # Don't save duplicate lines
setopt SHARE_HISTORY      # Share history between sessions

#turn off beep
unsetopt beep


#source aliases and env
source "$HOME/.zprofile"

for file in $HOME/.zsh/*; do
    source "$file"
done

fpath=(/tmp/zsh-completions/src $fpath)

source "$HOME/.miniplug/plugins/miniplug.zsh"

export MINIPLUG_HOME="$HOME/.miniplug/plugins"

miniplug plugin 'zsh-users/zsh-autosuggestions'
miniplug plugin 'zsh-users/zsh-syntax-highlighting'
miniplug plugin 'zsh-users/zsh-completions'
miniplug load

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit


# eval $(ssh-agent -s) &> /dev/null
# ssh-add ~/.ssh/id_ed25519 >/dev/null 2>&1
# ssh-add ~/.ssh/fr3d >/dev/null 2>&1
# ssh-add ~/.ssh/vps >/dev/null 2>&1


#persistant ssh agent
complete -C '/usr/local/bin/aws_completer' aws

. "$HOME/.cargo/env"


eval "$(fzf --zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


eval "$(starship init zsh)"
