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
autocmd FileType svelte setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType markdown setlocal wrap linebreak nolist

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

autocmd BufEnter * silent! lcd %:p:h

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
