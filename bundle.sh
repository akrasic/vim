#!/usr/bin/env bash
#	
#	Bundle installation for vconf
VERSION="0.2"
if [ $# -lt 1 ]; then
	echo -e "vConf $VERSION installer"
	echo -e "Usage: ./bundle.sh install | uninstall | pluginup "
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
			ln -s $PWD/vimrb ~/.vim

			echo -e "[*] Getting vundle installed"
			git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

			echoi -e "READY!! Fire up vim and run :BundleInstall"

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
	;;
	pluginup)
		echo "vconf $VERSION manager"
		echo "[*] Starting plugin update"
		find ~/.vim/bundle/ -maxdepth 2 -type d -name .git | sed 's/.git$//g' | while read i;
			do echo -e "\t|-[*] Updating: $i"; cd $i; git pull;
		 done

	;;

esac
