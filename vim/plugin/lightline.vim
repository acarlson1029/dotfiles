" Lightline ====================================================================
" ~> Status line enhancement
"       https://github.com/itchyny/lightline.vim

" LightLine notes (:h lightline) ===========================
"   * lightline.component
"     ~> defines all 'blocks' to be used in each part of the line, and the
"        corresponding string to replace in the line
"
"   * lightline.component_function
"     ~> like component, except call a function which returns the string
"
"   * lightline.component_expand
"     ~> like component_function, but splits the result into a 'type',
"        which is mostly used for color coding within a subgroup
"     ~> note: color is regardless of active/inactive buffer
"
"   (Put components in one of the above: expand > function > component)
"
"   * lightline.component_type
"     ~> used for coloring; separate types are separate from other groups in
"        each mode

" Statusline notes (:h statusline)
" Vim has special built-in variables to put in the statusline which are
" automatically expanded/evaluated, like current line number.
" i.e. %m (modified), %t (filename), %n (buffer number), etc.

let g:lightline = {}

" Components ===============================================
let g:lightline.component = {
        \ 'bufnum': 'buff'.'%n'
        \ }
" Note -- can't have modified as component_expand -- won't get updated
" Functions are inserted into the &statusline, whereas expands are inserted
" IF they're valid WHEN update() is called. More restrictive autocmd for
" lightline#update() for performance; no easy way to detect editing a file
let g:lightline.component_function = {
        \ 'modified': 'LightLineModified',
        \ }
let g:lightline.component_expand = {
        \ 'readonly': 'LightLineReadonly',
        \ 'perforcestatus': 'PerforceStatus',
        \ }
let g:lightline.component_type = {
        \ 'readonly': 'error',
        \ }

" Custom Functions =========================================
function! LightLineReadonly()
    return &ft !~? 'help' && &readonly ? '' : ''
endfunction
function! LightLineModified()
    return &modifiable &&  &modified ? '' : ''
endfunction

" Perforce =============================
" TODO -- This is slow...
function! PerforceStatus()
    echomsg "called perforcestatus"
    let fp = expand('%:p')
    if fp !~ "Wtmp" | return '' | endif     " not in a P4 workarea  
    " Check if the file is opened
    let retval = system("sc opened ".fp)
    if retval =~ "- file(s) not opened on this client."  | return '' | endif
    if (retval =~ " - add ")
        return "p4 add"
    elseif (retval =~ " - edit ")
        return "p4 edit"
    elseif (retval =~ " - delete " )
        return "p4 delete"
    elseif (retval =~ " - integrate ")
        return "p4 integ"
    else
        return "error -- see PerforceStatus()"
endfunction

" Buffer Settings ==========================================
let g:lightline.separator =    { 'left': '',  'right': ''  }
let g:lightline.subseparator = { 'left': '|', 'right': '⮃' }
let g:lightline.colorscheme = 'gruvbox'

" Build the active buffer statusline -- all modes inherit from this.
let g:lightline.active = {
        \ 'left': [ [ 'mode', 'paste' ],
        \           [ 'readonly', 'filename'],
        \           [ 'modified' ] ],
        \ 'right':[ [ 'lineinfo' ],
        \           [ 'percent' ],
        \           [ 'fileencoding', 'filetype' ] ] 
        \}

" Build the inactive buffer statusline -- all modes inherit from this.
let g:lightline.inactive = {
        \ 'left': [ [ 'filename', 'modified' ] ],
        \ 'right':[ [ 'lineinfo' ] ],
        \}
