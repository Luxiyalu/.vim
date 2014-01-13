if v:progname =~? "evim"
  finish
endif
set nocompatible

" set maps
map <C-a> :NERDTreeToggle<CR>
map <C-c> :CSScomb<CR>
map <silent><leader>r :RRB<CR>
noremap! <C-f> <Right>
noremap! <C-b> <Left>

set guifont=Monaco:h15
execute pathogen#infect()
au BufNewFile,BufRead *.less set filetype=less
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
filetype plugin indent on

" autocompile less files
function LessToCss()
  let lessinput=shellescape(expand('%:p'))
  let cssoutput=shellescape(expand('%:r'))
  let command="silent !lessc " . lessinput . " > " . cssoutput . ".css"
  execute command
endfunction
autocmd BufWritePost,FileWritePost *.less call LessToCss()

" refresh in browser from vim
let g:RefreshRunningBrowserDefault = 'chrome'
let g:RefreshRunningBrowserReturnFocus = 0

if &t_Co > 2 || has("gui_running")
  syntax on
  colorscheme twilight
  set hlsearch
endif

set showcmd
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif