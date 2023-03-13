let mapleader = ","

nnoremap <silent> <leader>/ :let @/=''<enter>
nnoremap <S-J> o<Esc>
nnoremap <S-K> O<Esc>


syntax on
set number
set noswapfile
set hlsearch
set ignorecase
set incsearch

set noet

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


if !exists('g:vscode')

" vim-plug
call plug#begin()

" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'

call plug#end()

" aesthetics
colorscheme nord
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#tabnr_formatter = 'tabnr'
let g:airline#extensions#tabline#show_tab_nr = 1

" vimwiki sync with nextcloud notes
" use pandoc to convert to html or pdf
let g:vimwiki_list = [{'path': '~/Notes/',
                       \ 'syntax': 'markdown', 
                       \ 'auto_toc' : 1,
                       \ 'ext': '.md',
                       \ 'path_html': '~/Notes/html',
                       \ }]
" coc.nvim config

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                             \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()


" python stuff
let g:virtualenv = "~/.config/nvim/venv"
let g:python3_host_prog = g:virtualenv . "/bin/python3"

let g:black_linelength = 80
let g:black_virtualenv = g:virtualenv

autocmd FileType python setlocal cc=80
autocmd FileType python nnoremap <buffer> <leader>f :Black<cr>
autocmd FileType python nnoremap <buffer> <leader>t A<space><space>#<space>type:<space>ignore<esc>

func! GDScriptSettings() abort
    setlocal foldmethod=expr
    nnoremap <leader>gg :GodotRunCurrent<CR>
    nnoremap <leader>g<leader> :GodotRun
endfunc

augroup godot | au!
    au FileType gdscript call GDScriptSettings()
augroup end

endif
