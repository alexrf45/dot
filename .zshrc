setopt extended_glob null_glob

setopt HIST_IGNORE_SPACE  # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS   # Don't save duplicate lines
setopt SHARE_HISTORY      # Share history between sessions
setopt PROMPT_SUBST
unsetopt beep

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


fpath=(/tmp/zsh-completions/src $fpath)

source "$HOME/.miniplug/plugins/miniplug.zsh"

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit


export MINIPLUG_HOME="$HOME/.miniplug/plugins"

miniplug plugin 'zsh-users/zsh-syntax-highlighting'
miniplug plugin 'zsh-users/zsh-autosuggestions'
miniplug plugin 'zsh-users/zsh-completions'
miniplug load


# complete -C "/usr/local/bin/aws_completer" aws

. "$HOME/.cargo/env"

eval "$(fzf --zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#. <(flux completion zsh)

eval "$(starship init zsh)"
