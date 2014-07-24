" Author: Vyom Shah
" Filename: .vimrc
" Description: Runtime configuration file for Vim text editor

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" turn off vi compatibility and error bells
set nocompatible
set noerrorbells

" yanks into system clipboard by default
set clipboard=unnamedplus

" backspace over everything
set backspace=indent,eol,start

" reduce time delay when returning to normal mode
set timeout
set timeoutlen=1000
set ttimeoutlen=0

" don't create backups in current directory
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

" make syntastic compatible with C++11
let g:syntastic_cpp_compiler = 'g++'

" start NERDTree if no files specified
autocmd vimenter * if !argc() | NERDTree | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filetype must be turned off before vundle section
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tpope/vim-fugitive'
call vundle#end()
filetype on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SYNTAX SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
set t_Co=256
colorscheme hybrid

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INDENTATION SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" my preferred indentation settings (1 tab = 4 spaces)
set autoindent
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" in assembly (SPARC/ARM) files, use 8 column tabs instead
autocmd BufRead,BufNewFile *.s set noexpandtab
autocmd BufRead,BufNewFile *.s set shiftwidth=8
autocmd BufRead,BufNewFile *.s set tabstop=8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCH SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" case only matters in search if uppercase characters are used
set ignorecase
set smartcase

" incremental search
set incsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LINE SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable modeline usage and show incomplete commands
set modeline
set showcmd
set noshowmode

" line length settings
set ruler
set textwidth=80
set number
set relativenumber

" automatically highlight long lines in red
highlight Over80 ctermbg=red ctermfg=white guibg=#592929
let w:long_line_match = matchadd('Over80', '\%>80v.\+', -1)

" disable trailing whitespace highlighting initially
autocmd vimenter * ToggleWhitespace

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AIRLINE SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" necessary to display airline
set laststatus=2

" airline configuration
let g:airline_enable_branch = 1
let g:airline_enable_syntastic = 1
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'simple'

" don't use symbol if it doesn't exist
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" unicode symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇  '
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" avoid pressing shift for every : in normal mode
nnoremap ; :
nnoremap : ;

" slightly alter db behavior to match dw
nnoremap db dbx

" shortcut for search and replace
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" toggle key for long line hightlighting
nnoremap <silent> <Leader>l
    \ :if exists('w:long_line_match') <Bar>
    \   silent! call matchdelete(w:long_line_match) <Bar>
    \   unlet w:long_line_match <Bar>
    \ elseif &textwidth > 0 <Bar>
    \   let w:long_line_match = matchadd('Over80', '\%>'.&tw.'v.\+', -1) <Bar>
    \ else <Bar>
    \   let w:long_line_match = matchadd('Over80', '\%>80v.\+', -1) <Bar>
    \ endif<CR>

" autocompletes curly brace
inoremap {<CR> {}<Left><CR><CR><Up><Tab>

" navigate splits using h,j,k,l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" easier tab manipulation
nnoremap <C-Left> :tabprev<CR>
nnoremap <C-Right> :tabnext<CR>

" use <F5> to toggle trailing whitespace highlight and <S-F5> to trim it
nnoremap <F5> :ToggleWhitespace<CR>
inoremap <F5> <Esc>:ToggleWhitespace<CR>i
nnoremap <C-F5> :StripWhitespace<CR>
inoremap <C-F5> <Esc>:StripWhitespace<CR>i

" indent in new lines, else do completion
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>
inoremap <C-Tab> <Tab>

" alternative snippet key because of tab shenanigans
imap <C-i> <Plug>snipMateNextOrTrigger
smap <C-i> <Plug>snipMateNextOrTrigger
smap <S-i> <Plug>snipMateBack

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COMMANDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cabbrev for tabs and splits
ca tn tabnew
ca tc tabclose
ca s split
ca vs vsplit

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" multipurpose tab key
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

