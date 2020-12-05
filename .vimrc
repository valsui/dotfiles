"To use this vimrc in neovim, source this file in .config/nvim/init.vim

"brew intall neovim << to use neovim
echo "It's NEOVIM Time"

set number                     " Show current line number
set relativenumber             " Show relative line numbers

" Remap qq to Esc in Insert Mode
:inoremap jj <Esc>

" Make searches case-insensitive, unless they contain upper-case letters
set ignorecase
set smartcase

" auto reload file when changes detected
set autoread

" Encoding is utf-8
set encoding=utf-8
set fileencoding=utf-8

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

" setting max characters per line
set colorcolumn=120
set textwidth=120

"Will load vim-plug if not there
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Begin plugins
"call plug#begin() << for vim
"Run the following command for neovim
"curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.local/share/nvim/plugged')

"General plugins
Plug 'scrooloose/nerdtree'         "NERDtree plugin
Plug 'jistr/vim-nerdtree-tabs'     "NERDtree tabs
Plug 'vim-airline/vim-airline'        " Status/tabline
Plug 'vim-airline/vim-airline-themes' " Status/tabline themes
Plug 'ntpeters/vim-better-whitespace' " Trims trailing whitespace
Plug 'tpope/vim-unimpaired'         " easy mapping for buffer toggling https://github.com/tpope/vim-unimpaired
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }     " PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
Plug 'junegunn/fzf.vim'               " Required with fzf (do both)
Plug 'vim-scripts/l9'                 " required for FuzzyFinder
Plug 'altercation/vim-colors-solarized' "Solarized

"Useful Dev Plugins
Plug 'jiangmiao/auto-pairs'  " automatically insert matching brackets
Plug 'w0rp/ale'  " super fast linter
"Plug 'Shougo/deoplete.nvim' " autocomplete
Plug 'scrooloose/nerdcommenter' " keyboard shortcut to comment out a block of text
Plug 'tpope/vim-fugitive' " git features
Plug 'tpope/vim-rhubarb'  "Needed to enable :Gblame
Plug 'easymotion/vim-easymotion' "Hotspot navigation with <Leader><Leader>w
Plug 'andrewradev/splitjoin.vim' "brackets into do end blocks
Plug 'pangloss/vim-javascript' "JS Highlighter
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'mxw/vim-jsx' "JSX Highlighter
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'tpope/vim-surround' "Surround text with html tags, quotes, and brackets with vs and cs
Plug 'tpope/vim-abolish' "Easier substitution and coercion
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

call plug#end()

"Solarized theme
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

"Map commands
let mapleader=" "   " map space to leader

" NERDTree commands
nmap <leader>pt :NERDTreeTabsToggle<CR>
nmap <leader>pf :NERDTreeFind<CR>
let g:NERDTreeWinSize=50
let NERDTreeShowHidden=1

" Airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
" let g:airline_theme='solarized'

" FZF
map <C-b> :Buffers<CR>
map <C-f> :Ag<CR>
map <C-m> :History<CR>
map <C-p> :Files<CR>
map <C-t> :Tags<CR>
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Show all open buffers and their status
nmap <leader>bf :ls<CR>

" Close quickfix window
nmap <leader>c :ccl<CR>

" Easier split navigation
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>

" Copy the current file paths
nmap <leader>ys :let @*=expand("%")<CR>
nmap <leader>yl :let @*=expand("%:p")<CR>

" Ale config
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
highlight ALEWarning  ctermbg=Black
highlight ALEWarningSign ctermbg=Black
highlight ALEErrorSign ctermbg=Black

" Deoplete config
"let g:deoplete#enable_at_startup = 1
"" let g:deoplete#sources#jedi#python_path = 'python3'
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"augroup Deoplete
  "autocmd!
  "autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  "autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  "autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  "autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  "autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"augroup end

" Whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" Set ack to use the_silver_surfer
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" CoC autocomplete
let g:coc_global_extensions = [ 'coc-tsserver' ]
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif
" Show autocomplete when Tab is pressed
inoremap <silent><expr> <Tab> coc#refresh()
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

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
"aDetects file change
