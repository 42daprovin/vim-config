if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"---->Pluggins beginning
call plug#begin('~/.vim/plugged')

"NERDtree
Plug 'scrooloose/nerdtree'

" NERDtree macro
map <C-n> :NERDTreeToggle<CR>

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

" Database managment
" Plug 'vim-scripts/dbext.vim'
Plug 'tpope/vim-dadbod'

"---->JS Pluggins

"JavaScript support
Plug 'pangloss/vim-javascript'

"Typescript syntax
Plug 'leafgarland/typescript-vim'

"JS and JSX syntax
Plug 'maxmellon/vim-jsx-pretty'

"GraphQL syntax
"Plug 'jparise/vim-graphql'

"Autocomplete plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"----->CoC config

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver']

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

call plug#end()
"---->Pluggin end

"Config
set wildignorecase
set wildmenu
set number
set mouse=a
set shiftwidth=4
set tabstop=4
autocmd filetype c,cpp,typescript,javascript setlocal tabstop=4
"Disable safe write in typescript and javascript to prevent parcel errors
autocmd filetype typescript,javascript,html setlocal tabstop=2 shiftwidth=2
set backupcopy=yes
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


