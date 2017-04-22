

" Install vim-plug (from vim bootstrap)
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif


" plugins
call plug#begin('~/.config/nvim/plugged')
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'airblade/vim-gitgutter'
    Plug 'bronson/vim-trailing-whitespace'

    Plug 'Xuyuanp/nerdtree-git-plugin'

    Plug 'rhysd/vim-crystal'
    Plug 'fatih/vim-go'
    Plug 'chriskempson/base16-vim'
call plug#end()


" reload configuration when saved
augroup myvimrchooks
    au!
    autocmd bufwritepost init.vim source $MYVIMRC
augroup END




" *****************************
" Bootstrap conf
" *****************************
"
set nocompatible
set modeline

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Encoding
set bomb
set binary
set ttyfast

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/sh

"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall


"" Map leader to ,
let mapleader=','

" Enable ctrlp caching
let g:ctrlp_use_caching = 1

" change paste mode with F10 (even in insert mode
set pastetoggle=<F10>

" disable line highlight as it very slow
set nocursorline

" enable spell checking
set spell spelllang=en_us

"" Tabs (vim bootstrap)
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" vim-airline (vim bootstrap)
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" NerdTree (vim bootstrap)
noremap <F3> :NERDTreeToggle<CR>

"" Git (vim bootstrap)
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>


"" Copy/Paste/Cut (vim bootstrap)
if has('unnamedplus')
      set clipboard=unnamed,unnamedplus
  endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

" To test. From http://superuser.com/questions/10588/how-to-make-cut-copy-paste-in-gvim-on-ubuntu-work-with-ctrlx-ctrlc-ctrlv/189198#189198
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

"" ctrlp.vim (vim bootstrap)
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|tox|ico|git|hg|svn))$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 0
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
noremap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_map = '<leader>e'
let g:ctrlp_open_new_file = 'r'


"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv


"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Move to other splits (also for terminal buffers)
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

:tnoremap <A-Left> <C-\><C-n><C-w>Left
:tnoremap <A-Down> <C-\><C-n><C-w>Down
:tnoremap <A-Up> <C-\><C-n><C-w>Up
:tnoremap <A-Right> <C-\><C-n><C-w>Right
:nnoremap <A-Left> <C-w>Left
:nnoremap <A-Down> <C-w>Down
:nnoremap <A-Up> <C-w>Up
:nnoremap <A-Right> <C-w>Right

" UI
set background=dark
let base16colorspace=256
colorscheme base16-flat
set cc=80

set linebreak
set nonumber
set modeline


" Indentation
set tabstop=4
set sw=4
set et
set ai


augroup vimrc-yaml
  autocmd!
  autocmd BufNewFile,BufRead *.yml,*.yaml setlocal filetype=yaml
  autocmd FileType yaml set tabstop=2|set shiftwidth=2|set expandtab
augroup END



