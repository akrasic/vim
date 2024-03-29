"
" vimrc configuration
"

"" Setup vundle
"" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle
call plug#begin('~/.vim/plugged')
set shell=bash
Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'jacoborus/tender'
Plug 'morhetz/gruvbox'
Plug 'KeitaNakamura/neodark.vim'
Plug 'dag/vim-fish'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'ekalinin/Dockerfile.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'elzr/vim-json'
Plug 'chr4/nginx.vim'
Plug 'vim-python/python-syntax'
Plug 'vim-scripts/indentpython.vim'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim'



call plug#end()

  set nocompatible
"
" General Setup
  syntax on " syntax highlighting
  scriptencoding utf-8
  set fileencoding=utf8
  set virtualedit=onemore
  filetype indent plugin on " file type detection
  set wildmenu
  set wrap
  set title
  set number " Include numbers
  set ruler
  set visualbell
  set hidden
  set spell
"
" Fix broken backspace + enable few other nigty things
  set backspace=2

" Default stuff
  set tabstop=2 " PEP-8 uses 4 spaces per indentation level
  set shiftwidth=2 " shifting (PEP-8)
	set softtabstop=2
	set expandtab

"
" Set text width to 80 characters and highlight characters that are over 80
" chars
   set textwidth=80
  set colorcolumn=+1
   match ErrorMsg '\%>80v.\+'

  set mouse=a
  set history=1000
  set laststatus=2
  set lazyredraw
  set ttyfast
  set virtualedit=onemore " allow for cursor beyond last character
  set scrolloff=20 " keep 20 lines of context on both sides

  " Allow Vim to use external clipboard
  " vim needs +clipboard and +xterm_clipboard installed. For ArchLinux install
  " gvim package.
  set clipboard^=unnamedplus,unnamed

"
" Searching
  set hls " highlight search terms (:noh to turn off temporarily)
  set ignorecase " ignore case for searches (:set noignorecase to turn off)
  set incsearch " search as you type

"
" Theme setup
" Enable 256 color term
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  set t_Co=256
  if (has("termguicolors"))
   set termguicolors
  endif
   "disable Background Color Erase
  set t_ut=
  set background=dark
  " colorscheme Monokai
  colorscheme onedark
"
" Set the backup and undo directories
  set backup
  set backupdir=~/.vim/backup

" swap files (.swp) in a common location
" // means use the file's full path
  set dir=~/.vim/_swap//

"
" Set undo file location
  set undofile
  set undodir=~/.vim/undo
  set undolevels=1000
  set undoreload=10000

  let mapleader = ","
  norema <silent><leader>r :source $MYVIMRC

  noremap <leader>y "*y
  noremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
  noremap <leader>P :set paste<CR>"*P<CR>:set nopaste<CR>
  set pastetoggle=<F3>

" sessionman plugin - show sessions
  noremap <F4> :SessionOpen<CR>
"
" FuzzyFileFilnder mapping
  noremap <leader>a  :Files<CR>
  noremap <silent><leader>e  :Buffer <CR>
  "noremap <silent> <C-a>     :Files<CR>
  "noremap <silent> <C-e>    :Buffer<CR>
  nnoremap <leader>n :setlocal number!<cr>

" Remove whitespace on specific filetypes
  " autocmd FileType sh,php,ruby,python autocmd BufWritePre <buffer> :%s/\s\+$//e
  " au BufRead,BufNewFile *.rb,*.sh,*.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


  nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
  nnoremap <leader>m :%s///g<cr>
  nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
  nnoremap <leader>l :NERDTreeToggle<CR>

" Git maps using Fugitive
  nnoremap <leader>gs :Git status<CR><C-w>t<C-w>K<C-w>20+
  nnoremap <leader>gw :Gwrite<CR>
	nnoremap <leader>gq :q<CR>
	nnoremap <leader>gp :Git push origin
	nnoremap <leader>gc :Git commit -m

" Session Management
  set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
  nmap <leader>sl :SessionList<CR>
  nmap <leader>ss :SessionSave<CR>

"
" Folding
  nmap <leader>f za

"
" Disable arrow keys
  nnoremap j gj
  nnoremap k gk

"
" Window Management
  nnoremap <leader>w <C-w>v<C-w>l
  nnoremap <leader>x <C-w>s<C-w>j
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

"
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

  let g:fzf_layout = { 'down': '~40%' }

	" [Buffers] Jump to the existing window if possible
	" let g:fzf_buffers_jump = 1

	" [[B]Commits] Customize the options used by 'git log':
	let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'


" Nerdtree configuration
"  map <F2> :NERDTreeToggle<CR>
"  let g:NERDTreeDirArrows=0
"  map <leader>e :NERDTreeFind<CR>
"  nmap <leader>nt :NERDTreeFind<CR>

  " let NERDTreeShowBookmarks=1
  let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr','\.nfs$']
  let NERDTreeChDirMode=0
  let NERDTreeQuitOnOpen=1
  let NERDTreeShowHidden=1
  " let NERDTreeKeepTreeInNewTab=1
  let NERDTreeMinimalUI = 1



  " Lightline configuration
  set noshowmode
  let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

  function! LightLineFugitive()
    if exists("*fugitive#head")
      let _ = fugitive#head()
      return strlen(_) ? ' '._ : ''
    endif
    return ''
  endfunction

  let g:ale_sign_error = '>>'
  let g:ale_sign_warning = '--'
  let g:python_highlight_all = 1

