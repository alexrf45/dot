# Function to get the current git branch
function git_branch {
  git rev-parse --abbrev-ref HEAD 2> /dev/null
}
PS1='%F{red}${AWS_VAULT}%f '  # AWS_VAULT in cyan if set
PS1+='[20%D %T] %n@%m %F{blue}%~%f %F{green}$(git_branch)%f 
$ '

# Dollar sign in green

