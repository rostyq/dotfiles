let g:polyglot_disabled = ['svelte']

call plug#begin()
" theme
Plug 'iCyMind/NeoSolarized'

" status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'

" folding
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/simpylfold'

" syntax
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/syntastic'
Plug 'leafOfTree/vim-svelte-plugin'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" other
Plug 'preservim/nerdtree'
Plug 'ActivityWatch/aw-watcher-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript', 'css', 'svelte'] }
call plug#end()

