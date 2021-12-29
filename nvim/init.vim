"## options
filetype plugin indent on
set nocompatible
syntax enable
syntax on

set title
set encoding=utf-8
set relativenumber
set termguicolors

set fileformat=unix
set fileformats=unix,dos

set showcmd
set foldmethod=indent
set foldlevel=99

set tabstop=2 shiftwidth=2 shiftwidth=2
set expandtab
set scrolloff=10

" disable netrw
let loaded_netrwPlugin = 1


"## plugins
call plug#begin()
Plug 'iCyMind/NeoSolarized' " theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive' " git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/simpylfold'
Plug 'preservim/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/syntastic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript', 'css', 'svelte', 'markdown'] }
Plug 'delphinus/vim-firestore'
Plug 'ryanoasis/vim-devicons'
call plug#end()


"## mappings
nnoremap <leader>ev :vsp $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" strong 'h'
nnoremap H ^
vnoremap H ^
" strong 'l'
nnoremap L $
vnoremap L $h

" no arrows
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" uppercase word
inoremap <c-u> <esc>viwUea

nnoremap zuz <Plug>(FastFoldUpdate)

nnoremap <silent> <C-Right> :bnext<cr>
nnoremap <silent> <C-Left> :bprevious<cr>
nnoremap <silent> <C-Up> :cnext<cr>
nnoremap <silent> <C-Down> :cprevious<cr>

" change terminal mode to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap <c-l> <c-w>s<c-w>c

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

" remaps for NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


"## commands
command! PrettifyJson %!python -m json.tool --indent 2
command! PrettifyJS %!js-beautify -s 2 -w 100


"## autocmd
augroup yaml
  autocmd!
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
augroup END

augroup toml
  autocmd!
  autocmd FileType toml setlocal ts=2 sts=2 sw=2 expandtab
augroup END

augroup json
  autocmd!
  autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
augroup END

augroup au_python
  autocmd!
  au FileType python setl ts=4 sts=4 sw=4 tw=80 et ai ff=unix
augroup END

augroup markdown
  autocmd!
  autocmd FileType markdown setlocal wrap linebreak nolist
augroup END

augroup javascript
  autocmd!
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab foldmethod=syntax
augroup END

augroup svelte
  autocmd!
  autocmd FileType svelte setlocal ts=2 sts=2 sw=2 expandtab
augroup END

augroup html
  autocmd!
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd BufNewFile,BufRead *.html setlocal nowrap
  autocmd BufWritePre,BufRead *.html :normal gg=G
augroup END

augroup css
  autocmd!
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
augroup END

augroup clear_whitespaces
  autocmd!
  autocmd BufWritePre * :%s/^\s\+$//e | %s/\s\+$//e
augroup END

augroup neovim_terminal
  autocmd!
  " Enter Terminal-mode (insert) automatically
  autocmd TermOpen * startinsert
  " Disables number lines on terminal buffers
  autocmd TermOpen * :set nonumber norelativenumber
  " allows you to use Ctrl-c on terminal window
  autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
augroup END

augroup change_working_dir_to_file
  autocmd BufEnter * silent! lcd %:p:h
augroup END

augroup nerdtree
  autocmd!
  " Start NERDTree when Vim starts with a directory argument.
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

  " Exit Vim if NERDTree is the only window left.
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
augroup END


"## airline
let g:airline_powerline_fonts = 1


"## autopairs
let g:AutoPairsFlyMode=0


"## NERD commenter
let g:NERDSpaceDelims = 1


"## syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = 'npm run lint --'
let g:javascript_plugin_jsdoc = 1


"## fastfold
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:SimpylFold_docstring_preview = 1
let g:markdown_folding = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled = 7
let g:ruby_fold = 1
let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1


"## coc
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
" set nobackup
" set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=500

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


"## svelte
let g:vim_svelte_plugin_use_typescript=1


"## appearence
colorscheme NeoSolarized

"## GUI
if exists(':GuiFont')
  GuiFont! UbuntuMono\ NF:h13
elseif exists('g:fvim_loaded')
  set guifont=UbuntuMono\ NF:h17
elseif exists('g:neovide')
  set guifont=UbuntuMono\ NF:h14
  let g:neovide_cursor_antialiasing = v:false
  let g:neovide_cursor_vfx_mode = ""
  let g:neovide_cursor_animation_length = 0.02

  function! NeovideChangeFullscreen()
    let g:neovide_fullscreen = !g:neovide_fullscreen
  endfunction
  command! NeovideChangeFullscreen :call NeovideChangeFullscreen()
  noremap <F11> :NeovideChangeFullscreen()<CR>
else
  set guifont=UbuntuMono\ NF:h14
end
