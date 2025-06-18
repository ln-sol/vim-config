set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

" reload config files automatically
Plug 'xolox/vim-reload'

" Ctrlp for fuzzy file search
Plug 'ctrlpvim/ctrlp.vim'

" File browser
Plug 'scrooloose/nerdtree'

" More clever matching for % key
Plug 'tmhedberg/matchit'

" fugitive.vim git integration
Plug 'tpope/vim-fugitive'

" Surround
Plug 'tpope/vim-surround'

" Repeat of plugin commands
Plug 'tpope/vim-repeat'

" LSP support
Plug 'yegappan/lsp'

" more commplete
Plug 'girishji/vimcomplete'

" snippet support
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'

" Haskell syntax
Plug 'neovimhaskell/haskell-vim'

" Typescript syntax
Plug 'leafgarland/typescript-vim'

call plug#end()
" All of your Plugins must be added before the following line

language en_US.UTF-8

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

" show tabs and spaces
set list
set listchars=space:·,tab:..>,trail:·



autocmd VimEnter * wincmd p


" JSON macros
" TODO move to ftplugin
augroup json_macros " {
	autocmd!
	autocmd FileType json :nnoremap <localleader>fm :%!python -m json.tool<CR>
augroup END " }

" Haskell
augroup haskell_stuff " {
	autocmd!
	autocmd BufNewFile,BufRead *.hsc set ft=haskell
augroup END " }

" C
augroup c_stuff " {
	autocmd!
	autocmd BufNewFile,BufRead *.h set ft=c
augroup END " }



" Ctrl-p settings
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

digraphs \- 8866
digraphs -\ 8867
digraphs !( 8840
digraphs !) 8841
digraphs /< 10216
digraphs /> 10217
digraphs mt 8614
digraphs /( 8713
digraphs /) 8716

" Markdown
let g:markdown_fenced_languages = ['python', 'typescript', 'javascript', 'haskell']


" ############## AUTOCOMPLETE STUFF ##############

" ############## autocomplete

let autocomplete_opts = #{
	\ vsnip : #{ enable: v:true }
	\ }

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
" nmap        s   <Plug>(vsnip-select-text)
" xmap        s   <Plug>(vsnip-select-text)
" nmap        S   <Plug>(vsnip-cut-text)
" xmap        S   <Plug>(vsnip-cut-text)

" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
"let g:vsnip_filetypes = {}


" lsp support stuff
let g:lspOpts = #{
        \   aleSupport: v:false,
        \   autoComplete: v:true,
        \   autoHighlight: v:false,
        \   autoHighlightDiags: v:true,
        \   autoPopulateDiags: v:false,
        \   completionMatcher: 'case',
        \   completionMatcherValue: 1,
        \   diagSignErrorText: 'E>',
        \   diagSignHintText: 'H>',
        \   diagSignInfoText: 'I>',
        \   diagSignWarningText: 'W>',
        \   echoSignature: v:false,
        \   hideDisabledCodeActions: v:false,
        \   highlightDiagInline: v:false,
        \   hoverInPreview: v:false,
        \   ignoreMissingServer: v:false,
        \   keepFocusInDiags: v:true,
        \   keepFocusInReferences: v:true,
        \   completionTextEdit: v:true,
        \   diagVirtualTextAlign: 'above',
        \   diagVirtualTextWrap: 'default',
        \   noNewlineInCompletion: v:false,
        \   omniComplete: v:null,
        \   outlineOnRight: v:false,
        \   outlineWinSize: 20,
        \   semanticHighlight: v:false,
        \   showDiagInBalloon: v:true,
        \   showDiagInPopup: v:true,
        \   showDiagOnStatusLine: v:false,
        \   showDiagWithSign: v:true,
        \   showDiagWithVirtualText: v:false,
        \   showInlayHints: v:false,
        \   showSignature: v:true,
        \   snippetSupport: v:false,
        \   ultisnipsSupport: v:false,
        \   useBufferCompletion: v:false,
        \   usePopupInCodeAction: v:false,
        \   useQuickfixForLocations: v:false,
        \   vsnipSupport: v:false,
        \   bufferCompletionTimeout: 100,
        \   customCompletionKinds: v:false,
        \   completionKinds: {},
        \   filterCompletionDuplicates: v:false,
	\ }

autocmd User LspSetup call LspOptionsSet(lspOpts)


let lspServers = [#{
	\	  name: 'clang',
	\	  filetype: ['c', 'cpp'],
	\	  path: '/usr/bin/clangd',
	\	  args: ['--background-index', '--header-insertion=never']
	\ }]
autocmd User LspSetup call LspAddServer(lspServers)


" ============ LogE_* =================

" Toggle relative line numbers
function LogE_ToggleRelative()
	if &relativenumber==1
		set norelativenumber
	else
		set relativenumber
	endif
endfunction

" grep for arg in current or specified dir
function LogE_GrepAskForDir(what)
	call inputsave()
	let dir = input('grep -r "' . a:what . '" in directory (default is ./): ')
	call inputrestore()

	if !dir
		dir = './'
	endif

	execute 'grep  -r ' . a:what . ' ' . dir
endfunction

" ask for input of number, and set indentation width accordingly
" if input is '', setting defaults to
"	set tabstop=8 shiftwidth=8 noexpandtab
" if input is 'n', settings are set as
" 	set softtabstop=n shiftwidth=n expandtab
function LogE_SetIndentWidth()
	call inputsave()
	let l:width = input('Set ident: ')
	call inputrestore()
	if l:width==''
		set tabstop=8 shiftwidth=8 noexpandtab
	else
		let l:numw = str2nr(l:width, 10)
		execute 'set softtabstop=' . l:numw . ' shiftwidth=' . l:numw . ' expandtab'
	endif
endfunction

" terminal theme color adjustments
function LogE_ColorAdjust_TomorrowDark()
	hi SpecialKey ctermfg=darkgrey
	hi ColorColumn ctermbg=darkgrey
endfunction

function LogE_ColorAdjust_TomorrowLight()
	hi SpecialKey ctermfg=225
	hi ColorColumn ctermbg=225 " light pinkish
endfunction

call LogE_ColorAdjust_TomorrowDark()

let g:ColorAdjustments = [
	\ ['tomorrowDark', function("LogE_ColorAdjust_TomorrowDark")],
	\ ['tomorrowLight', function("LogE_ColorAdjust_TomorrowLight")],
	\ ]

let g:CurrColorAdjust=g:ColorAdjustments[0][0]

function LogE_ColorAdjust_Rotate()
	let found=v:false
	for kv in g:ColorAdjustments
		if found
			let g:CurrColorAdjust=kv[0]
			call kv[1]()
			return
		endif

		if kv[0] == g:CurrColorAdjust
			let found=v:true
		endif
	endfor

	" NOTE: will only end up here if we need to wrap around the list of
	" color adjustments
	let wrap=g:ColorAdjustments[0]
	let g:CurrColorAdjust=wrap[0]
	call wrap[1]()
	return
endfunction

" this is called from ftplugin scripts
function LogE_LspDiagShowSignToggle()
	if g:lspOpts.showDiagWithSign
		let g:lspOpts.showDiagWithSign = v:false
	else
		let g:lspOpts.showDiagWithSign = v:true
	endif

	call LspOptionsSet(g:lspOpts)
endfunction

" ================= key mappings ================

" <leader> is , (comma)
" <localleader> is \ (backslash)
let mapleader=","
let maplocalleader="\\"

" ----------- NORMAL MODE ------------------
" NERDTree*
noremap <leader>tn :NERDTreeToggle<CR>
noremap <leader>fn :NERDTreeFocus<CR>
noremap <leader>n  :NERDTreeFocus<CR>

" rotate through color adjustments
noremap <leader>ta :call LogE_ColorAdjust_Rotate()<CR>

" line numbers toggle
noremap <F3> :call LogE_ToggleRelative()<CR>

" grep current word
noremap <leader>gcw :call LogE_GrepAskForDir(expand("<cword>"))<CR>

" set indentation width
noremap <leader>si :call LogE_SetIndentWidth()<CR>

" ------------- VISUAL MODE ---------------
" Searching for visually selected text
vnoremap // y/<C-R>"<CR>"

" ------------- INSERT MODE ---------------
inoremap <F3> <F3>:call LogE_ToggleRelative()<CR>
