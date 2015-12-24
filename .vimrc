"---Mappings and shortcuts---
nmap <F2> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <leader>l :set list!<CR>
nmap <leader>i :set paste!<CR>
nmap <leader>gi :YcmCompleter GoToInclude<CR>
nmap <leader>gb :YcmCompleter GoToDeclaration<CR>
nmap <leader>gd :YcmCompleter GoToDefinition<CR>
nmap <leader>gt :YcmCompleter GoTo<CR>
nmap <leader>st :YcmCompleter GetType<CR>
nmap <leader>sp :YcmCompleter GetParent<CR>
nmap <leader>f :YcmCompleter FixIt<CR>
nmap <leader>sd :YcmCompleter GetDoc<CR>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
ca tn tabnew
"---Trailing characters---
set encoding=utf-8
set listchars=tab:▸\ ,eol:¬,trail:☠
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
"---Essentials---
set nocompatible
set nu
set wildmenu
set wildmode=full
set history=2000
syntax on
syntax enable
"---Search---
set ignorecase
set smartcase
set incsearch
set hls
"---Plugins---
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-pathogen'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-afterimage'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/Conque-Shell'

Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Superbil/llvm.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
execute pathogen#infect()
"---Color scheme---
set t_Co=16
set background=dark
"---Project specific setting enable---
set exrc
set secure

let g:clang_format#code_style = "file"

augroup filetype
  au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END

augroup filetype
  au! BufRead,BufNewFile *.td     set filetype=tablegen
augroup END

filetype plugin indent on

"---Tabs and indentation---
set ts=2 sts=2 sw=2 noexpandtab
set smartindent
if has("autocmd")
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType cpp setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType llvm setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType cmake setlocal ts=2 sts=2 sw=2 expandtab
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" nmap <leader>p :call <SID>StripTrailingWhitespaces()<CR>
" autocmd BufWritePre *.cpp,*.h,*.ll,*.js,.vimrc,CMakeLists.txt :call <SID>StripTrailingWhitespaces()
