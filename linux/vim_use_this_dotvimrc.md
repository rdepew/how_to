Copy and paste this section of code, to create the .vimrc that works with 
the *vim-plug* Plug-in manager. See file *vim_plugins.md* for details.
```
set guifont=Fixed\ 10
set ruler
set number
set relativenumber
set hlsearch
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set laststatus=2 " for lightline
if !has('gui_running')
    set t_Co=256
endif

" Plugins will be downloaded under the specified directory
call plug#begin()

" Declare the list of plugins.
" LightLine replaces the status line.
Plug 'itchyny/lightline.vim'
" EasyMotion lets you move around faster.
Plug 'easymotion/vim-easymotion'
" Vim-commentary comments and uncomments lines faster.
Plug 'tpope/vim-commentary'
" Fuzzy finder.
Plug 'junegunn/fzf'
" Adds more editing commands, like 'delete inside single quotes'.
Plug 'wellle/targets.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

colo industry
```
