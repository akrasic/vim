"
" vimrc configuration
"

"" Setup vundle
"" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'tpope/vim-fugitive'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-haml'

"" Bundle 'Valloric/YouCompleteMe'
"
" Setup Pathogen
  set nocompatible

"
" General Setup
  syntax on " syntax highlighting
  scriptencoding utf-8
  set virtualedit=onemore
  filetype on " file type detection
  filetype indent on " special indentation rules for file type
  filetype plugin on " auto-completion rules for file type
  set wildmenu
  set wrap

"
" Default stuff
  set tabstop=2 " PEP-8 uses 4 spaces per indentation level
  set shiftwidth=2 " shifting (PEP-8)

"
" Load custom settings for each filetype
  autocmd FileType sh source ~/.vim/scripts/ruby.vim
  autocmd FileType ruby source ~/.vim/scripts/ruby.vim
  autocmd FileType python source ~/.vim/scripts/python.vim

"
" Setup folding
" Fun video: http://smartic.us/2009/04/06/code-folding-in-vim/
  set foldmethod=indent  " Fold based on indent
  set foldnestmax=10        " Fold max 10 levels
  set nofoldenable          " Don't fold by default
  set foldlevel=1


  set mouse=a
  set title
  set history=1000
  set laststatus=2
  set lazyredraw
  set ttyfast
  set virtualedit=onemore " allow for cursor beyond last character

"
" Searching
  set hls " highlight search terms (:noh to turn off temporarily)
  set ignorecase " ignore case for searches (:set noignorecase to turn off)
  set incsearch " search as you type

"
" Enable UTF-8
  set fileencoding=utf8

"
" Theme setup
" Enable 256 color term
  set t_Co=256
  set background=dark
  colorscheme Monokai
  set scrolloff=15 " keep 15 lines of context on both sides

"
" Fix broken backspace + enable few other nigty things
  set backspace=2
  set number " Include numbers
  set ruler
  set title
  set visualbell

"
" Set undo actions
  set backup
  set backupdir=~/.vim/backup

  if v:version >= 703
    set undofile
    set undodir=~/.vim/undo
    set undolevels=1000
    set undoreload=10000
    set textwidth=80
    set colorcolumn=+1
    match ErrorMsg '\%>80v.\+'
  endif

  let mapleader = ","

  noremap <leader>y "*y
  noremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
  noremap <leader>P :set paste<CR>"*P<CR>:set nopaste<CR>
  set pastetoggle=<F3>

" sessionman plugin - show sessions
  noremap <F4> :SessionOpen<CR>
"
" FuzzyFileFilnder mapping
  noremap <silent> <C-a>     :FufFile<CR>
  noremap <silent> <C-e>    :FufBuffer<CR>
  nnoremap <leader>n :setlocal number!<cr>

" Remove whitespace on specific filetypes
  autocmd FileType sh,php,ruby,python autocmd BufWritePre <buffer> :%s/\s\+$//e

  nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
  nnoremap <leader>m :%s///g<cr>
  nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>l :NERDTreeToggle<CR>

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
"
" Nerdtree configuration
  map <F2> :NERDTreeToggle<CR>
  let g:NERDTreeDirArrows=0
  map <leader>e :NERDTreeFind<CR>
  nmap <leader>nt :NERDTreeFind<CR>

  let NERDTreeShowBookmarks=1
  let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr','\.nfs$']
  let NERDTreeChDirMode=0
  let NERDTreeQuitOnOpen=1
  let NERDTreeShowHidden=1
  let NERDTreeKeepTreeInNewTab=1

"
" Set Airline theme
  let g:airline_enable_branch=1
  let g:airline_enable_syntastic=1
  let g:airline_theme='powerlineish'
  let g:airline_left_sep = ''
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_sep = ''
  let g:airline_branch_prefix = ' '
  let g:airline_readonly_symbol = ''
  let g:airline_linecolumn_prefix = ''

  let g:loaded_sh_syntax_checker = 1
  let g:syntastic_ruby_checkers = ['mri', 'rubocop']
  let g:syntastic_check_on_open=1
  let g:syntastic_enable_signs=1
