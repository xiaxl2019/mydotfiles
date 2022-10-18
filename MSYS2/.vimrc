" ===================================================================
"                                Plug
" ===================================================================
call plug#begin('~/.vim/plugged')

" Appearance
Plug 'itchyny/lightline.vim'
Plug 'itchyny/landscape.vim', { 'do': 'sed -i -e \"s/grey0/#2E3436/g\" -e \"/ModeMsg/d\" ./colors/landscape.vim' }
Plug 'itchyny/vim-cursorword'
Plug 'luochen1990/rainbow'
Plug 'ap/vim-css-color'

" Language-plug
Plug 'Vimjas/vim-python-pep8-indent'

" Easy-align
Plug 'junegunn/vim-easy-align'

" Nerd-commenter
Plug 'preservim/nerdcommenter'

" Tagbar
Plug 'preservim/tagbar', { 'on': 'TagbarOpen' }

" " ALE
" Plug 'dense-analysis/ale', { 'do': 'pip3 install --user flake8 cpplint' }

" " YCM
" Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clangd-completer' }

call plug#end()


" ===================================================================
"                             Plug setup
" ===================================================================
" Plug 'itchyny/lightline.vim'
set laststatus=2
let g:lightline = { 'colorscheme': 'one' }

" Plug 'itchyny/landscape.vim'
if has('termguicolors')
    set termguicolors
endif
colorscheme landscape

" Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
let g:rainbow_conf = {'guifgs': ['#007fff', '#ff5f00', '#3fff00', '#ef0000'],
            \         'guis': ['bold', 'bold', 'bold', 'bold'],
            \         'separately': {'cmake': 0},
            \         'operators': ''}

" Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Plug 'preservim/nerdcommenter'
let g:NERDCustomDelimiters = { 'python': { 'left': '#' } }
let g:NERDSpaceDelims = 1

" Plug 'preservim/tagbar'
nmap <F2> :TagbarOpen fj<CR>
let g:tagbar_sort = 0

" " Plug 'dense-analysis/ale'
" let g:ale_linters = {'python': ['flake8'], 'cpp': ['cpplint']}
" let g:ale_python_flake8_options = '--ignore E731 --max-line-length 120'
" let g:ale_cpp_cpplint_options = '--filter=-legal/copyright,-whitespace/line_length,-build/namespaces'

" " Plug 'ycm-core/YouCompleteMe'
" let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
" nnoremap gd :YcmCompleter GetDoc<CR>
" nnoremap \g :YcmCompleter GoTo<CR>
" nnoremap \b :bp<CR>
" nnoremap \f :YcmCompleter FixIt<CR>
" let g:ycm_autoclose_preview_window_after_completion=0
" let g:ycm_autoclose_preview_window_after_insertion=1


" ===================================================================
"                                 Map
" ===================================================================
nnoremap <leader>l :nohlsearch<CR>
nmap <leader>yy yy <leader>cc p

nnoremap <leader>q :q<CR>
nnoremap <s-Q> :qa<CR>
nnoremap <leader>w :w<CR>


" ===================================================================
"                               Options
" ===================================================================
set fileencoding=utf-8            " when saving a file
set fileencodings=utf-8,gbk,big5  " when opening a file
set encoding=utf-8

runtime macros/matchit.vim

set number ruler showcmd
set cursorline cursorlineopt=number
set list listchars=tab:\|▫,trail:▫

set noswapfile
set nrformats=unsigned
set splitbelow
set wildmenu

set expandtab tabstop=4 shiftwidth=4

autocmd FileType xml,html inoremap </ </<C-x><C-o>

set backspace=indent,eol,start
set incsearch hlsearch

" ===================================================================
"                              Vimscript
" ===================================================================
if filereadable(expand("~/.vim/SaveAndRun.vim"))
    source ~/.vim/SaveAndRun.vim
endif
if filereadable(expand("~/.vim/NewFile.vim"))
    source ~/.vim/NewFile.vim
endif
