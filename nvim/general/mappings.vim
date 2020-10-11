nnoremap <space> za
" uppercase word
inoremap <c-u> <esc>viwUea
nnoremap zuz <Plug>(FastFoldUpdate)
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <silent> <C-Right> :bnext<cr>
nnoremap <silent> <C-Left> :previous<cr>

nnoremap <silent> <C-Up> :cnext<cr>
nnoremap <silent> <C-Down> :cprevious<cr>

" change terminal mode to normal mode 
tnoremap <Esc> <C-\><C-n>
tnoremap <c-l> <c-w>s<c-w>c
