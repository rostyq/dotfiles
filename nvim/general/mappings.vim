nnoremap <space> za
" uppercase word
inoremap <c-u> <esc>viwUea
nnoremap zuz <Plug>(FastFoldUpdate)
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <silent> <C-Right> :bnext<cr>
nnoremap <silent> <C-Left> :previous<cr>

nnoremap <silent> <C-Up> :cnext<cr>
nnoremap <silent> <C-Down> :cprevious<cr>

" change terminal mode to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap <c-l> <c-w>s<c-w>c

" nerd tree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" To use `ALT+{h,j,k,l}` to navigate windows from any mode: >
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
