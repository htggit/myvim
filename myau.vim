" ============================================================================ "
" ===                                 MISC.                                === "
" ============================================================================ "

augroup mygroup
  autocmd!

  " Automaticaly close nvim if NERDTree is only thing left open
  " autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  autocmd FileType nerdtree setl number | setl relativenumber | setl signcolumn=no

  " Enable spellcheck for markdown files
  autocmd BufRead,BufNewFile *.md setlocal spell

  "Close preview window when completion is done.
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')

  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

  if has('nvim')
    autocmd TermOpen * startinsert
  endif
augroup end

