"" Custom script to have a awesum statusbasr with lots ofinformation
"" Pathogen included
"
" Configure the statusline
	if has('statusline')
		set statusline=\ [%{getcwd()}]          " current dir

		set statusline+=%#identifier#
		set statusline+=[%t] "tail of the filename
		set statusline+=%*
		
		"modified flag
		set statusline+=%#warningmsg#
		set statusline+=%m
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

