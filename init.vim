set nocompatible

filetype plugin indent on
syntax enable

""""""""""""""""""""""""""""""""""
" Setup vim-plug (Plugin manager)
""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'

" NerdTree (file browser)
Plug 'scrooloose/nerdtree'

" Rust syntax
Plug 'rust-lang/rust.vim'

" Javascript + jsx + vue plugins
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
" Elm syntax
Plug 'lambdatoast/elm.vim'
" GDScript syntax
Plug 'quabug/vim-gdscript'
" Dart syntax
Plug 'dart-lang/dart-vim-plugin'

" Better markdown editing
Plug 'plasticboy/vim-markdown'

" More colours!
Plug 'flazz/vim-colorschemes'

" Syntax for local in-dev plugins: 
" Plug 'file://$HOME/dev/vim-plugins/myplugin'
" Plug 'file:///home/tom/dev/vim-plugins/rust-fold'

call plug#end()
""""""""""""""""""""""""""""""""""

let mapleader=" "

" Set indent behaviour
set ts=2 " Tab stops
set sts=2 
set sw=2 " Shift width
set sr " Round shift values
set expandtab

" Set line numbers
set number
set relativenumber

" Make sure auto indenting is on
set ai
set si

" Make a mapping to easily escape insert mode. Unmap <esc> for 'training'
" purposes.
inoremap jk <esc>
inoremap <esc> <nop>

" Set nerd tree to be opened with <leader> n
nnoremap <leader>n :NERDTreeToggle<CR>

" Make CtrlP's working path be = cd
let g:ctrlp_working_path_mode = 0
" Make CtrlP ignore certain files
set wildignore+=*/tmp/*,*.swp,*/node_modules/*,*/target/*,*/build/*
" Setup binding for CtrlPCacheClear
noremap <leader>pi :CtrlPClearCache<CR>

" Set colourscheme
colorscheme zenburn

function! SetupRust() 
  set ts=4 " Tab stops
  set sts=4 
  set sw=4 " Shift width
  nnoremap =r :RustFmt<cr>
endfunction

function! SetupDart()
  nnoremap =r :DartFmt<cr>
endfunction

augroup filetypedetect
  " Associate .md with markdown
  au BufRead,BufNewFile *.md setfiletype markdown
  au BufRead,BufNewFile *.rs call SetupRust()
  au BufRead,BufNewFile *.dart call SetupDart()
augroup END

" Map quick fix list :cn and :cp (goto next / previous entry) to fn and fp in
" normal mode
nnoremap fn :cn<cr>
nnoremap fp :cp<cr>
