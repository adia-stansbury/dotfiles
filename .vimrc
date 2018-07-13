set nocompatible
filetype plugin on
filetype off

" FINDING FILES

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" Vimwiki
autocmd FileType vimwiki hi VimwikiHeader1 ctermfg=Yellow
autocmd FileType vimwiki hi VimwikiHeader2 ctermfg=Green
autocmd FileType vimwiki hi VimwikiHeader3 ctermfg=DarkMagenta
autocmd FileType vimwiki hi VimwikiHeader4 ctermfg=DarkBlue
autocmd FileType vimwiki hi VimwikiHeader5 ctermfg=DarkCyan
autocmd FileType vimwiki hi VimwikiHeader6 ctermfg=DarkYellow

if filereadable(expand("~/.vimrc.bundles"))
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  source ~/.vimrc.bundles

  call vundle#end()            " required
endif

set number
set backspace=indent,eol,start  " Allow backspace in insert mode
set incsearch                   " show search matches as you type
set smartcase                   " ignore case if search pattern is all lowercase
set hlsearch                    " highlight search terms
set gcr=a:blinkon0              " Disable cursor blink
set encoding=utf-8              " Necessary to show Unicode glyphs
set laststatus=2                " Always display the statusline in all windows
set noshowmode                  " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set noswapfile
set hidden
set foldmethod=syntax
set nofoldenable
syntax on
syntax enable
colorscheme ron

set tabstop=2
set shiftwidth=2
set expandtab

set clipboard=unnamed

let mapleader = " "
let maplocalleader = ","

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap jj <ESC>

set list listchars=tab:»·,trail:·

imap <C-v> <C-r>*
nmap <leader>l :nohlsearch<CR>
nmap <leader>w :w<CR>
nmap <unique> <silent> <Leader>b <Plug>SelectBuf

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoes"Use d"<CR>
nnoremap <Down> :echoe "Use s"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Run tests

let g:html_indent_tags = 'li\|p'
let g:vimrubocop_config = "/Users/astansbury/plm-website"

filetype plugin indent on

" Automatically remove all trailing whitespace after saving
autocmd BufWritePre * :%s/\s\+$//e

" Ctrl P config
"Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l -f --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Make it obvious where 120 characters is
set textwidth=120
set colorcolumn=+1

"Use alternate matcher
" http://blog.mikecordell.com/2015/01/27/better-fuzzy-search-with-ctrl-p-in-vim.html
if executable('matcher')
    let g:ctrlp_match_func = { 'match': 'GoodMatch' }

    function! GoodMatch(items, str, limit, mmode, ispath, crfile, regex)

      " Create a cache file if not yet exists
      let cachefile = ctrlp#utils#cachedir().'/matcher.cache'
      if !( filereadable(cachefile) && a:items == readfile(cachefile) )
        call writefile(a:items, cachefile)
      endif
      if !filereadable(cachefile)
        return []
      endif

      " a:mmode is currently ignored. In the future, we should probably do
      " something about that. the matcher behaves like "full-line".
      let cmd = 'matcher --limit '.a:limit.' --manifest '.cachefile.' '
      if !( exists('g:ctrlp_dotfiles') && g:ctrlp_dotfiles )
        let cmd = cmd.'--no-dotfiles '
      endif
      let cmd = cmd.a:str

      return split(system(cmd), "\n")

    endfunction
end
nmap <leader>p :CtrlP<cr>
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
" interpret space as either <space> or _ when matching files
let g:ctrlp_abbrev = {
    \ 'gmode': 't',
    \ 'abbrevs': [
        \ {
        \ 'pattern': '\(^@.\+\|\\\@<!:.\+\)\@<! ',
        \ 'expanded': '_',
        \ 'mode': 'pfrz',
        \ },
        \ ]
    \ }


nmap <leader>cd :cd `=<SPACE>
"""""""""""""""""""
" vim-rooter plugin
" """""""""""""""""""
" " Reset working directory to closest ctrlp file (touch file in each project
" dir)
let g:rooter_patterns = ['.ctrlp']
map <silent> <unique> <Leader>wo <Plug>RooterChangeToRootDirectory
