#!/usr/bin/env bash
#
#	Bundle installation for vconf
VERSION="0.2"
if [ $# -lt 1 ]; then
	echo -e "vConf $VERSION installer"
	echo -e "Usage: ./bundle.sh install | uninstall "
	exit 0;
fi

case "$1" in
	install)
			echo -e "vconf $VERSION managere\n"
			echo -e "[*] Starting the installation"

			which git >/dev/null 2>&1
			if [ "$?" -gt "0" ]; then
				echo "Error: Git is needed,please install it"
				exit 1
			fi

			if [ -f "~/.vimrc" ]; then
				echo -e "[*] Found existing .vimrc - moving to ~/.vimrc.bak"
				mv ~/.vimrc ~/.vimrc.bak
			fi
			if [ -d "~/.vim/" ]; then
			echo -e "[*] Found existing .vim directory - moving to ~/.vim.bak"
			mv ~/.vim/ ~/.vim.bak/
			fi

			echo -e "[*] Linking $PWD/vim/ directory to home"
			ln -s $PWD/vim ~/.vim

			echo -e "[*] Linking $PWD/.vimrc file to home"
			ln -s $PWD/vimrc ~/.vimrc

			echo -e "[*] Getting vundle installed"
			if [ ! -d "~/.vim/bundle/" ]; then
				mkdir ~/.vim/bundle/
			fi
			git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

			which ruby > /dev/null 2>&1

			if [ "$?" -eq "0" ]; then
				gem install rubocop
			else
				echo "Ruby not detected on this system, rubocop gem not installed"
			fi

			echo -e "Starting Vim and installing bundles"
			vim -c ":BundleInstall"

	;;

	uninstall)
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
esac
