# dotfiles
My dotfiles

## Create symbolic links for the configurations.

### MacOS

    ln -s ~/.dotfiles/.zshrc ~/.zshrc
    ln -s ~/.dotfiles/.bash_profile ~/.bash_profile
    ln -s ~/.dotfiles/.vimrc ~/.vimrc
    ln -s ~/.dotfiles/zed ~/.config/zed

### Windows

    mklink .vimrc dotfiles\.vimrc
    mklink /D .\AppData\Roaming\Zed dotfiles\zed
