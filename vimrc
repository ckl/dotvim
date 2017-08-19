set t_Co=256

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
set softtabstop=4
set fileformat=unix
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
set foldmethod=indent   " create folds based on indent lines
set foldlevel=99
set lazyredraw          " don't redraw screen for macros or commands
set pastetoggle=<F2>    " press F2 to disable autoindent when pasting
set wildmenu            " enhanced command-line completion
set mousehide           " hide the mouse pointer while typing
set nocompatible        " more vim functionality at expense of vi-compatibility
filetype on

syntax on               " turn syntax highlighting on
set background=dark
colorscheme molokai     " color schemes at ~/.vim/colors

" set the cursor line to have a dark gray background
highlight CursorLine ctermbg=black

" remember folds and cursor position on exit
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

set tabline=%!ShortTabLine()  " shorten tab names and add the tab numbers to each tab

"----------------------------------------------------------------------------
" key bindings
"----------------------------------------------------------------------------
" converts character at cursor to upper/lower case then moves right
"nmap t ~

" capitalizes the first letter of word at cursor
"nmap T m`b~``

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

" Enable folding with the spacebar
nnoremap <space> za

" run python script with F9
nnoremap <buffer> <F9> :exec 'w !python3' shellescape(@%, 1)<cr>

"----------------------------------------------------------------------------
" mappings for split windows
"----------------------------------------------------------------------------

" ,v splits window vertically and moves to new window
nmap <leader>v <C-w>v<C-w>l 

" ,h splits window horizontally and moves to new window
nmap <leader>h <C-w>s<C-w>j

" map Ctrl+[h,j,k,l] for easy window movement
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

" move current window to the left of main vim window
nmap <leader>ml <C-W>H

" move current window to the right of main vim window
nmap <leader>mr <C-W>L

" move current window to the top of main vim window
nmap <leader>mr <C-W>K

" move current window to the bottom of main vim window
nmap <leader>mr <C-W>J

" resize vertical window by -3 
nnoremap <C-l> :vertical resize -3<cr>

" resize vertical window by +3 
nnoremap <C-h> :vertical resize +3<cr>

" resize horizontal window by -3
nnoremap <C-j> :resize -3<cr>

" resize horizontal window by +3
nnoremap <C-k> :resize +3<cr>

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

" close the i-th tab (or current tab if none specified). space after tabclose
nmap <leader>tc :tabclose 

" tab reference
" gt        go to next tab
" gT        go to previous tab
" {i}gt     go to i-th tab


"----------------------------------------------------------------------------
" Vundle
"----------------------------------------------------------------------------
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" For YouCompleteMe on Debian, do the following:
" sudo apt-get install vim vim-youcompleteme
" vam install youcompleteme
" cp /usr/share/doc/vim-youcompleteme/examples/ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py
" let g:ycm_global_ycm_extra_conf = ~/.vim/.ycm_extra_conf.py
Plugin 'tmhedberg/SimpylFold'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-obsession'
Plugin 'vimwiki/vimwiki'
"Plugin 'majutsushi/tagbar'
"Plugin 'fholgado/minibufexpl.vim'
Plugin 'sheerun/vim-polyglot'       " syntax files for vim
Plugin 'tpope/vim-fugitive'
Plugin 'unblevable/quick-scope'
Plugin 'vim-scripts/taglist.vim'
"Plugin 'SirVer/ultisnips'           " snippets for auto-competion
"Plugin 'honza/vim-snippets''        " snippets for auto-competion
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"----------------------------------------------------------------------------
"" Plugin settings 
"----------------------------------------------------------------------------
"au VimEnter * Obsession     " start Obsession on start to track session
"nnoremap <C-t> :TagbarToggle<cr>  " tagbar
let g:qs_first_occurrence_highlight_color = 45
let g:qs_second_occurrence_highlight_color = 227

" taglist.vim
nnoremap <silent> <C-t> :TlistToggle<cr> 
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Use_Right_Window = 1
"let Tlist_WinWidth = 40

nnoremap <silent> <leader>o :Obsession<cr>


"----------------------------------------------------------------------------
"" NERDTree settings 
"----------------------------------------------------------------------------
" put focus to NERDTree by closing it and re-opening it
map <silent> <C-n> :NERDTreeFocusToggle<cr>
map <silent> <leader>n :NERDTreeTabsClose<cr>

" close NERDTree when opening files from NERDTree
let NERDTreeQuitOnOpen=1

" highlight selected entry in the tree
let NERDTreeHighlightCursorline=1
"
" don't display files with these extensions
let NERDTreeIgnore = [ '\.pyc$', '\.jpg$', '\.o$', '\.class$',
             \ '\.tar\.gz$', '__pycache', 'Session.vim']
"
" Open NERDTree when Vim startsup and no files were specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close Vim if the only window left open is NERDTree
"autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTreeType') && b:NERDTreeType == 'primary') | q | endif
"
" reference
" open file in new tab - t
" open file in horizontal split window - i
" open file in vertical split window   - s

"----------------------------------------------------------------------------
" YouCompleteMe
"----------------------------------------------------------------------------
map <silent> <C-g> :YcmCompleter GoToDefinition<cr>
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

"----------------------------------------------------------------------------
" fugitive
"----------------------------------------------------------------------------
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gp :Git push origin master<cr>

"----------------------------------------------------------------------------
" UltiSnips
"----------------------------------------------------------------------------
"let g:UltiSnipsExpandTrigger='<tab>'
"let g:UltiSnipsJumpForwardTrigger='<tab>'
"let g:UltiSnipsJumpBackwardTrigger='<s-tab>'


"----------------------------------------------------------------------------
" Syntastic
"----------------------------------------------------------------------------
"set statusline=[%n]\ %t
nnoremap <silent> <C-p> :call ToggleErrors()<cr>
nnoremap <leader>e :lnext<cr>
nnoremap <leader>r :lprevious<cr>


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"----------------------------------------------------------------------------
" buffers and MiniBuf Explorer plugin
"----------------------------------------------------------------------------
" open MiniBufExpl with ctrl-m
"map <silent> <C-m> :MBEToggle<cr>:MBEFocus<cr>
"map <silent> <leader>m :MBEClose<cr>

" open buffer explorer in vertical split screen
" nmap <leader>bv :BufExplorerVerticalSplit<cr>
"
" open buffer explorer in horizontal split screen
" nmap <leader>bh :BufExplorerHorizontalSplit<cr>
"
" list all unhidden buffers
" nmap <leader>bl :ls<cr>
"
" delete current buffer
 nmap <leader>bd :bdelete<cr>


"----------------------------------------------------------------------------
" set status line 
"----------------------------------------------------------------------------
"set statusline=%!GetStatusline()

set statusline=%f
set statusline+=%{ObsessionStatus()}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{fugitive#statusline()}
set statusline+=%*
set laststatus=2        " always show filename


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
" to 10 characters, and adds the tab number before the name
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
        if strlen(filename) > 10
            let ret .= '[' . (i+1) . ':' . filename[0:9] . '..]'
        else
            let ret .= '[' . (i+1) . ':' . filename . ']'
        endif
    endfor

    " after the last tab, fill with TabLineFill 
    " and reset tab page #
    let ret .= '%#TabLineFill#%T'
    return ret
endfunction

function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction

function! SaveAndExecutePython()
    " SOURCE [reusable window]: https://github.com/fatih/vim-go/blob/master/autoload/go/ui.vim

    " save and reload the current file
    silent execute "update | edit"

    " get file path of current file
    let s:current_buffer_file_path = expand("%")

    let s:output_buffer_name = "Python"
    let s:output_buffer_filetype = "output"

    " reuse existing buffer window if it exists otherwise create a new one
    if !exists("s:buf_nr") || !bufexists(s:buf_nr)
        silent execute 'botright new ' . s:output_buffer_name
        let s:buf_nr = bufnr('%')
    elseif bufwinnr(s:buf_nr) == -1
        silent execute 'botright new'
        silent execute s:buf_nr . 'buffer'
    elseif bufwinnr(s:buf_nr) != bufwinnr('%')
        silent execute bufwinnr(s:buf_nr) . 'wincmd w'
    endif

    silent execute "setlocal filetype=" . s:output_buffer_filetype
    setlocal bufhidden=delete
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal nobuflisted
    setlocal winfixheight
    setlocal cursorline " make it easy to distinguish
    setlocal nonumber
    setlocal norelativenumber
    setlocal showbreak=""

    " clear the buffer
    setlocal noreadonly
    setlocal modifiable
    %delete _

    " add the console output
    silent execute ".!python " . shellescape(s:current_buffer_file_path, 1)

    " resize window to content length
    " Note: This is annoying because if you print a lot of lines then your code buffer is forced to a height of one line every time you run this function.
    "       However without this line the buffer starts off as a default size and if you resize the buffer then it keeps that custom size after repeated runs of this function.
    "       But if you close the output buffer then it returns to using the default size when its recreated
    "execute 'resize' . line('$')

    " make the buffer non modifiable
    setlocal readonly
    setlocal nomodifiable
endfunction

" Bind F5 to save file if modified and execute python script in a buffer.
" Note: This is a normal mode bind because in insert mode F5 would insert a "<F5>" into the text.
nnoremap <silent> <F5> :<C-u>call SaveAndExecutePython()<CR>
