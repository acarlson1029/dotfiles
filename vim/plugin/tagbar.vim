" Tagbar =======================================================================
" ~> Adds a sidebar with function/variable/etc tags
"       https://github.com/majutsushi/tagbar

" Mappings =================================================
" Open/Close Tagbar
nmap <C-t> :TagbarToggle<CR>

" Custom Tagbar Settings ===================================
" Lua settings
let g:tagbar_type_lua = {
    \ 'kinds' : [
        \ 'f:functions',
        \ 'l:locals:0:0',
        \ 'v:variables:0:0',
    \ ]
\ }
