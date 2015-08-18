"---Mappings and shortcuts---
nmap <F2> :NERDTreeToggle<CR>
nmap <leader>l :set list!<CR>
ca tn tabnew
"---Trailing characters---
set listchars=tab:▸\ ,eol:¬,trail:☠
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
"---Essentials---
set nu
syntax on
syntax enable
"---Search---
set ignorecase
set smartcase
set incsearch
set hls
"---Plugins---
execute pathogen#infect()
"---Color scheme---
set t_Co=16
set background=dark
colorscheme solarized
"---Project specific setting enable---
set exrc
set secure

let g:clang_format#code_style = "google"

augroup filetype
  au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END

augroup filetype
  au! BufRead,BufNewFile *.td     set filetype=tablegen
augroup END

filetype plugin indent on

"---Tabs and indentation---
set smartindent
if has("autocmd")
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType cpp setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType llvm setlocal ts=2 sts=2 sw=2 expandtab
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

nmap <leader>p :call <SID>StripTrailingWhitespaces()<CR>
autocmd BufWritePre *.cpp,*.h,*.ll,*.js,.vimrc :call <SID>StripTrailingWhitespaces()