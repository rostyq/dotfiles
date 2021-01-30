filetype plugin indent on
set nocompatible
syntax enable
syntax on

colorscheme NeoSolarized

set title
set encoding=utf-8
set relativenumber

set fileformat=unix
set fileformats=unix,dos

set showcmd
set foldmethod=indent
set foldlevel=99

set tabstop=4
set shiftwidth=4
set expandtab
set ts=2 sts=2 sw=2

autocmd FileType netrw setl bufhidden=delete
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType toml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType python setl ts=4 sts=4 sw=4 tw=80 et ai ff=unix
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType markdown setlocal wrap linebreak nolist

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

autocmd BufEnter * silent! lcd %:p:h
