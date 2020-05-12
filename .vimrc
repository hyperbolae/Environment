" From Danny Huang
" https://github.com/denny0224/.vim/blob/master/.vimrc

set nu
set ai
set tabstop=4
set shiftwidth=4
set ic
set incsearch
set cursorline
set showcmd
set hlsearch
set history=1000
set wildmode=longest,list,full
set wildignorecase
set backspace=2
set expandtab
syntax on

" map Ctrl-L to be nohl, clear search highlight
nnoremap <c-l> :nohl<cr>
" map Ctrl-A to select all and copy
nnoremap <c-a> :%y+<cr>

autocmd Filetype css setlocal tabstop=2 shiftwidth=2
autocmd Filetype html setlocal tabstop=2 shiftwidth=2
autocmd Filetype json setlocal tabstop=2 shiftwidth=2
autocmd Filetype sh setlocal tabstop=2 shiftwidth=2
