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
Plug 'vim-airline/vim-airline'
" Plug 'w0rp/ale'
" Plug 'itchyny/lightline.vim'
" Plug 'airblade/vim-gitgutter'
" Plug 'jacoborus/tender'
" Plug 'morhetz/gruvbox'
" Plug 'KeitaNakamura/neodark.vim'
Plug 'dag/vim-fish'
" Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'ekalinin/Dockerfile.vim'
" Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
" Plug 'elzr/vim-json'
Plug 'chr4/nginx.vim'
" Plug 'vim-python/python-syntax'
" Plug 'vim-scripts/indentpython.vim'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim'
Plug 'fatih/vim-go'
Plug 'tpope/vim-pathogen'
Plug 'vim-syntastic/syntastic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}




call plug#end()

  set nocompatible
" Pathogen 
  execute pathogen#infect()

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
  " set textwidth=80
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
  colorscheme dracula
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

" Cycle trough buffers
  nnoremap <Tab> :bnext<CR>
  nnoremap <S-Tab> :bprevious<CR>

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


  nnoremap <leader>g :!lazygit<CR>
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

" disable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []

" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0

" run go imports on file save
let g:go_fmt_command = "goimports"

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0


" Coc configuration
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" Use <c-space> to trigger completion.
" https://github.com/neoclide/coc.nvim
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use K to show documentation in preview window.
 nnoremap <silent> K :call ShowDocumentation()<CR>
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
 nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Pathogen setup Go highlighting
  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_generate_tags = 1

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


" https://www.tdaly.co.uk/projects/vim-statusline-generator/
