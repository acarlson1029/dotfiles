" NERDTree =====================================================================
" ~> Adds a directory tree to the sidebar
"       https://github.com/scrooloose/nerdtree

" Configuration settings ===================================
let g:NERDTreeDirArrows=1                 " utf8 arrows
let g:NERDTreeDirArrowExpandable  = ''   " open folder
let g:NERDTreeDirArrowCollapsible = ''   " closed folder
let g:NERDTreeGlyphReadOnly = ''         " read only

" Mappings =================================================
" Open/Close NERDTree
nmap <C-n> :NERDTreeToggle<CR>
" Open NERDTree to current file
nmap <leader>n% :NERDTreeFind<CR>

" Auto Groups ==============================================
" Close vim if the NERDTree is the last open pane
autocmd bufenter * if (winnr("$") == 1 && 
            \ exists("b:NERDTreeType") && 
            \ b:NERDTreeType == "primary") | q | endif

" Open NERDTree if running vim without an argument
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && 
            \ !exists("s:std_in") | :NERDTree | endif
