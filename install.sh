#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

cd "$(dirname $0)"
OVERWRITE="${1:-true}"

if echo "$OSTYPE" | grep -E '^darwin'; then
    IS_MACOS="true"
fi

downloadFonts() {
    if [ -z $TMPDIR ]; then
        TMPDIR=/tmp
    fi

    local DOWNLOAD_TO="$TMPDIR/dotfiles-fonts"

    if [ "$IS_MACOS" = "true" ]; then
        local FONT_FOLDER="$HOME/Library/Fonts"
    else
        local FONT_FOLDER="$HOME/.local/share/fonts"
    fi

    mkdir -p "$FONT_FOLDER" "$DOWNLOAD_TO"
    curl -sSL https://github.com/microsoft/cascadia-code/releases/download/v2009.22/CascadiaCode-2009.22.zip -o "$DOWNLOAD_TO/cascadia.zip"
    unzip -o "$DOWNLOAD_TO/cascadia.zip" -d "$DOWNLOAD_TO/cascadia"
    mv -f "$DOWNLOAD_TO/cascadia/ttf/"*.ttf "$FONT_FOLDER/"
    rm -rf "$DOWNLOAD_TO"
    curl -sSL https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -o "$FONT_FOLDER/MesloLGS NF Regular.ttf"
    curl -sSL https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -o "$FONT_FOLDER/MesloLGS NF Bold.ttf"
    curl -sSL https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -o "$FONT_FOLDER/MesloLGS NF Italic.ttf"
    curl -sSL https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -o "$FONT_FOLDER/MesloLGS NF Bold Italic.ttf"
}

if [ "$IS_MACOS" = "true" ]; then
    downloadFonts
else
    # Install curl, tar, git, other dependencies if missing
    PACKAGES_NEEDED="\
        ca-certificates \
        curl \
        fuse \
        libfuse2 \
        fzf \
        npm \
        ripgrep \
        socat \
        universal-ctags \
        unzip \
        zip \
        zsh"

    if ! dpkg -s ${PACKAGES_NEEDED} > /dev/null 2>&1; then
        if [ ! -d "/var/lib/apt/lists" ] || [ "$(ls /var/lib/apt/lists/ | wc -l)" = "0" ]; then
            sudo apt-get update
        fi
        sudo apt-get -y -q install ${PACKAGES_NEEDED}
    fi

    if ! type git > /dev/null 2>&1; then
        sudo apt-get -y -q git
    fi

    # Fonts
    if dpkg -s "fontconfig" > /dev/null 2>&1; then
        downloadFonts
        fc-cache -f -v
    fi

    sudo apt-get clean
fi

# Oh My Zsh!
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
if [ ! -e "$HOME/.zshrc" ] || [ "${OVERWRITE}" = "true" ]; then
    rm -f  "$HOME/.zshrc"
    ln -s "$(pwd)/zshrc" "$HOME/.zshrc"
fi
if [ ! -e "$HOME/.bashrc" ] || [ "${OVERWRITE}" = "true" ]; then
    rm -f  "$HOME/.bashrc"
    ln -s "$(pwd)/bashrc" "$HOME/.bashrc"
fi
if [ ! -e "$HOME/.config/nvim" ] || [ "${OVERWRITE}" = "true" ]; then
    rm -rf  "$HOME/.config/nvim"
    ln -s "$(pwd)/config/nvim" "$HOME/.config/nvim"
fi

# Git config
if [ ! -e "$HOME/.gitignore_global" ] || [ "${OVERWRITE}" = "true" ]; then
    rm -rf  "$HOME/.gitignore_global"
    ln -s "$(pwd)/gitignore_global" "$HOME/.gitignore_global"
    git config --global core.excludesfile "$HOME/.gitignore_global"
fi
git config pull.rebase false

# powerline 10k
P110K_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
if [ ! -d "$P110K_DIR" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P110K_DIR"
fi
if [ ! -e "$HOME/.p10k.zsh" ] || [ "${OVERWRITE}" = "true" ]; then
    rm -f  "$HOME/.p10k.zsh"
    ln -s "$(pwd)/.p10k.zsh" $HOME
fi

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install nodejs if < 12
install-node() {
  echo "Installing node..."
  curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  sudo apt-get install -y nodejs
}

if [[ `which node` ]]
then
  regex="^v([^.]*)"
  node_version=`node -v`
  echo "Found node version $node_version."
  if [[ $node_version =~ $regex ]]
  then
    version="${BASH_REMATCH[1]}"
    version_int=$(($version))
    if [[ $version_int -lt 12 ]]
    then
      install-node
    fi
  fi
else
  echo "Node.js not found."
  install-node
fi

# vim
# install latest neovim (nightly failing as of 9/22/21)
# wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
sudo modprobe fuse
sudo groupadd fuse
sudo usermod -a -G fuse "$(whoami)"
wget https://github.com/github/copilot.vim/releases/download/neovim-nightlies/appimage.zip
unzip appimage.zip
sudo chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

gem install neovim
npm install -g neovim
pip3 install --user neovim

nvim +'PlugInstall --sync' +qa

sudo chsh -s "$(which zsh)" "$(whoami)"
