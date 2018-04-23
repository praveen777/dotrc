"Go to iTerm settings -> Profiles -> Text and make sure you have selected any
"power line font for Non-ASCII Font, for example I've chosen "Source Code Pro
"Medium".
"git clone git@github.com:powerline/fonts.git
"cd fontd
"./install.sh

"curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/0.8.0/plug.vim

"Markdown plug deps : https://github.com/joeyespo/grip  

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin()
" Initialize plugin system
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'YankRing.vim'
Plug 'airblade/vim-gitgutter'
Plug 'andrewstuart/vim-kubernetes'
Plug 'avakhov/vim-yaml'
Plug 'c9s/helper.vim'
Plug 'c9s/treemenu.vim'
Plug 'c9s/vikube.vim'
Plug 'corylanou/vim-present', {'for' : 'present'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'easymotion/vim-easymotion'
Plug 'ekalinin/Dockerfile.vim'
Plug 'fatih/molokai'
Plug 'fatih/vim-go'
Plug 'fatih/vim-nginx' , {'for' : 'nginx'}
Plug 'hashivim/vim-hashicorp-tools'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'honza/vim-snippets'
Plug 'james9909/stackanswers.vim'
Plug 'jpalardy/vim-slime'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'kshenoy/vim-signature'
Plug 'leshill/vim-json'
Plug 'mileszs/ack.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; python2 generate.py' }
Plug 'python-mode/python-mode'
Plug 'rodjek/vim-puppet'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/DrawIt'
Plug 'vim-syntastic/syntastic'
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
let g:go_def_mode = 'guru'
let g:go_auto_type_info = 1
set updatetime=100
let g:go_auto_sameids = 1

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
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)
map <leader>n <Plug>(easymotion-next)
map <leader>N <Plug>(easymotion-prev)

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
let g:slime_paste_file = tempname()
let g:slime_python_ipython = 1

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

au BufEnter /private/tmp/crontab.* setl backupcopy=yes


function! s:config_easyfuzzymotion(...) abort
	  return extend(copy({
	    \   'converters': [incsearch#config#fuzzyword#converter()],
	    \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
	    \   'keymap': {"\<CR>": '<Over>(easymotion)'},
	    \   'is_expr': 0,
	    \   'is_stay': 1
	    \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())




set timeout timeoutlen=1000 ttimeoutlen=10
"let g:pymode_rope = 0
let g:go_version_warning = 0
let g:rehash256 = 1
let g:molokai_original = 1
