#!/bin/bash
function ask()
{
    while true; do
        read -p "$2" choice
        case $choice in
            [Yy]* )
                declare -g "$1=true"
                break;
                ;;
            [Nn]* )
                declare -g "$1=false"
                break;
                ;;
            *)
                echo "Please enter y or n"
                ;;
        esac
    done
}

ask ZSH "Install ZSH environment? (y/n):"
ask USEFUL "Install Useful stuff (tmux and google chrome)? (y/n):"
ask RC "Overwrite rc files? (y/n):"
ask CTF "Install CTF environment? (y/n):"


if $USEFUL; then
    echo "USEFUL"
    chmod +x useful.sh
    ./useful.sh
fi

if $RC; then
    echo "RC"
    # Copy rc file
    sudo apt-get install -y vim
    cp ./dotfiles/gitconfig ~/.gitconfig
    cp ./dotfiles/tmux.conf ~/.tmux.conf
    cp ./dotfiles/vimrc ~/.vimrc
    cp ./dotfiles/bashrc ~/.bashrc
    cp ./dotfiles/pythonrc ~/.pythonrc
    cp ./dotfiles/screenrc ~/.screenrc
    cp ./dotfiles/zshrc ~/.zshrc

    # Install vim plugins
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
fi

if $CTF; then
    echo "CTF"
    chmod +x ctf_tools.sh
    ./ctf_tools.sh
fi

if $ZSH; then
    sudo apt-get -y install zsh
    sudo apt-get -y install fortune cowsay
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    chsh -s $(which zsh)
    
    # Give me colors
    wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O $HOME/.dircolors
    echo 'eval $(dircolors -b $HOME/.dircolors)' >> $HOME/.zshrc
fi

