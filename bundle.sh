#!/usr/bin/env bash
#	
#	Bundle installation for vconf
VERSION="0."
if [ $# -lt 1 ]; then
	echo -e "vConf $VERSION installer"
	echo -e "Usage: ./bundle.sh install | uninstall | pluginup "
	exit 0;
fi

case "$1" in
	install)
			echo -e "vconf $VERSION managere\n"
			echo -e "[*] Starting the installation"
			
			if [ -f "~/.vimrc" ]; then 
				echo -e "[*] Found existing .vimrc - moving to ~/.vimrc.bak"
				mv ~/.vimrc ~/.vimrc.bak
			fi
			if [ -d "~/.vim/" ]; then
			echo -e "[*] Found existing .vim directory - moving to ~/.vim.bak"
			mv ~/.vim/ ~/.vim.bak/
			fi

			echo -e "[*] Start moving .vim/ directory"
			mv ./vim/ ~/.vim/

			echo -e "[*] Start moving .vimrc file"
			mv ./vimrc ~/.vimrc
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
