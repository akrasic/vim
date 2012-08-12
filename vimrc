"
"	vimrc configuration
"

"
" Setup Pathogen
	set nocompatible
	runtime! autoload/pathogen.vim
	silent! call pathogen#helptags()
	silent! call pathogen#runtime_append_all_bundles()

"
" General Setup
	syntax on " syntax highlighting
	scriptencoding utf-8
	set virtualedit=onemore
	set tabstop=4 " PEP-8 uses 4 spaces per indentation level
	set shiftwidth=4 " shifting (PEP-8)
	filetype on " file type detection
	filetype indent on " special indentation rules for file type
	filetype plugin on " auto-completion rules for file type
	set wildmenu
	set wrap
	set foldenable
	"set mouse=a
	set title
	set history=1000
	set laststatus=2
	set lazyredraw	
	set ttyfast
" Searching
	set hls " highlight search terms (:noh to turn off temporarily)
	set ignorecase " ignore case for searches (:set noignorecase to turn off)
	set incsearch " search as you type

" Enable UTF-8
	set bomb
	set fileencoding=utf8
"
" Theme setup
" Enable 256 color term
	set t_Co=256

" Colors available: jellybeans molokai peaksea zenburn solarized
	set scrolloff=15 " keep 15 lines of context on both sides of cursor when scrolling
	"hi cursorline guibg=#333333     " highlight bg color of current line
	"hi CursorColumn guibg=#ffffff   " highlight cursor
"
" Fix broken backspace + enable few other nigty things
	set backspace=2
	set number " Include numbers
	set ruler
	set title
	set visualbell

"
"	Set undo actions
	set backup
	set backupdir=~/.vim/backup

	if v:version >= 703
		set undofile
		set undodir=~/.vim/undo
		set undolevels=1000
		set undoreload=10000

		set colorcolumn=+1
	endif
"
" Configure the statusline
	if has('statusline')
		set statusline=\ [%{getcwd()}]          " current dir

		set statusline+=%#identifier#
		set statusline+=[%t] "tail of the filename
		set statusline+=%*

		"display a warning if fileformat isnt unix
		set statusline+=%#warningmsg#
		set statusline+=%{&ff!='unix'?'['.&ff.']':''}
		set statusline+=%*

		"display a warning if file encoding isnt utf-8
		set statusline+=%#warningmsg#
		set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
		set statusline+=%*

		set statusline+=%h "help file flag
		set statusline+=%y "filetype

		"read only flag
		set statusline+=%#identifier#
		set statusline+=%r
		set statusline+=%*

		"modified flag
		set statusline+=%#identifier#
		set statusline+=%m
		set statusline+=%*

		"display a warning if &et is wrong, or we have mixed-indenting
		set statusline+=%#error#
		set statusline+=%{StatuslineTabWarning()}
		set statusline+=%*

		set statusline+=%{fugitive#statusline()}
		set statusline+=%#error#
		set statusline+=%{&paste?'[paste]':''}
		set statusline+=%*
		set statusline+=%= "left/right separator
		set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
		set statusline+=%c, "cursor column
		set statusline+=%l/%L "cursor line/total lines
		set statusline+=\ %P "percent through file
		set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file
	endif
"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
	let name = synIDattr(synID(line('.'),col('.'),1),'name')
	if name == ''
		return ''
	else
		return '[' . name . ']'
	endif
endfunction


function! StatuslineTabWarning()
	if !exists("b:statusline_tab_warning")
		let b:statusline_tab_warning = ''
		if !&modifiable
			return b:statusline_tab_warning
		endif

	let tabs = search('^\t', 'nw') != 0

	"find spaces that arent used as alignment in the first indent column
	let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

	if tabs && spaces
		let b:statusline_tab_warning = '[mixed-indenting]'
	elseif (spaces && !&et) || (tabs && &et)
		let b:statusline_tab_warning = '[&et]'
		endif
	endif
	return b:statusline_tab_warning
endfunction

	noremap <leader>y "*y
	noremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
	noremap <leader>P :set paste<CR>"*P<CR>:set nopaste<CR>
	vnoremap <leader>y "*ygv

" sessionman plugin - show sessions
	noremap <F4> :SessionOpen<CR>
"
" FuzzyFileFilnder mapping
	noremap <silent> <C-a>     :FufFile<CR>
	noremap <silent> <C-e>		:FufBuffer<CR>
	set pastetoggle=<F3>
	let mapleader = ","
	nnoremap <leader>n :setlocal number!<cr>

" Clean trailing whitespace
	nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
	nnoremap <leader>m :%s///g<cr>
	nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
"
" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

"
" Window Management
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Typos
	command! -bang E e<bang>
	command! -bang Q q<bang>
	command! -bang W w<bang>
	command! -bang QA qa<bang>
	command! -bang Qa qa<bang>
	command! -bang Wa wa<bang>
	command! -bang WA wa<bang>
	command! -bang Wq wq<bang>
	command! -bang WQ wq<bang>
"
" Nerdtree configuration
	map <F2> :NERDTreeToggle<CR>
	let g:NERDTreeDirArrows=0
	"map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
	map <leader>e :NERDTreeFind<CR>
	nmap <leader>nt :NERDTreeFind<CR>

	let NERDTreeShowBookmarks=1
	let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.nfs$']
	let NERDTreeChDirMode=0
	let NERDTreeQuitOnOpen=1
	let NERDTreeShowHidden=1
	let NERDTreeKeepTreeInNewTab=1
"
" buffexp
	let g:miniBufExplMapWindowNavVim = 1
	let g:miniBufExplMapWindowNavArrows = 1
	let g:miniBufExplMapCTabSwitchBufs = 1
	let g:miniBufExplModSelTarget = 1 

" Set Color Scheme  and background
"
	set background=dark
	colorscheme mustang	
