if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"---->Pluggins beginning
call plug#begin('~/.vim/plugged')

"NERDtree
Plug 'scrooloose/nerdtree'

"colorscheme Gruvbox
Plug 'morhetz/gruvbox'

"comandline Airline
Plug 'vim-airline/vim-airline'

"comandline lightline
Plug 'itchyny/lightline.vim'

"Syntax checker Synstastic
Plug 'scrooloose/syntastic'

" Should be illegal
Plug 'tpope/vim-fugitive'

"comment with gcc
Plug 'tpope/vim-commentary'

"42 header
Plug 'pandark/42header.vim'

call plug#end()
"---->Pluggin end

"Config
set wildmenu
set number
set mouse=a
autocmd filetype c,cpp setlocal tabstop=4
"Gruvbox config
colorscheme gruvbox
set bg=dark
set t_Co=256
"Always show the status line
set laststatus=2

"---->Lightline config
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }


