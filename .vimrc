set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
Bundle 'https://github.com/Valloric/YouCompleteMe.git'
Bundle 'https://github.com/jiangmiao/auto-pairs'
Bundle 'https://github.com/tpope/vim-surround'
Bundle 'https://github.com/vim-scripts/matchit.zip'
Bundle 'https://github.com/csscomb/vim-csscomb'
Bundle 'https://github.com/mkitt/browser-refresh.vim'
Bundle 'https://github.com/scrooloose/nerdtree'
Bundle 'https://github.com/scrooloose/nerdcommenter'
Bundle 'https://github.com/SirVer/ultisnips'
Bundle 'https://github.com/mattn/emmet-vim'
Bundle 'https://github.com/shemerey/vim-peepopen'
Bundle 'https://github.com/vim-scripts/bufexplorer.zip'
Bundle 'https://github.com/c9s/gsession.vim'
Bundle 'https://github.com/vim-scripts/quicksession.vim'

" set
set nowrap
set number
set linebreak
set formatoptions=l
set guifont=Monaco:h15
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set showcmd
set hlsearch
set showbreak=\ \ \ \ \ \ \ \ \ \ \ \ 

"mapkeys
map <C-a> :NERDTreeToggle<CR>
map <silent><leader>c :CSScomb<CR>
map <silent><leader>r :RRB<CR>
map <silent><leader>t <leader>be<Down>t
map <silent><leader>w :set wrap!<CR>
map <silent><leader>ee :e ~/.vimrc<cr>
map <silent><leader>oo :exe 'silent !open .'<CR>
noremap! <C-f> <Right>
noremap! <C-b> <Left>

" auto complete
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
" tabs navigation
let s:windowmapnr = 0
let s:wins='1234567890!@#$%^&*()'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
while (s:windowmapnr < strlen(s:wins))
    exe 'noremap <silent> <D-' . s:wins[s:windowmapnr] . '> ' . (s:windowmapnr + 1) . 'gt'
    exe 'inoremap <silent> <D-' . s:wins[s:windowmapnr] . '> <C-O>' . (s:windowmapnr + 1) . 'gt'
    exe 'cnoremap <silent> <D-' . s:wins[s:windowmapnr] . '> <C-C>' . (s:windowmapnr + 1) . 'gt'
    exe 'vnoremap <silent> <D-' . s:wins[s:windowmapnr] . '> <C-C>' . (s:windowmapnr + 1) . 'gt'
    let s:windowmapnr += 1
endwhile
unlet s:windowmapnr s:wins

syntax on
colorscheme twilight
execute pathogen#infect()
filetype plugin indent on
au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType css,less setl ofu=csscomplete#CompleteCSS
au FileType vim,ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
au BufNewFile,BufRead *.less set filetype=less

" refresh in browser from vim
let g:RefreshRunningBrowserDefault = 'chrome'
let g:RefreshRunningBrowserReturnFocus = 0

autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

