
vconf - VIM configuration
---------------------------------
Vim configuration containing several plugins and themes for your everyday VIM use. 

*Contains* :  
--------------------
_____________________________________________________
-  NerdTree  [ https://github.com/scrooloose/nerdtree ]
-  Pathogen  [ https://github.com/tpope/vim-pathogen ]
-  Fugitive  [ https://github.com/tpope/vim-fugitive ]

**Update plugins**:  
All plugins are clones GIT repositories for easier    
```
cd ~/.vim/bundle/plugin-name  
git pull
```

Available colors :
--------------------
_______________________________________________________
- Solarized color pack [ http://github.com/altercation/vim-colors-solarized ]
- molokai
- peaksea
- jellybeans
- Zenburn  

Optional color pack is in .vim/colors.optional , simply just copy the color to .vim/colors/ directory and quick preview 
execute inside vim
```
:color newcolor
```  
Change the colorscheme, edit line 37 of the .vimrc file and set:
```
colorscheme newcolor
```



Get it!
--------------------
______________________________

Installation script will automatically backup your current .vim/ directory and .vimrc configuration file to .vim.bak and 
.vimrc.bak and setup the vim and vimrc provided in this package.

**Install vconf**  
Download the package or git clone:  
```bash
clone git@github.com:abikobutch3r/vconf.git  
cd vconf/  
bash bundle.sh install  
```

**Uninstall vconf**  
```
cd vconf/  
bash bundle.sh uninstall
```


Great links
------------------------
__________________________________________  
- Vim commands http://www.tuxfiles.org/linuxhelp/vimcheat.html
- Vim cheat sheet - http://www.viemu.com/vi-vim-cheat-sheet.gif
