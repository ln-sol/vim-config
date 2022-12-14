set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

" Ctrlp for fuzzy file search
Plug 'ctrlpvim/ctrlp.vim'

" File browser
Plug 'scrooloose/nerdtree'

" tab support for nerdtree
Plug 'jistr/vim-nerdtree-tabs'

" Snippet handler
" Plug 'SirVer/ultisnips'

" snippets for ultisnips
" Plug 'honza/vim-snippets'

" supertab for completion
" Plug 'ervandew/supertab'

" YouCompleteMe auto-completion
" Plug 'Valloric/YouCompleteMe'

" More clever matching for % key
Plug 'tmhedberg/matchit'

" JavaScript syntax highlighting
" Plug 'pangloss/vim-javascript'

" jsx syntax highlighting
" Plug 'mxw/vim-jsx'

" Language server protocol linter
" Plug 'w0rp/ale'

" fugitive.vim git integration
Plug 'tpope/vim-fugitive'

" Clojure highlight
" Plug 'guns/vim-clojure-static'

" Surround
Plug 'tpope/vim-surround'

" Repeat of plugin commands
Plug 'tpope/vim-repeat'

" Ack.vim -- can use ag with this
Plug 'mileszs/ack.vim'

" Haskell syntax
Plug 'neovimhaskell/haskell-vim'

call plug#end()
" All of your Plugins must be added before the following line

filetype plugin indent on    " required
syntax on

"Set the status line options.Make it show more information.
set laststatus=2
set statusline=%{FugitiveStatusline()}\ %F%m%r%h%w\ [BUF=%n]\ [FORMAT=%{&ff}]\ [FO=%{&fo}]\ [TYPE=%Y]\ [POS=%l,%v]\[%p%%]\ %{strftime(\"%d/%m/%y\ -\%H:%M\")}

"set line no, buffer, search, highlight, autoindent and more.
set nu
set hidden
set ignorecase
set incsearch
set smartcase
set showmatch
" set autoindent
set ruler
set vb
set noerrorbells
set showcmd
set mouse=a
set history=1000
set undolevels=1000

" highlight search results
set hlsearch

set list
set listchars=tab:>··,trail:·

hi SpecialKey ctermfg=darkgrey

" make delimitMate insert another line when 
" closing curlys for example
let delimitMate_expand_cr = 1

" make YCM load with python 3
let g:ycm_server_python_interpreter = '/usr/bin/python2'

" YCM non-arch package install path to ycm extra conf
"let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"

" YCM extra configuration for arch specific YCM package
"let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_path_to_python_interpreter = '/usr/bin/python2'

" Eclim completion method should be set to omnifunc in order to work with YCM
let g:EclimCompletionMethod = 'omnifunc'

" let syntastic handle the syntax checking
let g:ycm_show_diagnostics_ui = 0

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Leader maps
let mapleader=","
let maplocalleader="\\"
map <leader>n <plug>NERDTreeTabsToggle<CR>


autocmd VimEnter * wincmd p


"for ino completion
"autocmd BufNewFile,BufRead *.ino setlocal ft=arduino

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
" set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
" let g:tex_flavor='latex'

" Short commands -----------------------

" Searching for visually selected text
vnoremap // y/<C-R>"<CR>"

" For latex compiling
augroup latex_macros " {
	autocmd!
	autocmd FileType tex :nnoremap <leader>c :w<CR> :!latexmk -pdf % <CR>
	autocmd FileType tex :nnoremap <leader>v :!evince %:r.pdf &<CR><CR>
augroup END " }

" JavaScript macros
augroup html_macros " {
	autocmd!
	autocmd FileType html :nnoremap <leader>c :w<CR> :silent !firefox %:p &<CR>
augroup END " }

augroup javascript_macros " {
	autocmd!
	autocmd FileType javascript.jsx :nnoremap <localleader>df :YcmCompleter GoTo<CR>
augroup END " }

" JSON macros
augroup json_macros " {
	autocmd!
	autocmd FileType json :nnoremap <localleader>fm :%!python -m json.tool<CR>
augroup END " }

augroup haskell_stuff " {
	autocmd!
	autocmd BufNewFile,BufRead *.hsc set ft=haskell
augroup END " }

augroup c_stuff " {
	autocmd!
	autocmd BufNewFile,BufRead *.h set ft=c
augroup END " }

" Function for toggling the relative line numbers
function ToggleRelative()
	if &relativenumber==1
		set norelativenumber
	else
		set relativenumber
	endif
endfunction

" Macros for toggling relative number lines
noremap <F3> :call ToggleRelative()<CR>
inoremap <F3> <C-O>:call ToggleRelative()<CR>

function GrepAskForDir(specifier)
	let cw = expand("<cword>")
	let cwd = getcwd()
	call inputsave()
	let dir = input('Grep for word ' . cw . 'in dir: ')
	call inputrestore()
	execute 'Ack '. a:specifier . ' ' . dir
endfunction

noremap <leader>g :call GrepAskForDir(expand("<cword>"))<CR>

" Automatically user relative lines when not in insert mode 
au InsertLeave * :set relativenumber
au InsertEnter * :set norelativenumber


" Syntastic settings
"let g:syntastic_mode_map = {
"	\ "mode": "active",
"	\ "passive_filetypes": ["java", "scala"] }

" Ale linter settings
let g:ale_linters = {
\   'javascript': ['standard'],
\}
let g:ale_fixers = {'javascript': ['standard']}

"let g:ale_lint_on_text_changed = 'never'

" Ctrl-p settings
"let g:ctrlp_max_files = 30000
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:ale_linters_explicit = 1

" hlsearch
noremap <leader>h :nohlsearch<CR>

" Ack
if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif
