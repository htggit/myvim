" ============================================================================ "
" ===                                 AUTOCMD:                             === "
" ============================================================================ "

augroup mygroup
  autocmd!

  " Automaticaly close nvim if NERDTree is only thing left open
  "autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  " Enable spellcheck for markdown files
  autocmd! BufRead,BufNewFile *.md setlocal spell

  if has('nvim')
    autocmd! TermOpen * startinsert
    autocmd! TermLeave * stopinsert
  endif

  autocmd! FileType floaterm,nerdtree,help setl nospell | setl number | setl relativenumber | setl signcolumn=no

  " === Coc.nvim === "
  "Close preview window when completion is done.
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

  autocmd! User ClapOnExit AirlineRefresh | echomsg 'bbbbbb'

  " Highlight the symbol and its references when holding the cursor.
  autocmd! CursorHold * silent call CocActionAsync('highlight')

  " Setup formatexpr specified filetype(s).
  autocmd! FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd! User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END

command! MyCopy let g:my_copy_source_file = expand('%:p')|let g:my_copy_filename = expand('%:t')|echo g:my_copy_source_file
command! MyPaste call <SID>PasteFile()
function! s:PasteFile() abort
  let l:target_file_name = input("Target: ", expand("%:p:h") . "\\" . g:my_copy_filename, "file")
  if l:target_file_name != ''
    let l:yesno = input("\ncp\nfrom: " . g:my_copy_source_file . "\n" . "to  : " . l:target_file_name . "?(y/n)")
    if tolower(l:yesno) == 'y'
      let g:my_copy_command = printf("cp \"%s\" \"%s\"", g:my_copy_source_file, l:target_file_name)
      let l:result = system(g:my_copy_command)
      echomsg l:result
    endif
  endif
endfunction

" Add `:Format` command to format current buffer.
command! -nargs=0 MyFormat :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? MyFold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 MyImport :call CocAction('runCommand', 'editor.action.organizeImport')
