#!/usr/bin/env bash
#
#	Bundle installation for vconf
VERSION="0.3"
if [ $# -lt 1 ]; then
	echo -e "vConf $VERSION installer"
	echo -e "Usage: ./bundle.sh install | uninstall "
	exit 0;
fi

# Public - Install vim from this bundle
function install_vim() {
  echo -e "vconf $VERSION manager\n"
  echo -e "[*] Starting the installation"

  # Check if git is installed
  if which git >/dev/null 2>&1 ; then
    echo "[*] Git is installed, proceeding"
  else
    echo "Error: Git is needed,please install it"
    exit 1
  fi

  if [ -L "$HOME/.vimrc" ]; then
    rm -f $HOME/.vimrc
  fi
  if [ -f "~/.vimrc" ]; then
    echo -e "[*] Found existing .vimrc - moving to ~/.vimrc.bak"
    mv ~/.vimrc ~/.vimrc.bak
  fi

  if [ -L "$HOME/.vim" ]; then
    rm -f $HOME/.vim
  fi
  if [ -d "$HOME/.vim/" ]; then
    echo -e "[*] Found existing .vim directory - moving to ~/.vim.bak"
    mv ~/.vim/ ~/.vim.bak/
  fi

  echo -e "[*] Linking $PWD/vim/ directory to home"
  ln -s $PWD/vim ~/.vim

  echo -e "[*] Creating directories for backup, undo and swap"

  if [ ! -d "~/.vim/backup/" ]; then
    mkdir ~/.vim/backup
  fi

  if [ ! -d "~/.vim/undo/" ]; then
    mkdir ~/.vim/undo
  fi

  if [ ! -d "~/.vim/_swap/" ]; then
    mkdir ~/.vim/_swap/
  fi


  echo -e "[*] Linking $PWD/.vimrc file to home"
  ln -s $PWD/vimrc ~/.vimrc

  echo -e "[*] Getting vundle installed"
  if [ ! -d "~/.vim/bundle/" ]; then
    mkdir ~/.vim/bundle/
  fi
  git clone https://github.com/VundleVim/Vundle.vim.git \
    ~/.vim/bundle/Vundle.vim > /dev/null 2>&1

  if which ruby > /dev/null 2>&1; then
    gem install rubocop --no-ri --no-rdoc
  else
    echo "Ruby not detected on this system, rubocop gem not installed"
  fi

  echo -e "Starting Vim and installing bundles"
  vim +BundleInstall +qall


}

function uninstall_vim() {

  echo -e "vconf $VERSION manager"
  echo -e "[*] Uninstallation started"

  if [ -f "~/.vimrc.old" ]; then
    echo -e "[*] Moving back old .vimrc"
    rm -f ~/.vimrc
    mv ~/.vimrc.bak ~/.vimrc
    OLD=1
  fi
  if [ -d "~/.vim/" ]; then
    echo -e "[*] Moving back old .vim directory"
    rm -rf ~/.vim/
    mv ~/.vim.bak ~/.vim
    OLD=1
  fi

  if [ "$OLD" == "1" ]; then
    echo -e "Removing .vim and .vimrc "
    rm -rf ~/.vim/ ~/.vimrc
  fi
}

case "$1" in
  install)
    install_vim
    ;;

  uninstall)
    uninstall_vim
    ;;
esac
