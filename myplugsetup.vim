
" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "

if exists('g:vscode')
  finish
endif

if has('win32')
  source ~\.vim\mynerdtree.vim
  source ~\.vim\myairline.vim
else
  source ~/.vim/mynerdtree.vim
  source ~/.vim/myairline.vim
endif

" === coc === "
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" === echodoc === "
" Enable echodoc on startup
let g:echodoc#enable_at_startup = 1

" === vim-javascript === "
" Enable syntax highlighting for JSDoc
let g:javascript_plugin_jsdoc = 1

" === vim-jsx === "
" Highlight jsx syntax even in non .jsx files
let g:jsx_ext_required = 0

" === javascript-libraries-syntax === "
let g:used_javascript_libs = 'underscore,requirejs,chai,jquery'

" === Signify === "
let g:signify_sign_delete = '-'

" === Vista === "
let g:vista_default_executive = 'coc'

" === Workspace === "
if has('win32')
  let g:workspace_session_name = 'Thumbs.db'
  let g:workspace_persist_undo_history = 0
  let g:workspace_create_new_tabs = 0
  let g:workspace_autosave = 0
  let g:workspace_autosave_always = 0
  let g:workspace_autosave_untrailspaces = 0
  let g:workspace_session_disable_on_args = 1
else
  let g:workspace_session_directory = $HOME . '/.vim/sessions/'
  let g:workspace_persist_undo_history = 0
  let g:workspace_create_new_tabs = 0
  let g:workspace_autosave = 0
  let g:workspace_autosave_always = 0
  let g:workspace_autosave_untrailspaces = 0
  let g:workspace_session_disable_on_args = 1
endif

" === Clap === "
let g:clap_layout = { 'relative': 'editor' }
let g:clap_insert_mode_only = 1
let g:clap_theme = 'material_design_dark'

" Reload icons after init source
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif
