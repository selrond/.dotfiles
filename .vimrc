set scrolloff=8
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'herringtondarkholme/yats.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
call plug#end()

" enable true colors support
set termguicolors
set updatetime=100

let g:gitgutter_highlight_lines = 1

colorscheme gruvbox

let mapleader = " "
" split buffer vertically and open explorer
nnoremap <leader>pv :Vex<CR>
" source vim config
nnoremap <leader><CR> :so $MYVIMRC<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>ff :Files<CR>
