"colorscheme atom-dark-256

set autoindent
set backspace=2
set balloondelay=250
set incsearch
set mouse=a
set nocompatible
set noexpandtab
set nowrap
set number
set path+=**
set relativenumber
set shiftwidth=4
set signcolumn=number
set smartindent
set softtabstop=0
set tabstop=4
set ttymouse=sgr
set updatetime=500
set wildmenu
set cursorline
syntax enable
filetype plugin indent on

set background=dark
colorscheme Base2Tone_SpaceDark
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
highlight link SignColumn LineNr
highlight clear LineNr
highlight clear CursorLine
highlight CursorLineNR ctermbg=NONE cterm=NONE ctermfg=white

command! MakeTags !ctags -R .

nnoremap ,html :-1read /home/thealamu/.vim/.skeleton/html<CR>3jwf>a
nnoremap ,lrem :-1read /home/thealamu/.vim/.skeleton/lorem<CR>
nnoremap ,go :-1read /home/thealamu/.vim/.skeleton/go<CR>3ji<TAB>

nmap <silent> <C-n> :NERDTreeToggle<CR>
map <C-h> <C-W>h
map <C-l> <C-W>l
"<C-j> is being used for the floaterm
map <C-k> <C-W>k
nmap <silent> <C-?> : <C-u>call GOVIMHover()<CR>

if has("patch-8.1.1904")
	  set completeopt+=popup
	  set completepopup=align:menu,border:off,highlight:Pmenu
endif

" Abbreviations
"
iabbrev reterr if err != nil {<CR>return err<CR><BS>}

" Plugins...
"
call plug#begin('~/.vim/plugged')

" List plugins here
Plug 'neoclide/coc.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'voldikss/vim-floaterm'
"Plug 'joshdick/onedark.vim'
"Allow autoclose paired characters like [,] or (,),
Plug 'jiangmiao/auto-pairs'
"Highlights the matching HTML tag when the cursor is positioned on a tag.
Plug 'Valloric/MatchTagAlways'
"Valloric/MatchTagAlways"
nnoremap <leader>% :MtaJumpToOtherTag<cr>
let g:mta_filetypes = {
            \ 'html' : 1, 'xhtml' : 1, 'xml' : 1,
            \ 'javascript' : 1,
            \ 'javascript.jsx' : 1,
            \ 'javascript.tsx' : 1,
            \ 'typescript.tsx' : 1,
            \ 'typescript' : 1
            \}

" Initialize plugin system
call plug#end()

" Floating terminal styles and mappings
let g:floaterm_height=0.4

nnoremap <silent> <C-j> <C-\><C-n>:FloatermToggle<CR>
inoremap <silent> <C-j> <C-\><C-n>:FloatermToggle<CR>
tnoremap <silent> <C-j> <C-\><C-n>:FloatermToggle<CR>

nnoremap <silent> <C-?> :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if &filetype == 'vim'
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction



cabbrev fuz Rg<CR>
cabbrev buf Buffers<CR>
cabbrev hist History<CR>
cabbrev file Files<CR>


" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	  let col = col('.') - 1
	    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
	  \ pumvisible() ? "\<C-n>" :
	  \ <SID>check_back_space() ? "\<Tab>" :
	  \ coc#refresh()


" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" use <c-space>for trigger completion
inoremap <silent><expr> <NUL> coc#refresh()

"Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Code Actions
"nmap <expr> <c-p> CocAction('action')

nmap <silent> <C-]> <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Format on save
autocmd BufWritePre * call CocAction('format')
" :Format command also formats
command! -nargs=0 Format :call CocAction('format')

" Symbol renaming
nmap <F6> <Plug>(coc-rename)
