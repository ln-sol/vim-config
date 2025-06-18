map <leader>dd :LspDiagCurrent<CR>
map <leader>dn :LspDiagNext<CR>
map <leader>dp :LspDiagPrev<CR>

map <leader>er :LspRename<CR>

" toggle show diagnostic indicator next to line numbers
map <leader>td :call LogE_LspDiagShowSignToggle()<CR>

" ctags file names
set tags=tags;


set colorcolumn=+0
