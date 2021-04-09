if has('win32')
    let $VIMCONFIGDIR = expand($LOCALAPPDATA) . '/nvim'
else
    let $VIMCONFIGDIR = expand($HOME) . '/.config/nvim'
endif

try
    source $VIMCONFIGDIR/nvide.vim
endtry

source $VIMCONFIGDIR/general/plugins.vim
source $VIMCONFIGDIR/general/settings.vim
source $VIMCONFIGDIR/general/mappings.vim
source $VIMCONFIGDIR/general/netrw.vim
source $VIMCONFIGDIR/general/commands.vim
source $VIMCONFIGDIR/general/cyrrinput.vim

source $VIMCONFIGDIR/plug-config/airline.vim
source $VIMCONFIGDIR/plug-config/syntastic.vim
source $VIMCONFIGDIR/plug-config/fastfold.vim
source $VIMCONFIGDIR/plug-config/autopairs.vim
source $VIMCONFIGDIR/plug-config/coc.vim
source $VIMCONFIGDIR/plug-config/svelte.vim
