"Go to iTerm settings -> Profiles -> Text and make sure you have selected any
"power line font for Non-ASCII Font, for example I've chosen "Source Code Pro
"Medium".
"git clone git@github.com:powerline/fonts.git
"cd fontd
"./install.sh

"curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

"Markdown plug deps : https://github.com/joeyespo/grip  

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin()
Plug 'tomasr/molokai'
Plug 'airblade/vim-gitgutter'
Plug 'YankRing.vim'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'leshill/vim-json'
Plug 'tomtom/tcomment_vim'
Plug 'easymotion/vim-easymotion'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go'
Plug 'python-mode/python-mode'
Plug 'rodjek/vim-puppet'
Plug 'vim-syntastic/syntastic'
Plug 'vim-scripts/DrawIt'
Plug 'pearofducks/ansible-vim'
Plug 'tpope/vim-fugitive'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'jpalardy/vim-slime'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'andrewstuart/vim-kubernetes'
Plug 'junegunn/goyo.vim'
Plug 'mileszs/ack.vim'
Plug 'terryma/vim-multiple-cursors'
" Initialize plugin system
call plug#end()
let vim_markdown_preview_github=1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']


syntax on
filetype plugin indent on

let mapleader = ","

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <leader>i <Plug>(go-info)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

let g:pymode_run_bind = "<C-S-e>"
au FileType python nmap <leader>ds <C-c>g
au FileType python nmap <leader>r <C-S-e>

let g:go_fmt_command = "goimports"

set hlsearch

let g:UltiSnipsExpandTrigger="<Leader>"
let g:UltiSnipsListSnippets="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

au FileType text nmap <leader>s <Esc>:DIstart<CR> 
au FileType text nmap <leader>S <Esc>:DIstop<CR>


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#fugitive#enabled = 1
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'unicode'

set laststatus=2

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

map <c-o> :FZF<CR>
map <c-r> :CtrlPMRUFiles<CR>
map <leader>pp :setlocal paste!<cr>
map <leader>z :Goyo<cr>
map <leader>g :Ack 

map <leader>/ <Plug>(incsearch-easymotion-/)
map <leader>? <Plug>(incsearch-easymotion-?)
map <leader>g/ <Plug>(incsearch-easymotion-stay)

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"



set sw=4
set ts=4

filetype on            " enables filetype detection
filetype plugin on     " enables filetype specific plugins

nnoremap <silent> ,p :YRShow<CR>

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

let g:slime_target = "tmux"


function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

colorscheme molokai
