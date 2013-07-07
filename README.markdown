
vconf - VIM configuration
---------------------------------
Vim configuration containing several plugins and themes for your everyday VIM use.

*Contains* :
--------------------
_____________________________________________________
-  NerdTree  [ https://github.com/scrooloose/nerdtree ]
-  Fugitive  [ https://github.com/tpope/vim-fugitive ]
- FuzzyFinder
- L9
- Vundle
- Airline
- Syntastic ( use rubocop gem for syntax checks )

**Update plugins**:
Plugins are managed trough the Vundle plugin to update it just run in your vim
```
:BundleUpdate
```

**Optional**
- Powerline fonts from https://github.com/akrasic/powerline-fonts
Get advantage of the super awesum synbols in your editor
Available colors :
--------------------
_______________________________________________________
- Solarized color pack [ http://github.com/altercation/vim-colors-solarized ]
- Monokai _default_
- molokai
- peaksea
- jellybeans
- Zenburn


Optional colorschemes are thrown out to reduce the filesize. They are still available via
https://github.com/flazz/vim-colorschemes


Keybindings
----------------------
**Window management**
```
leader + w - split and focus on the new vertical window
leader + x - split and focus on the new horizontal window
<C-w> + w  - Jump to next window
<C-w> + h  - Jump left window
<C-w> + j - Jump to window below
<C-w> + k - Jump to window up
<C-w> + l - Jump to window right
```

**Session Management**
```
<leader>sl - List sessions
<leader>ss - Save session
```

**Fuzzy plugin**
```
<C-a> - Fuzzy File Search
<C-e> - Fuzzy Buffer Search
```

**NerdTree**
```
<leader>l | <F2> - NERDTree toggle
<leader>e - NERDTree Find
```
Get it!
--------------------
______________________________

Installation script will automatically backup your current .vim/ directory and .vimrc configuration file to .vim.bak and
.vimrc.bak and setup the vim and vimrc provided in this package.

**Install vconf**
Download the package or git clone:
```bash
clone git@bitbucket.org:asoantun/vim.git
cd vim/
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
