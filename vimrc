"
" vimrc configuration
"

"" Setup vundle
"" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vi
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'itchyny/lightline.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-haml'
Plugin 'jacoborus/tender'
Plugin 'godlygeek/tabular'
Plugin 'morhetz/gruvbox'

call vundle#end() 
"" Bundle 'Valloric/YouCompleteMe'
"
" Setup Pathogen
  set nocompatible

"
" General Setup
  syntax on " syntax highlighting
  scriptencoding utf-8
  set fileencoding=utf8
  set virtualedit=onemore
  filetype on " file type detection
  filetype indent on " special indentation rules for file type
  filetype plugin on " auto-completion rules for file type
  set wildmenu
  set wrap
  set title
  set number " Include numbers
  set ruler
  set visualbell
"
" Fix broken backspace + enable few other nigty things
  set backspace=2

" Default stuff
  set tabstop=2 " PEP-8 uses 4 spaces per indentation level
  set shiftwidth=2 " shifting (PEP-8)
	set softtabstop=2
	set expandtab

" Load custom settings for each filetype
  autocmd FileType sh source ~/.vim/scripts/ruby.vim
  autocmd FileType ruby source ~/.vim/scripts/ruby.vim
  autocmd FileType python source ~/.vim/scripts/python.vim

" Fun video: http://smartic.us/2009/04/06/code-folding-in-vim/
  set foldmethod=indent  " Fold based on indent
  set foldnestmax=10        " Fold max 10 levels
  set nofoldenable          " Don't fold by default
  set foldlevel=1


  set mouse=a
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
" Theme setup
" Enable 256 color term
  set t_Co=256

  if &term =~ '256color'
    " disable Background Color Erase
    set t_ut=
  endif
  set background=dark
  colorscheme gruvbox
  set scrolloff=18 " keep 15 lines of context on both sides

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

" Git maps using Fugitive
  nnoremap <leader>gs :Gstatus<CR><C-w>t<C-w>K<C-w>20+
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

  " let g:tender_lightline = 1

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'filename', 'readonly', 'fugitive', 'modified', 'syntastic' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }
function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction
"
" Set Airline theme
"  let g:airline_enable_branch=1
"  let g:airline_enable_syntastic=1
"  let g:airline_theme='kalisi'
"  let g:airline_left_sep = ''
"  let g:airline_left_sep = ''
"  let g:airline_right_sep = ''
"  let g:airline_right_sep = ''
"  let g:airline_branch_prefix = ' '
"  let g:airline_readonly_symbol = ''
"  let g:airline_linecolumn_prefix = ''
"	let g:airline#extensions#tabline#enabled = 1

  let g:loaded_sh_syntax_checker = 1
  let g:syntastic_ruby_checkers = ['mri', 'rubocop']
  let g:syntastic_check_on_open=1
  let g:syntastic_enable_signs=1

  " Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
