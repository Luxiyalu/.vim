let g:NERDTreeWinSize = &columns * 4/10 - 1

" Map NerdTree
function! ToggleNerdTree()
    let l:nerdtree_open = nerdtree#isTreeOpen()

    if l:nerdtree_open
        execute "set columns=".(s:columns) 
        execute "winpos ".s:windowx." ".s:windowy
    else
        let s:windowx = getwinposx()
        let s:windowy = getwinposy()
        let s:columns = &columns
        execute "set columns=".(&columns*14/10) 
    endif

    execute "NERDTreeToggle"
endfunction
nmap ;n :call ToggleNerdTree()<CR>
