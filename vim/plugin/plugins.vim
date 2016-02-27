" Plugins ======================================================================
" Plugins managed by vim-plug
" Customizations in <vimdir>/plugins/

" vim-plug =================================================
" ~> Plugin management
" https://github.com/junegunn/vim-plug
call plug#begin(g:UserSettings.PlugInstallDir)

" Signify ==================================================
" ~> Diff markers for editing files in perforce/git
Plug 'https://github.com/mhinz/vim-signify', {'frozen': 1}
if filereadable(g:UserSettings.plugindir . '/vim-signify.vim')
    exec 'source' g:UserSettings.plugindir . '/vim-signify.vim'
endif

" NERDTree =================================================
" ~> Adds a directory tree to the sidebar
Plug 'https://github.com/scrooloose/nerdtree', {'frozen': 1}
if filereadable(g:UserSettings.plugindir . '/nerdtree.vim')
    exec 'source' g:UserSettings.plugindir . '/nerdtree.vim'
endif

" NERDTree-git-plugin ======================================
" ~> Adds marks in NERDTree for git status.
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin', {'frozen': 1}
if filereadable(g:UserSettings.plugindir . '/nerdtree-git-plugin.vim')
    exec 'source' g:UserSettings.plugindir . '/nerdtree-get-plugin.vim'
endif

" Tagbar ===================================================
" ~> Adds a sidebar with function/variable/etc tags
Plug 'https://github.com/majutsushi/tagbar', {'frozen': 1}
if filereadable(g:UserSettings.plugindir . '/tagbar.vim')
    exec 'source' g:UserSettings.plugindir . '/tagbar.vim'
endif

" Screen ==================================================
" ~> Open a tmux split terminal session from within vim
Plug 'https://github.com/ervandew/screen', {'frozen': 0}
if filereadable(g:UserSettings.plugindir . '/screen.vim')
    exec 'source' g:UserSettings.plugindir . '/screen.vim'
endif

" verilog-systemverilog ====================================
" ~> Adds SystemVerilog syntax highlighting, folding, etc.
Plug 'https://github.com/vhda/verilog_systemverilog.vim', {'frozen': 0}
if filereadable(g:UserSettings.plugindir . '/verilog_systemverilog.vim.vim')
    exec 'source' g:UserSettings.plugindir . '/verilog_systemverilog.vim.vim'
endif

" gruvbox ==================================================
" ~> Colorscheme
Plug 'https://github.com/morhetz/gruvbox.git', {'frozen': 0}
if filereadable(g:UserSettings.plugindir . '/gruvbox.vim')
    exec 'source' g:UserSettings.plugindir . '/gruvbox.vim'
endif

" SimpylFold ===============================================
" ~> Python folding done right.
Plug 'https://github.com/tmhedberg/SimpylFold', {'frozen': 0}
if filereadable(g:UserSettings.plugindir . '/SimpylFold.vim')
    exec 'source' g:UserSettings.plugindir . '/SimpylFold.vim'
endif

" Tabular ==================================================
" ~> Text alignment.
Plug 'https://github.com/godlygeek/tabular', {'frozen': 0}
if filereadable(g:UserSettings.plugindir . '/tabular.vim')
    exec 'source' g:UserSettings.plugindir . '/tabular.vim'
endif

" CtrlP ====================================================
" ~> Fuzzy finder -- file, buffer, tag, ...
Plug 'https://github.com/ctrlpvim/ctrlp.vim', {'frozen': 0}
if filereadable(g:UserSettings.plugindir . '/ctrlp.vim.vim')
    exec 'source' g:UserSettings.plugindir . '/ctrlp.vim.vim'
endif

" Signature ================================================
" ~> Visual mark indicators
Plug 'https://github.com/kshenoy/vim-signature', {'frozen': 0}
if filereadable(g:UserSettings.plugindir . '/vim-signature.vim')
    exec 'source' g:UserSettings.plugindir . '/vim-signature.vim'
endif

" Commentary ===============================================
" ~> Automagic commenting -- use command gc[c|{motion}]
Plug 'https://github.com/tpope/vim-commentary', {'frozen': 0}
if filereadable(g:UserSettings.plugindir . '/vim-commentary.vim')
    exec 'source' g:UserSettings.plugindir . '/vim-commentary.vim'
endif

" Surround =================================================
" ~> Delete/Insert surrounding characters
Plug 'https://github.com/tpope/vim-surround', {'frozen': 0}
if filereadable(g:UserSettings.plugindir . '/vim-surround.vim')
    exec 'source' g:UserSettings.plugindir . '/vim-surround.vim'
endif

" Match-It =================================================
" ~> Match begin/end characters
Plug 'https://github.com/benjifisher/matchit.zip', {'frozen': 0}
if filereadable(g:UserSettings.plugindir . '/matchit.zip.vim')
    exec 'source' g:UserSettings.plugindir . '/matchit.zip.vim'
endif
" ~> Highlight matches -- REQUIRES VIM 7.2++
Plug 'https://github.com/vimtaku/hl_matchit.vim', {'frozen': 0}
if filereadable(g:UserSettings.plugindir . '/hl_matchit.vim.vim')
    exec 'source' g:UserSettings.plugindir . '/hl_matchit.vim.vim'
endif
let g:hl_matchit_enable_on_vim_startup = 1

" delimitMate =============================================
" ~> Automatically close delimiter characters
Plug 'https://github.com/Raimondi/delimitMate', {'frozen': 0}
if filereadable(g:UserSettings.plugindir . '/delimitMate.vim')
    exec 'source' g:UserSettings.plugindir . '/delimitMate.vim'
endif

" endWise ==================================================
" ~> Automaticaly close delimiting strings
Plug 'https://github.com/tpope/vim-endwise', {'frozen': 0}
if filereadable(g:UserSettings.plugindir . '/vim-endwise.vim')
    exec 'source' g:UserSettings.plugindir . '/vim-endwise.vim'
endif
" TODO Add SystemVerilog completion

" Lightline ================================================
" ~> Status line enhancement
Plug 'https://github.com/itchyny/lightline.vim', {'frozen': 0}
if filereadable(g:UserSettings.plugindir . '/lightline.vim.vim')
    exec 'source' g:UserSettings.plugindir . '/lightline.vim.vim'
endif

" ~> End of plugins
call plug#end()
