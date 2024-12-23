#!/bin/bash

echo "UPGRADE"
# Update everything
echo "Appending apt sources !"
echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get -y upgrade

sudo apt-get install -y tmux tree
# Install google-chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
sudo apt-get install -y google-chrome-stable

# Install C helpers
sudo apt-get install -y cscope exuberant-ctags cflow splint

# Install nodejs && npm
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install nodejs

# Install general stuff
sudo apt-get install -y socat
sudo apt-get install -y samba smbclient cifs-utils
sudo apt-get install -y sharutils uuencode
sudo apt-get install -y virtualenv

echo "POWERLINE"
# Install pip
sudo apt-get install -y python-dev
sudo apt-get install -y python-setuptools
sudo apt-get install -y easy_install
sudo easy_install pip
# Install powerline
sudo pip install powerline-status

# virtualenv
pip install virtualenv      # Not installed already?
pip install virtualenvwrapper
export WORKON_HOME=~/Envs
mkdir -p $WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh
mkdir -p ~/tools

# Install git complete
sudo apt-get install -y git bash-completion
# Install Fonts
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts/
mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts/
mkdir -p ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

# Install sh for python, speed matters -> sh.ifconfig("eth0")
pip install sh
