" https://github.com/SpaceVim/SpaceVim/blob/master/autoload/SpaceVim/custom.vim#L78
" function! SpaceVim#custom#SPC(m, keys, cmd, desc, is_cmd) abort
"    call add(g:_spacevim_mappings_space_custom,[a:m, a:keys, a:cmd, a:desc, a:is_cmd])
" endfunction

function! myspacevim#before() abort
    call SpaceVim#custom#SPCGroupName(['o'], '+Open')
    call SpaceVim#custom#SPC('nnoremap', ['o', 'p'], 'VimFiler -find', 'find-file-in-file-tree', 1)

    call SpaceVim#custom#SPC('nnoremap', ['f', 'j'], 'Ranger', 'ranger', 1)
    call SpaceVim#custom#SPC('nnoremap', ['c', 'f'], 'Neoformat', 'format-code', 1)
    call SpaceVim#custom#SPC('nnoremap', ['t', 'c'], 'ColorToggle', 'rainbow-mode', 1)
    call SpaceVim#custom#SPC('nnoremap', ['b', 'r'], 'e', 'Reload', 1)
endfunction

function! myspacevim#after() abort
    let g:colorizer_maxlines = 1000

    " Enable italic
    highlight Comment cterm=italic gui=italic

    " Allow backspace and cursor keys to cross line boundaries
    set whichwrap+=<,>,h,l

    " Smart search
    set ignorecase

    " black hole register
    vmap <backspace> "_d
    vmap <del> "_d

    map <M-p> :CtrlP<CR>
    map <M-s> :wall<CR>
    map <M-e> :Unite file_mru<CR>

    " ===================================================
    " emacs keymaping for cursor movement
    " ===================================================
    nmap <c-g> <Esc>
    vmap <c-g> <Esc>
    nmap <c-a> ^
    nmap <c-e> $
    vmap <c-a> ^
    vmap <c-e> $
    inoremap <c-p> <up>
    inoremap <c-n> <down>
    " command line mode
    cmap <C-p> <Up>
    cmap <C-n> <Down>
    cmap <C-b> <Left>
    cmap <C-f> <Right>
    cmap <C-a> <Home>
    cmap <C-e> <End>
    cnoremap <C-d> <Del>
    cnoremap <C-h> <BS>

    " ===================================================
    " Tmux
    " ===================================================
    " Prompt for a command to run
    map <Leader>vp :VimuxPromptCommand<CR>
    " Run last command executed by VimuxRunCommand
    map <Leader>vl :VimuxRunLastCommand<CR>
    " Inspect runner pane
    map <Leader>vi :VimuxInspectRunner<CR>
    " Zoom the tmux runner pane
    map <Leader>vz :VimuxZoomRunner<CR>

    let g:tmux_navigator_no_mappings = 1

    nnoremap <silent> <C-x> h :TmuxNavigateLeft<cr>
    nnoremap <silent> <C-x> j :TmuxNavigateDown<cr>
    nnoremap <silent> <C-x> k :TmuxNavigateUp<cr>
    nnoremap <silent> <C-x> l :TmuxNavigateRight<cr>

    " ===================================================
    " Visual-at
    " ===================================================
    xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
    function! ExecuteMacroOverVisualRange()
      echo "@".getcmdline()
      execute ":'<,'>normal @".nr2char(getchar())
    endfunction

endfunction
