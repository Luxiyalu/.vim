set nocompatible
set guifont=Monaco:h15
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set showcmd
set hlsearch
syntax on
colorscheme twilight
filetype plugin indent on
execute pathogen#infect()
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2

map <C-a> :NERDTreeToggle<CR>
map <C-c> :CSScomb<CR>
map <silent><leader>r :RRB<CR>
noremap! <C-f> <Right>
noremap! <C-b> <Left>

autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufWritePost,FileWritePost *.less execute "silent !lessc ".shellescape(expand('%:p'))." > ".shellescape(expand('%:r')).".css"

" refresh in browser from vim
let g:RefreshRunningBrowserDefault = 'chrome'
let g:RefreshRunningBrowserReturnFocus = 0

autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" 配置文件.vimrc更改后自动重新载入使设置生效
autocmd! bufwritepost .vimrc source ~/.vimrc
autocmd BufWritePost,FileWritePost .vimrc execute "cp .vimrc .vim/.vimrc"
map <silent> <leader>ss :source ~/.vimrc<cr>
map <silent> <leader>ee :e ~/.vimrc<cr>   
