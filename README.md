# dotfiles
My dotfiles

## Create symbolic links for the configurations.

### MacOS

    ln -s ~/.dotfiles/.zshrc ~/.zshrc
    ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
    ln -s ~/.dotfiles/.bash_profile ~/.bash_profile
    ln -s ~/.dotfiles/.pip ~/.pip
    ln -s ~/.dotfiles/.vimrc ~/.vimrc
    ln -s ~/.dotfiles/.emacs.d ~/.emacs.d

### Windows

    mklink .vimrc dotfiles\.vimrc
    mklink /D .pip dotfiles\.pip 
    mklink /D .emacs.d dotfiles\.emacs.d\
