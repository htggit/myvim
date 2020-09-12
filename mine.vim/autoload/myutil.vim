function! myutil#get_visual_selection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "")
endfunction

func! myutil#get_snr(scriptName) abort
  redir => l:scriptNames
  silent! scriptnames
  redir END

  let l:home = substitute(expand('~'), '\\', '\\\\', 'g')

  for l:scriptName in split(l:scriptNames, '\n')
    let l:scriptList = split(l:scriptName, ':')
    let l:s = trim(substitute(join(l:scriptList[1:], ':'), '\~', l:home, ''))

    " :echomsg l:s
    if l:s ==? a:scriptName
      return str2nr(l:scriptList[0])
    endif
  endfor

  return -1
endfunc

func! myutil#get_current_buffer_name() abort
  redir => l:mybuffers
  silent ls
  redir END
  for l:mybuffer in split(l:mybuffers, '\n')
    let l:mypart = split(l:mybuffer, '\s\+')
    let l:filename = mypart[2] == '+' ? mypart[3] : mypart[2]
    if l:mypart[1] =~ '%'
      return substitute(substitute(l:filename, '"', '', 'g'), '\', '/', 'g')
    endif
  endfor
  return ''
endfunc
