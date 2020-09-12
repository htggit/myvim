" ============================================================================ "
" ===                             KEY MAPPINGS                             === "
" ============================================================================ "
if exists('g:vscode')
  finish
endif

" === Search shorcuts === "
"   <leader>h - Find and replace
"   <leader>/ - Claer highlighted search terms while preserving history
nmap <nowait><leader>h :%s///<left><left>
nmap <nowait><leader>/ :nohlsearch<CR>
" Allows you to save files you opened without write permissions via sudo
cmap w!! w !sudo tee %

" Delete current visual selection and dump in black hole buffer before pasting
" Used when you want to paste over something without it getting copied to
" Vim's default buffer
vnoremap <nowait><leader>p "_dP

nmap <leader>ss :<C-u>update<CR>
nmap <leader>sa :<C-u>wall<CR>
nmap <leader>so :<c-u>exe ":if &filetype == 'vim'\|source %\|endif"<CR>
nmap <leader>sp :<C-u>exe ":if &spell == 1\|setl nospell\|else\|setl spell\|endif"<CR>
nmap <leader>ba :<C-U>exe ':breakadd func <SNR>' . myutil#get_snr(expand("%:p")) . '_' . expand("<cword>")<CR>

" === Easy-motion shortcuts ==="
"   <leader>w - Easy-motion highlights first word letters bi-directionally
" nmap <nowait> <leader>w <Plug>(easymotion-bd-w)
nmap <nowait> <leader>w :<c-u>call <SID>my_easymotion()<cr>
function! s:my_easymotion() abort
  CocDisable
  call EasyMotion#WB(0,2)
  CocEnable
endfunction

xmap <a-/> :call NERDComment("x", "Toggle")<CR>
nmap <a-/> :call NERDComment("n", "Toggle")<CR>

" Quick window switching
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-q> <C-w>q
nmap <C-x> :<c-u>call <SID>my_kill_buffer('^')<CR>

nmap  <nowait><leader>qq :<c-u>call <SID>my_quit_all()<CR>
function! s:my_quit_all() abort
  NERDTreeClose
  if floaterm#buflist#find_curr() != -1
    FloatermKill
  endif
  qa
endfunction

nmap <a-x> :<c-u>call <SID>my_kill_buffer('k')<CR>
function! s:my_kill_buffer(page) abort
  let l:bufnr = bufnr()
  if a:page == '^'
    try
      exe "normal \<c-^>"
    catch /.*/
      bn
    endtry
  else
    bn
  endif
  exe ":bd " . l:bufnr
  bn
  bp
endfunction
nmap <nowait> <c-p> :<C-u>bp<CR>
nmap <nowait> <c-n> :<C-u>bn<CR>

nmap <nowait><leader><leader> <PageDown>
nmap <nowait><leader>, <PageDown>
nmap <nowait><leader>. <PageUp>

cmap <c-a> <home>
cmap <c-e> <end>
cmap <c-b> <left>
cmap <c-f> <right>
cmap <c-d> <delete>
cmap <c-h> <bs>

" === Nerdtree shorcuts === "
nmap <nowait> <leader>nn :NERDTreeToggle<CR>
nmap <nowait> <leader>nf :NERDTreeFind<CR>

" === vim-jsdoc shortcuts ==="
" Generate jsdoc for function under cursor
nmap <nowait><leader>zz :JsDoc<CR>

" === coc.nvim === "
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <nowait><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <nowait><expr> <c-space> coc#refresh()
else
  inoremap <nowait><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
inoremap <expr> <cr> <SID>confirm_completion()
function! s:confirm_completion() abort
  if exists('*complete_info')
    if complete_info()["selected"] != "-1"
      return "\<C-y>"
    else
      return "\<C-g>u\<CR>"
    endif
  else
    if pumvisible()
      return "\<C-y>"
    else
      return "\<C-g>u\<CR>"
    endif
  endif
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <nowait> [g <Plug>(coc-diagnostic-prev)
nmap <nowait> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <nowait> gd <Plug>(coc-definition)
nmap <nowait> gy <Plug>(coc-type-definition)
nmap <nowait> gi <Plug>(coc-implementation)
nmap <nowait> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <nowait> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    exe 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
nmap <leader>ff  <Plug>(coc-format)
xmap <leader>fs  <Plug>(coc-format-selected)
nmap <leader>fs  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>as  <Plug>(coc-codeaction-selected)
nmap <leader>as  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <nowait> <C-s> <Plug>(coc-range-select)
xmap <nowait> <C-s> <Plug>(coc-range-select)

" Mappings for CoCList

" use <tab> for trigger completion and navigate to next complete item
inoremap <nowait><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction


" Find symbol of current document.
nnoremap <nowait> <leader>co  :<C-u>CocList outline<cr>
" Do default action for next item.
nnoremap <nowait> <leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <nowait> <leader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <nowait> <leader>cr  :<C-u>CocListResume<CR>
nnoremap <nowait> <leader>cs  :<C-u>CocList -I symbols<cr>
nmap <a-p> :<C-u>CocList -N files<CR>
nmap <a-f> :<C-u>CocList -N -A -I grep<CR>
xmap <a-f> :<C-u>call <SID>my_coc_grep()<CR>
function! s:my_coc_grep() abort
  let l:sel = substitute(trim(myutil#get_visual_selection()), ' ', '', 'g')
  exe "CocList -N -A -I --input=" . l:sel . " grep"
endfunction

"nmap <nowait><leader>pp :<C-u>Clap files<CR>
"nmap <nowait><leader>er :<C-u>Clap filer<CR>
"nmap <nowait><leader>ee :<C-u>call <SID>run_clap_local('Clap filer')<CR>
"nmap <nowait><leader>gi :<C-u>Clap grep<CR>
"nmap <nowait><leader>gw :<C-u>Clap grep ++query=<cword><CR>
"xmap <nowait><leader>gw :<C-u>Clap grep ++query=@visual<CR>
"function! s:run_clap_local(clapCommand) abort
  "cd %:h
  "exe a:clapCommand
  "cd -
"endfunction
"nmap <nowait><leader>bb :<C-u>Clap buffers<CR>
"nmap <nowait><leader>si :<C-u>Clap blines<CR>
"nmap <nowait><leader>sw :<C-u>Clap blines ++query=<cword><CR>
"xmap <nowait><leader>sw :<C-u>Clap blines ++query=@visual<CR>
"nmap <nowait><leader>gd :<C-u>Clap git_diff_files<CR>
"nmap <nowait><leader>gf :<C-u>Clap git_files<CR>
"nmap <nowait><leader>gl :<C-u>Clap commits<CR>

" === vim-better-whitespace === "
"   <leader>y - Automatically remove trailing whitespace
nmap <nowait><leader>st :StripWhitespace<CR>

" === floatterm ==="
nnoremap <F9>  :FloatermNew<CR>
tnoremap <F9>  <C-\><C-n>:FloatermNew<CR>
nnoremap <F10>  :FloatermPrev<CR>
tnoremap <F10>  <C-\><C-n>:FloatermPrev<CR>
nnoremap <F11>  :FloatermNext<CR>
tnoremap <F11>  <C-\><C-n>:FloatermNext<CR>
nnoremap <a-`> :FloatermToggle<CR>
tnoremap <a-`> <C-\><C-n>:FloatermToggle<CR>tnoremap <c-o> <c-\><c-n>
tnoremap <c-k> <c-\><c-n> <c-w>p
tnoremap <c-n> <c-\><c-n> :FloatermNext<CR>
tnoremap <c-p> <c-\><c-n> :FloatermPrev<CR>

" === airline buffer shortcuts ==="
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>= <Plug>AirlineSelectNextTab

