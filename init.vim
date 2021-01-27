call plug#begin('~/.vim/plugged')

Plug 'Yggdroot/indentLine'
Plug 'crusoexia/vim-monokai'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'preservim/nerdcommenter'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'theniceboy/eleline.vim'

call plug#end()

"editor behaviors
set updatetime=100
set number
set autoindent
set noexpandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set foldmethod=marker
set ignorecase
set smartcase
set t_Co=256
set mouse=a
"editor behavios

"terminal behaviors
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>:q<CR>
"terminal behaviors

"tab management

	" Move around tabs with tn and ti
noremap ti :-tabnext<CR>
noremap tn :+tabnext<CR>
	" Opening a terminal window
noremap ter :tabe<CR>:term<CR>

"tab management

" indent line
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
" indent line

"scheme monokai
colorscheme monokai
"scheme monokai

"coc.nvim

let g:coc_global_extensions = [
	\ 'coc-json', 
	\ 'coc-vimlsp',
	\ 'coc-marketplace',
	\ 'coc-python',
	\ 'coc-clangd',
	\ 'coc-sh',
	\ 'coc-pyright',
	\ 'coc-syntax',
	\ 'coc-snippets',
	\ 'coc-markdownlint',
	\ 'coc-html',
	\ 'coc-css',
	\ 'coc-pairs'
	\ ]

set shortmess+=c
set signcolumn=yes

	"tab select
noremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	  let col = col('.') - 1
	    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
	
	" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

	" Make <CR> auto-select the first completion item and notify coc.nvim to
	" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


	" Use `[g` and `]g` to navigate diagnostics
	" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

	" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

	" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

	" Highlight the symbol and its references when holdingthe cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

	" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

	" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
	autocmd!
		" Setup formatexpr specified filetype(s)
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
		" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync'(showSignatureHelp')
augroup end
	
	" remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

	" Mappings for CoCList
	" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
	" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
	" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
	" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
	" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
	" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
	" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
	" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"coc.nvim


"nerdcommander
	
	" Create default mappings
let g:NERDCreateDefaultMappings = 1

	" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

	" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

	" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

	" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

	" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

	" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

	" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

	" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

"nerdcommander


"markdown-preview

let g:mkdp_auto_start = 0
let g:mkdp_open_to_the_world = 1
let g:mkdp_open_ip = '0.0.0.0'
let g:mkdp_port = 8080
function! g:Open_browser(url)
	silent exe '!lemonade open 'a:url
endfunction
let g:mkdp_browserfunc = 'g:Open_browser'

"markdown-preview

"eleline.vim
set laststatus=2
"eleline.vim
