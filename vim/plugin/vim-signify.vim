" Signify ======================================================================
" ~> Diff markers for editing files in perforce/git
"       https://github.com/mhinz/vim-signify

" Configuration settings ===================================
let g:signify_vcs_list = [ 'perforce', 'git' ]  " Enable for these vcs's
let g:signify_disable_by_default = 0            " check for diffs on open

" Mappings =================================================
" Enable/disable indicators
nmap <leader>sft :SignifyToggle<CR>
" Refresh indicators
nmap <leader>sfr :SignifyRefresh<CR>
" Fold current file around diffs
nmap <leader>sff :SignifyFold<CR>
