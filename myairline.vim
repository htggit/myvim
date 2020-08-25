" Wrap in try/catch to avoid errors on initial install before plugin is available
try
  let g:airline_theme = 'mine'

  " === Vim airline ==== "
  " Enable extensions
  let g:airline_extensions = ['branch', 'hunks', 'coc', 'tabline']

  let g:airline#extensions#coc#enabled = 1
  let g:airline#extensions#hunks#enabled = 1
  let g:airline#extensions#hunks#coc_git = 1

  " Update section z to just have line number
  "  let g:airline_section_z = airline#section#create(['linenr'])

  " Do not draw separators for empty sections (only for the active window) >
  let g:airline_skip_empty_sections = 1

"  let g:airline_section_c = airline#section#create(['%{myutil#get_current_buffer_name()}', '%m', '%{airline#util#wrap(airline#extensions#coc#get_status(), 0)}'])

  let airline#extensions#coc#error_symbol = 'E:'
  let airline#extensions#coc#warning_symbol = 'W:'
  let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
  let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

  " Customize vim airline per filetype
  " 'nerdtree'  - Hide nerdtree status line
  " 'list'      - Only show file type plus current line number out of total
  let g:airline_filetype_overrides = {
        \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', ''), '' ],
        \ 'list': [ '%y', '%l/%L'],
        \ }

  " Enable powerline fonts
  let g:airline_powerline_fonts = 0

  let g:airline_symbols_ascii = 1

  " Enable caching of syntax highlighting groups
  let g:airline_highlighting_cache = 1

  let g:airline#extensions#tabline#formatter = 'default'
  let g:airline#extensions#tabline#fnamecollapse = 1
  let g:airline#extensions#tabline#show_tab_nr = 1
  let g:airline#extensions#tabline#buffers_label = 'b'
  let g:airline#extensions#tabline#tabs_label = 't'
  let g:airline#extensions#tabline#overflow_marker = '…'
  let g:airline#extensions#tabline#current_first = 0
  let g:airline#extensions#tabline#buffer_idx_mode = 1

  " Define custom airline symbols
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
"  let g:airline_left_sep = ''
"  let g:airline_right_sep = ''
  let g:airline_symbols.space = ' '
"  let g:airline_symbols.crypt = 'C'
"  let g:airline_symbols.linenr = ''
"  let g:airline_symbols.maxlinenr = ''
"  let g:airline_symbols.branch = ''
"  let g:airline_symbols.paste = 'P'
  let g:airline_symbols.spell = ''
"  let g:airline_symbols.notexists = 'NE'
"  let g:airline_symbols.whitespace = 'Ξ'

  let g:airline_mode_map = {
      \ '__'     : '-',
      \ 'c'      : 'C',
      \ 'i'      : 'I',
      \ 'ic'     : 'I',
      \ 'ix'     : 'I',
      \ 'n'      : 'N',
      \ 'multi'  : 'M',
      \ 'ni'     : 'N',
      \ 'no'     : 'N',
      \ 'R'      : 'R',
      \ 'Rv'     : 'R',
      \ 's'      : 'S',
      \ 'S'      : 'S',
      \ ''     : 'S',
      \ 't'      : 'T',
      \ 'v'      : 'V',
      \ 'V'      : 'V',
      \ ''     : 'V',
      \ }
catch
  echo v:exception
  echo 'Airline not installed. It should work after running :PlugInstall'
endtry
