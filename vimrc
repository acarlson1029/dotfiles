" so $MYVIMRC
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
"set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set expandtab
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

" Allows you to hide files in the buffer instead of closing them, like editing a file without saving/quitting first
set hidden

set ruler


" Folding Options
set foldmethod=syntax
set foldlevel=99

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
set noswapfile

if has('autocmd')
	" Vim can detect file types (by their extension, or by peeking inside the file). 
	" This enabled Vim to load plugins, settings or key mappings that are only useful in the context of specific file types. 
	" For example, a Python syntax checker plugin only makes sense in a Python file. 
	" Finally, indenting intelligence is enabled based on the syntax rules for the file type.
	filetype plugin indent on
	" To set some file type specific settings, you can now use the following:
	autocmd filetype python set expandtab
endif
filetype plugin indent on

set laststatus=2

" Vim can highlight whitespaces for you in a convenient way:
" This line will make Vim set out tab characters, trailing whitespace and invisible spaces visually,
" and additionally use the # sign at the end of lines to mark lines that extend off-screen. For more info, see :h listchars.
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Use when pasting large codeblocks when you don't want vim to format it
set pastetoggle=<F2>

" Replaces : with ; so you don't need to hit shift every time you want to use a command
nnoremap ; :

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Clear search hilighting without searching for gibberish
" Type ,/ to clear the current search
nmap <silent> ,/ :noh

" Finally, a trick by Steve Losh for when you forgot to sudo before editing a file that 
" requires root privileges (typically /etc/hosts). 
" This lets you use w!! to do that after you opened the file already:
" cmap w!! w !sudo tee % >/dev/null
cmap sce w !sc edit %

" Find all FIXMEs in the current file
" Opens a buffer you can use to jump between them
cmap fixf vimgrep /FIXME\\|BAR/ % <bar> copen

function! Fixme_str()
	return "-- FIXME ".toupper($PROJECT)." - ".$USER." -"
endfunction
autocmd FileType lua iab <expr> fixme Fixme_str()

function! Waiver_str()
	return "-- FIXME WAIVE_FOR_".toupper($PROJECT)."_A0 - ".$USER." -"
endfunction
autocmd FileType lua iab <expr> waiver Waiver_str()

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#infect()

" change the mapleader from \ to ,
let mapleader=","
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" NERDTree
" Use C-n to open the NERDTree window
map <C-n> :NERDTreeToggle<CR>
" Automatically close vim if the NERDTRee is the last open pane
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Tagbar
nmap <C-t> :TagbarToggle<CR> 

let NERDTreeDirArrows=0

" Custom Syntax
autocmd BufRead,BufNewFile minirunt.log set filetype=minirunt
autocmd BufRead,BufNewFile *.dat set filetype=lua

" Colorscheme Changes
set t_Co=256
let g:molokai_tmux_original=1
syntax enable
colorscheme molokai_tmux

" Custom Tagbar Settings
let g:tagbar_type_lua = {
	\ 'kinds' : [
		\ 'f:functions',
		\ 'l:locals:0:0',
		\ 'v:variables:0:0',
	\ ]
\ }

" Setting for SimpylFold
let g:SimpylFold_docstring_preview = 1
