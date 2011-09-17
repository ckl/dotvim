" place in ~/.vimrc

" initialize pathogen plugin handler
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

"----------------------------------------------------------------------------
" Global vim configuration
"----------------------------------------------------------------------------
let mapleader = ","     " re-map the leader key (from '\')
set termencoding=utf-8  " encoding used for the terminal
set encoding=utf-8      " set character encoding used inside vim
set history=100         " remember more commands and search history
set undolevels=1000     " remember more levels of undo
set tabstop=4			" width of tab character
set shiftwidth=4		" num columns to inc/dec when using <</>>
set expandtab			" convert tab to equivalent number of spaces
set noerrorbells        " disable audible error bell
set novisualbell        " disable visual error bell
set autoindent          " enable automatic indenting
set number              " turn on line numbers
set numberwidth=4       " number of columns to use for line number
set scrolloff=5         " minimum number of lines to keep above/below cursor
set showmode            " show if in INSERT, REPLACE, or VISUAL mode
set cursorline          " highlight line the cursor is on
set ttyfast             " indicates fast terminal for improved redrawing
set ignorecase          " ignore case if search is all lowercase
set smartcase           " override ignorecase if search contains uppercase
set showmatch           " when bracket is inserted, briefly jump to match
set incsearch           " show search results as they're typed
set hlsearch            " highlight search results
set wrap                " wrap long lines to next line
set nostartofline       " keep cursor in same column after certain commands
set scroll=8            " number of limes to scroll with ctrl-u/d
set showbreak=-->       " marker to highlight wrapped lines
set foldcolumn=2        " 2-character wide column that indicates folds
set lazyredraw          " don't redraw screen for macros or commands
set pastetoggle=<F2>    " press F2 to disable autoindent when pasting
set wildmenu            " enhanced command-line completion
set mousehide           " hide the mouse pointer while typing
set nocompatible        " more vim functionality at expense of vi-compatibility

colorscheme zenburn      " color schemes at /usr/share/vim/vim72/colors
filetype plugin on      " turn plugins on
syntax on               " turn syntax highlighting on

" get custom status line from function 
set statusline=%!GetStatusline()
set laststatus=2        " always display status line

" shorten tab names and add the tab numbers to each tab
set tabline=%!ShortTabLine()
 
" remember folds and cursor position on exit
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" set the cursor line to have a dark gray background
highlight CursorLine ctermbg=darkgray

"----------------------------------------------------------------------------
" NERDTree settings 
"----------------------------------------------------------------------------
" put focus to NERDTree by closing it and re-opening it
map <leader>n :NERDTreeClose<cr>:NERDTreeToggle<cr>
map <leader>m :NERDTreeClose<cr>:NERDTreeFind<cr>
map <leader>N :NERDTreeClose<cr>

" close NERDTree when opening files from NERDTree
let NERDTreeQuitOnOpen=1

" highlight selected entry in the tree
let NERDTreeHighlightCursorline=1

" don't display files with these extensions
let NERDTreeIgnore = [ '\.pyc$', '\.jpg$', '\.o$', '\.class$',
            \ '\.tar\.gz$']

"----------------------------------------------------------------------------
" key bindings
"----------------------------------------------------------------------------
" converts character at cursor to upper/lower case then moves right
nmap t ~

" capitalizes the first letter of word at cursor
nmap T m`b~``

" clear search highlights by pressing ,<space>
nmap <leader><space> :nohlsearch<cr>

" open plugin for displaying the calendar
nmap <leader>c :Calendar<cr>

" make 'jk' the escape key when in insert mode
imap jk <Esc>

" maps ^ (move to first non-space character on a line) to more convenient key
nmap @ ^

" map ; to : when in command mode -- easier to enter commands
nmap ; :

" quickly save the current file
nmap <leader>w :w<cr>

" quickly close the current window
nmap <leader>q :q<cr>

" disable F1 help for insert/command mode.
" I often hit F1 when trying to hit escape 
map! <F1> <ESC>

" make <C-[y/e]> scroll up/down by 2 lines instead of 1 
nnoremap <C-y> 2<C-y>
nnoremap <C-e> 2<C-e>

" prevent j/k from skipping over lines that are wrapped
nmap j gj
nmap k gk

" make searches use normal regexes
nnoremap / /\v
vnoremap / /\v

" sudo write with w!! (in case you forgot to sudo before opening file)
cmap w!! w !sudo tee % > /dev/null


"----------------------------------------------------------------------------
" mappings for split windows
"----------------------------------------------------------------------------

" ,v splits window vertically and moves to new window
nmap <leader>v <C-w>v<C-w>l 

" ,h splits window horizontally and moves to new window
nmap <leader>h <C-w>s<C-w>j

" map Ctrl+[h,j,k,l] for easy window movement
nmap <C-w>h <C-w>h
nmap <C-w>j <C-w>j
nmap <C-w>k <C-w>k
nmap <C-w>l <C-w>l

" move current window to the left of main vim window
nmap <leader>ml <C-W>H

" move current window to the right of main vim window
nmap <leader>mr <C-W>L

" move current window to the top of main vim window
nmap <leader>mr <C-W>K

" move current window to the bottom of main vim window
nmap <leader>mr <C-W>J

" resize vertical window by -3 
nmap <C-l> :vertical resize -3<cr>

" resize vertical window by +3 
nmap <C-h> :vertical resize +3<cr>

" resize horizontal window by -3
nmap <C-j> :resize -3<cr>

" resize horizontal window by +3
nmap <C-k> :resize +3<cr>

" enlarge window vertically
"nmap <C-k> <C-W>+

" enlarge window horizontally
"nmap <C-j> <C-W>>


"----------------------------------------------------------------------------
" Tabs
"----------------------------------------------------------------------------

" ,tt creates a new tab (there's a space after tabnew)
nmap <leader>tt :tabnew 

" ,tn moves to next tab
nmap <leader>tn :tabnext<cr>

" ,tp moves to previous tab
nmap <leader>tp :tabprevious<cr>

" ,tf moves to first tab
nmap <leader>tf :tabfirst<cr>

" ,tl moves to last tab
nmap <leader>tl :tablast<cr>

" ,ts saves tab session (there's a space after mksession)
nmap <leader>ts :mksession 


"----------------------------------------------------------------------------
" buffers and Buffer Explorer plugin
"----------------------------------------------------------------------------
" open buffer explorer (takes up full window)
nmap <leader>be :BufExplorer<cr>

" open buffer explorer in vertical split screen
nmap <leader>bv :BufExplorerVerticalSplit<cr>

" open buffer explorer in horizontal split screen
nmap <leader>bh :BufExplorerHorizontalSplit<cr>

" list all unhidden buffers
nmap <leader>bl :ls<cr>

" delete current buffer
nmap <leader>bd :bdelete<cr>

"----------------------------------------------------------------------------
" functions
"----------------------------------------------------------------------------
" returns a status line string
function GetStatusline()
	let ret  = ' '
	let ret .= '%<%f '		" filename
	let ret .= '%m '        " modified? [-] if unmodifiable
	let ret .= '%r '        " [RO] if readonly
	let ret .= '%y '        " [filetype-name]
	let ret .= "%{'['.(&fenc!=''?&fenc:&enc).'] ['.&ff.']'}"
									" ^- display (file)encoding
	let ret .= ' [%b]'      " value of byte under cursor
	if &paste
		let ret .= ' [paste]'
	endif
	let ret .= '%='         " rest right aligned
	let ret .= 'col:%v '    " column
	let ret .= 'l:%l/%L '   " curline/lines
    let ret .= 'buf: %n   ' " buffer number

    return ret
endfunction

" re-colors the active tab as white on red, shortens tab names
" to 6 characters, and adds the tab number before the name
function ShortTabLine()
    let ret = ''
    for i in range(tabpagenr('$'))
        " select the color group for highlighting active tab
        if i + 1 == tabpagenr()
            let ret .= '%#errorMsg#'
        else
            let ret .= '%#TabLine#'
        endif

        " find the buffername for the tab label
        let buflist    = tabpagebuflist(i+1)
        let winnr      = tabpagewinnr  (i+1)
        let buffername = bufname       (buflist[winnr-1])
        let filename   = fnamemodify   (buffername, ':t')

        " check if there is no name
        if filename == ''
            let filename = 'No Name'
        endif

        " only show the first 6 letters of the filename and
        " .. if the filename is more than 8 characters long
        if strlen(filename) >= 8
            let ret .= '[' . (i+1) . ':' . filename[0:5] . '..]'
        else
            let ret .= '[' . (i+1) . ':' . filename . ']'
        endif
    endfor

    " after the last tab, fill with TabLineFill 
    " and reset tab page #
    let ret .= '%#TabLineFill#%T'
    return ret
endfunction
