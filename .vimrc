echo "It's VIM Time"

set number                     " Show current line number
set relativenumber             " Show relative line numbers

" Remap CAPS LOCK to Esc Key nonrec
:noremap <Caps> <Esc>

" Remap qq to Esc in Insert Mode
:inoremap jj <Esc>

" tabstop:          Width of tab character
set tabstop     =2 
" softtabstop:      Fine tunes the amount of white space to be added
set softtabstop =2
" shiftwidth        Determines the amount of whitespace to add in normal mode
set shiftwidth  =2
" expandtab:        When on uses space instead of tabs
set expandtab

" Putting the yank register in your OS's clipboard ( can do o<Ctl-v> )
" I guess this only works if you have +clipboard
set clipboard+=unnamed


"" Setting up directory navigation - for :netrw (NOT the NERDtree plugin)
"
"" remove the banner
"let g:netrw_banner = 0
"
"" directory structure to be tree style
"let g:netrw_liststyle = 3
"
"" Hit enter in the file browser to open the selected
"" file with :vsplit to the right of the browser.
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"
"" Setting the directory window size to 25
"let g:netrw_winsize = 25
"
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END
