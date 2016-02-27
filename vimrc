""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"~> Misc -- to be categorized
" Yank to end of line (Y and yy both do whole line)
nnoremap Y y$
" Move to end of line (not including <CR>)
nnoremap L g_

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"~> Notes
"   Helpful reminders of stuff I keep forgetting I can do...

" ~~~~~> Registers  (:h reg)
" Notable registers:
"   @" - default register:  holds last text extracted (d, c, y, x)
"   @0 - yank register:     holds the last text yanked 
"   @_ - NULL register:     instantly discards entry
"   @/ - search register:   holds last searched text
"   @: - command register:  holds last vim command
"   @+,@* - sys clipboard:  write to the system clipboard
"   %  - current buff:      holds the filename of the current buffer
"   #  - previous buff:     holds the filename of the previous buffer

" To paste the last item that was yanked (ignores the last deleted):
"   "0p <-- stored in register 0

" Pasting registers into COMMAND mode:
" Use <C-R> in command mode, then choose <reg> to paste.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"~> General
let mapleader=" "
let g:UserSettings = {}
let g:UserSettings.vimrc = '~/.vimrc'
let g:UserSettings.vimdir = '~/.vim'
let g:UserSettings.PlugInstallDir = g:UserSettings.vimdir . "/plugged"
let g:UserSettings.plugindir= g:UserSettings.vimdir . "/plugin"

" Visual Configuration
set nowrap                              " don't wrap lines
set number                              " always show line numbers
set ruler                               " display ruler for line/column/%/etc
set laststatus=2                        " always draw statusline
set cursorline                          " draw bg on cursor line
set showcmd                             " show line/char/block cnt in V-mode
set encoding=utf-8                      " Unicode by default
set noshowmode                          " Don't show the --INSERT-- text 
                                        "  (handled by status bar)
if exists('+relativenumber')
    set relativenumber                  " Line #'s sre relative to the cursor
endif
if exists('+colorcolun')
    set colorcolumn=80                  " Visually indicate column limit
endif

" Moving around
set scrolloff=3                         " keep lines when cursor scrolling
" move between panes
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Vim can highlight whitespaces for you in a convenient way:
" This line will make Vim set out tab characters, trailing whitespace and invisible spaces visually,
" and additionally use the # sign at the end of lines to mark lines that extend off-screen. For more info, see :h listchars.
set nolist
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Indentation
set expandtab
set tabstop=4                           " a tab is four spaces
set copyindent                          " copy the previous indentation on autoindenting
set autoindent                          " always set autoindenting on
set shiftwidth=4                        " spaces for autoindenting
set shiftround                          " use shiftwidth when indenting with '<' and '>'
set showmatch                           " set show matching parenthesis
set smarttab                            " insert tabs on the start of a line according to 
                                        "    shiftwidth, not tabstop

" Colorscheme Changes
set t_Co=256                            " terminal support 256 colors
syntax enable
" let g:molokai_tmux_original=1         " TODO shouldn't need this
" colorscheme molokai_tmux              " TODO clean this colorscheme
set background=dark

augroup collumnLimit                    " highlight long lines
  autocmd!
  autocmd BufEnter,WinEnter,FileType *  " can choose this; i.e. lua,python,c
        \ highlight CollumnLimit ctermbg=DarkGrey guibg=DarkGrey
  let collumnLimit = 79 " feel free to customize
  let pattern =
        \ '\%<' . (collumnLimit+1) . 'v.\%>' . collumnLimit . 'v'
  autocmd BufEnter,WinEnter,FileType *  " can choose this; i.e. lua,python,c
        \ let w:m1=matchadd('CollumnLimit', pattern, -1)
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"~> Searching
"
set ignorecase
set smartcase                           " lowercase => auto ignorecase
                                        "    case-sensitive otherwise
set hlsearch                            " highlight search terms
set incsearch                           " show search matches as you type
" clear search highlighting
map <silent><leader>/ :noh<CR><esc>

set gdefault                            " s/foo/bar/g => s/foo/bar/

" vimgrep current file => copen
" TODO

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"~> Files
set wildignore=*.swp,*.bak,*.pyc,*.class
set nobackup
set noswapfile
set autoread                            " Reload files when they're changed.
filetype on                             " enable filetype detection

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"~> Buffers
set hidden                              " hide buffers instead of closing them
set splitbelow                          " open horizontal splits below
set splitright                          " open vertical splits on right
set backspace=indent,eol,start          " sane backspace behavior

" Folding Options ============================================================
set foldmethod=syntax
set foldlevel=99

" VIM Commands
set ttimeoutlen=50                      " key code delay
set history=1000                        " remember more commands and search history
set undolevels=1000                     " use many muchos levels of undo
set visualbell                          " don't beep
set noerrorbells                        " don't beep
set wildmenu                            " show command completion list
set shell=bash                          " needed by Screen

" Set folded text
function! NeatFoldText()
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '+' . lines_count . '' "+----<text>----(...)---- 10---
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()


" Edit and Source vimrc
nmap <leader>ev :execute 'edit' g:UserSettings.vimrc<CR>
nmap <leader>sv :execute 'source' g:UserSettings.vimrc<CR>

" Perforce Commands
nmap <leader>sce :w !p4 edit %<CR>
nmap <leader>scr :w !p4 revert %<CR>
nmap <leader>scf :w !p4 filelog -m 5 %<CR>
" Open p4 diff of current file in a split below the current buffer
" Use patch format with 3 lines of context; ignore whitespace
nmap <leader>scd :new %.diff <bar> r !p4 diff -du3w # <CR>

" Vim can detect file types (by their extension, or by peeking inside the file). 
" This enabled Vim to load plugins, settings or key mappings that are only useful in the context of specific file types. 
" For example, a Python syntax checker plugin only makes sense in a Python file. 
" Finally, indenting intelligence is enabled based on the syntax rules for the file type.
filetype plugin indent on
autocmd filetype python set expandtab

set pastetoggle=<F2>                   " don't format when pasting

" Text Expansion ==============================================================
" Use to vexpand/vunexpand the current file in VIM
nmap vxp w !vexpand %
nmap vunxp w !vunexpand %

" Find all FIXMEs in the current file
" Opens a buffer you can use to jump between them
nmap <leader>ff :vimgrep /FIXME\\|BAR\\|TODO/ % <bar> copen <CR>

let g:user_timestamp = "(".$USER." ".strftime("%m/%d/%y")."):"
inoreabbrev <expr> tstamp       g:user_timestamp
inoreabbrev <expr> fixme        "FIXME "           . toupper($PROJECT) . " - "    . g:user_timestamp
inoreabbrev <expr> FIXME        "FIXME "           . toupper($PROJECT) . " - "    . g:user_timestamp

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"~> Syntax

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"~> Tags
" set tags=$HOME/.tags.tmp

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"~> Custom Functions

" fill the rest of line with characters
" Usage: :call FillLine(<string to repeat>, <max width to use>)
function! FillLine( str, ... )
    " set tw to the desired total length
    let tw = &textwidth
    if tw==0 | let tw = 80 | endif

    " Allow arugments like FillLine("=60")
    let symbol = a:str
    if len(a:str) > 1
        let symbol = a:str[0]
        let tw = str2nr(a:str[1:])
    endif

    " Allow arguments like FillLine("=", 60)
    if a:0 >= 1 | let tw = a:1 | endif

    " strip trailing spaces first
    .s/[[:space:]]*$//
    " calculate total number of 'str's to insert
    "let reps = (tw - col("$")) / len(a:str)
    " (acarlson 02/24/16): Assumine single-char
    let reps = (tw - col("$")) / 1
    " insert them, if there's room, removing trailing spaces (though forcing
    " there to be one)
    if reps > 0
        ".s/$/\=(' '.repeat(a:str, reps))/
        .s/$/\=(' '.repeat(symbol, reps))/
    endif
endfunction
" The following allows us to do: <leader>fl=<CR> to insert ='s to end of line
command! -nargs=+ FillLine :call FillLine(<f-args>)
nmap <leader>fl :FillLine

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"~> Plugins
source $HOME/.vim/plugin/plugins.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gruvbox_contrast_dark='soft'
colorscheme gruvbox
