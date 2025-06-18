set softtabstop=8 shiftwidth=8 noexpandtab

map <leader>dd :LspDiagCurrent<CR>
map <leader>dn :LspDiagNext<CR>
map <leader>dp :LspDiagPrev<CR>

map <leader>er :LspRename<CR>

" toggle show diagnostic indicator next to line numbers
map <leader>td :call LogE_LspDiagShowSignToggle()<CR>
