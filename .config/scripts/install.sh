#!/bin/bash

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install -y tmux zsh terminator rofi i3 i3blocks i3status lxappearance python3-pip picom papirus-icon-theme imagemagick 

sudo apt-get install -y fonts-roboto man-db vim-gtk3 flameshot thunar docker.io docker-compose neovim pass fonts-jetbrains-mono

sudo apt-get install -y burpsuite flameshot

wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install terraform

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \ 
    && unzip awscliv2.zip && \
    sudo ./aws/install && \
    rm -r aws/ && rm awscliv2.zip

sudo wget https://github.com/99designs/aws-vault/releases/download/v6.6.1/aws-vault-linux-amd64 -O /usr/local/bin/aws-vault && \
	sudo chown $USER:$USER /usr/local/bin/aws-vault && \
	chmod +x /usr/local/bin/aws-vault


sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir -p ~/.local/share/fonts/

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Iosevka.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/RobotoMono.zip

unzip Iosevka.zip -d ~/.local/share/fonts/
unzip RobotoMono.zip -d ~/.local/share/fonts/

curl -sS https://starship.rs/install.sh | sh

cp -r i3/ ~/.config/i3

cp -r scripts ~/.config/scripts

cp -r git ~/.config/git

cp -r openvpn ~/.config/openvpn

cp -r pictures ~/.config/.

cp -r starship.toml ~/.config/.

cp -r aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh

cp picom.conf ~/.config/picom.conf

cp .ops_zshrc ~/.zshrc && cp .ops_zshrc ~/.zprofile && cp .ops_zshrc ~/.zlogin


