# man() {
#   env LESS_TERMCAP_mb=$'\E[01;31m' \
#     LESS_TERMCAP_md=$'\E[01;38;5;74m' \
#     LESS_TERMCAP_me=$'\E[0m' \
#     LESS_TERMCAP_se=$'\E[0m' \
#     LESS_TERMCAP_so=$'\E[01;33;03;40m' \
#     LESS_TERMCAP_ue=$'\E[0m' \
#     LESS_TERMCAP_us=$'\E[04;38;5;146m' \
#     man "$@"
# }

extract() {
  if [ -f $1 ]; then
    case $1 in
    *.tar.bz2) tar xjf $1 ;;
    *.tar.gz) tar xzf $1 ;;
    *.bz2) bunzip2 $1 ;;
    *.rar) rar x $1 ;;
    *.gz) gunzip $1 ;;
    *.tar) tar xf $1 ;;
    *.tbz2) tar xjf $1 ;;
    *.tgz) tar xzf $1 ;;
    *.zip) unzip $1 ;;
    *.Z) uncompress $1 ;;
    *.7z) uncompress $1 ;;
    *.apk) uncompress $1 ;;
    *.bz2) uncompress $1 ;;
    *.tar.gz) uncompress $1 ;;
    *.tar.lz) uncompress $1 ;;
    *.war) uncompress $1 ;;
    *.xz) xz -d -v $1 ;;
    *) echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

up() {
  for i in $(seq 1 $1); do
    cd ../
  done
}

virtual_env() {
  mkdir $1 &&
    cd $1 &&
    virtualenv .venv &&
    source .venv/bin/activate
}

aws_cli() {
  docker run --rm \
    -it \
    -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
    -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
    cgr.dev/chainguard/aws-cli:latest $*
}

s3-file-size() {
  aws s3 ls --summarize \
    --human-readable \
    --recursive $1 | tail -2
}

arch-mirror() {
  export TMPFILE="$(mktemp)"
  sudo true
  rate-mirrors --save=$TMPFILE arch --max-delay=21600 &&
    sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup &&
    sudo mv $TMPFILE /etc/pacman.d/mirrorlist &&
    ua-drop-caches &&
    yay -Syyu --noconfirm

}

timestamp() {
  date +%Y%m%d-%T
}

git-new() {
  [ -d "$1" ] || mkdir "$1" &&
    cd "$1" &&
    git init &&
    touch .gitignore &&
    git add .gitignore &&
    git commit -m "Add .gitignore."
}

web-server() {
  miniserve \
    -t "fr3d" \
    -v \
    -F \
    -H \
    -c monokai \
    -p 8001 \
    --header "Cache-Control:no-cache" \
    --auth-file ~/home-lab/auth.txt \
    --tls-cert $HOME/.local/dev-cert.pem \
    --tls-key $HOME/.local/dev-key.pem \
    -u
}

cert-gen() {
  mkcert -key-file $HOME/.local/$1-key.pem -cert-file $HOME/.local/$1-cert.pem localhost
}

dockershellhere() {
  dirname=${PWD##*/}
  docker run --rm -it --net=host --entrypoint=/bin/bash -v $(pwd):/${dirname} -w /${dirname} debian:latest
}

encrypt_age() {
  age \
    --passphrase \
    --output $1.enc \
    $2

}

decrypt_age() {
  age -d \
    $1 >$2
}

mkcd() {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}
