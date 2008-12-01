" Set encoding for Chinese
set encoding=UTF-8
set helplang=cn
let &termencoding=&encoding
set fileencodings=utf-8,cp936,ucs-bom,gb18030,gbk,gb2312

" color
" colorscheme eclipse
 
" don't be vi compatible
set nocompatible
 
" use modelines
set modeline
 
" window title
set title
 
" short messages
set shortmess=aoOtTI
 
" viminfo file
set viminfo='20,\"500,h
" keep 50 lines of command history
set history=50
 
" tab == 2 space char
set shiftwidth=2
set expandtab
set smarttab
 
" automagic indenting
set autoindent
set smartindent
 
" special chars
set list
set listchars=tab:\ \ ,trail:.,nbsp:_
set showbreak=>\
 
" allow backspace in insert mode
set backspace=indent,eol,start
 
" selection behaviour
set selection=inclusive
 
" numbered lines
"set nonumber
set number
set numberwidth=3
 
" show cursor position
set ruler
" show command on the bottom
set showcmd
" status line
" set laststatus=1
 
" hilight search
set hlsearch
" search as I type
set incsearch
" ignore case when searching
set ignorecase
" overrire ignorecase if there are caps
set smartcase
 
" 3 lines visible around the cursor
set scrolloff=3
set sidescrolloff=5
set scrolljump=1
 
" completion
set completeopt=longest,menu,preview
 
" diffing
set diffopt+=vertical
 
" french spelling (activated with :set spell)
" setlocal spelllang=en
 
" Only do this part when compiled with support for autocommands.
if has("autocmd")
 
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
 
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!
 
    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78
 
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \ exe "normal! g`\"" |
          \ endif
 
  augroup END
 
  autocmd FileType c set omnifunc=ccomplete#Complete
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType ruby set omnifunc=rubycomplete#Complete
  autocmd FileType sql set omnifunc=sqlcomplete#Complete
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
 
endif " has("autocmd")
 
" hilight current line
" set cursorline
 
if has("terminfo")
  syntax on
" colorscheme delek
" set background=dark
end
 
" Colorscheme for screen
"if $TERM =~ '^screen' | set t_Co=256 | endif
" Colorscheme for urxvt
"if $TERM =~ '^rxvt-unicode' | set t_Co=256 | endif
 
"if &t_Co >= 256
"  try
"    colorscheme 256-jungle
"  catch
"    colorscheme delek
"  endtry
"else
"  colorscheme delek
"endif
 
" Mouse possible with screen
if &term =~ "^screen"
  set ttymouse=xterm2
endif
 
" no bold font
set t_md=
 
" enable mouse use in cli
set mouse=a
 
" some usefull key mapping
map <F5> <Esc>gg=G''
" map <F6> :TlistToggle
" map <F7> :TlistUpdate
map <F9> :DiffChangesDiffToggle
map <F10> :DiffChangesPatchToggle
map <A-Right> gt
map <A-Left> gT
" paste/nopaste
set pastetoggle=<F11>
 
" no backup
set nobackup
 
" swapfile
set swapfile
 
" folding
set foldenable
set foldmethod=marker
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" :Man command
runtime ftplugin/man.vim
 
" grep command
set grepprg=grep\ -nH\ $*
 
" open urls with firefox
command -bar -nargs=1 OpenURL :!firefox <args>
 
" () [] {}
noremap! "" ""<left>
noremap! '' ''<left>
 
noremap! (( ()<left>
noremap! (<cr> (<cr>)<c-o>O
noremap! (; ();<esc>hi
noremap! (<cr>; (<cr>);<c-o>O
noremap! ('; ('');<esc>hhi
noremap! ("; ("");<esc>hhi
noremap! (' ('')<esc>hi
noremap! (" ("")<esc>hi
 
noremap! {{ {}<left>
noremap! {<cr> {<cr>}<c-o>O
noremap! {; {};<esc>hi
noremap! {<cr>; {<cr>};<c-o>O
noremap! {'; {''};<esc>hhi
noremap! {"; {""};<esc>hhi
noremap! {' {''}<esc>hi
noremap! {" {""}<esc>hi
 
noremap! [[ []<left>
noremap! [<cr> [<cr>]<c-o>O
noremap! [; [];<esc>hi
noremap! [<cr>; [<cr>];<c-o>O
noremap! ['; [''];<esc>hhi
noremap! ["; [""];<esc>hhi
noremap! [' ['']<esc>hi
noremap! [" [""]<esc>hi
 
" use XHTML and CSS with :TOhtml
let use_xhtml=1
let html_use_css=1
let html_ignore_folding=1
let html_use_encoding="UTF-8"
 
" ruby
let g:rubycomplete_buffer_loading=1
let g:rubycomplete_classes_in_global=1
let g:rubycomplete_rails=1
 
" rails.vim
let g:rails_dbext=1
let g:rails_default_database='postgresql'
let g:rails_gnu_screen=1
let g:rails_mappings=1
let g:rails_statusline=1
let g:rails_subversion=0
let g:rails_syntax=1
 
" trucs rhaamo
nmap <silent> e :Explore<space>./<CR>
 
" Also, support editing of gzip-compressed files. DO NOT REMOVE THIS!
" This is also used when loading the compressed helpfiles.
augroup gzip
  " Remove all gzip autocommands
  au!
 
  " Enable editing of gzipped files
  " read: set binary mode before reading the file
  " uncompress text in buffer after reading
  " write: compress file after writing
  " append: uncompress file, append, compress file
  autocmd BufReadPre,FileReadPre *.gz set bin
  autocmd BufReadPre,FileReadPre *.gz let ch_save = &ch|set ch=2
  autocmd BufReadPost,FileReadPost *.gz '[,']!gunzip
  autocmd BufReadPost,FileReadPost *.gz set nobin
  autocmd BufReadPost,FileReadPost *.gz let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost *.gz execute ":doautocmd BufReadPost " . %:r
 
  autocmd BufWritePost,FileWritePost *.gz !mv <afile> <afile>:r
  autocmd BufWritePost,FileWritePost *.gz !gzip <afile>:r
 
  autocmd FileAppendPre *.gz !gunzip <afile>
  autocmd FileAppendPre *.gz !mv <afile>:r <afile>
  autocmd FileAppendPost *.gz !mv <afile> <afile>:r
  autocmd FileAppendPost *.gz !gzip <afile>:r
augroup END
 
augroup bzip2
  " Remove all bzip2 autocommands
  au!
 
  " Enable editing of bzipped files
  " read: set binary mode before reading the file
  " uncompress text in buffer after reading
  " write: compress file after writing
  " append: uncompress file, append, compress file
  autocmd BufReadPre,FileReadPre *.bz2 set bin
  autocmd BufReadPre,FileReadPre *.bz2 let ch_save = &ch|set ch=2
  autocmd BufReadPost,FileReadPost *.bz2 set cmdheight=2|'[,']!bunzip2
  autocmd BufReadPost,FileReadPost *.bz2 set cmdheight=1 nobin|execute ":doautocmd BufReadPost " . %:r
  autocmd BufReadPost,FileReadPost *.bz2 let &ch = ch_save|unlet ch_save
 
  autocmd BufWritePost,FileWritePost *.bz2 !mv <afile> <afile>:r
  autocmd BufWritePost,FileWritePost *.bz2 !bzip2 <afile>:r
 
  autocmd FileAppendPre *.bz2 !bunzip2 <afile>
  autocmd FileAppendPre *.bz2 !mv <afile>:r <afile>
  autocmd FileAppendPost *.bz2 !mv <afile> <afile>:r
  autocmd FileAppendPost *.bz2 !bzip2 -9 --repetitive-best <afile>:r
augroup END
 
" a quoi qu'sa sert ?!
autocmd BufRead /tmp/mutt* set tw=72
autocmd BufNewfile,BufRead /tmp/mutt*[0-9] set nobk nowb
 
"Configure files explorer
let g:explVertical=1
let g:explWinSize=20
 
"Set a statusbar
"set statusline=~
 
"Display a status-bar.
highlight StatusLine term=bold cterm=bold ctermbg=4
highlight StatusLineNC term=none cterm=none ctermfg=4
set laststatus=2
set statusline=%a\ %<%f\ %h%m%r%=%-14.(%l/%L\ \|\ %c%V%)\ %P
"set foldcolumn=2
 
" Minibuffer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 2
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplSplitBelow = 1
let g:miniBufExplMaxSize = 0
let g:bufExplorerSortBy = "name"

""""""""""""""""""""""""""""""""""
" VTreeExplorer
""""""""""""""""""""""""""""""""""
map <F12> :VSTreeExplore <CR>
let g:treeExplVertical=1
let g:treeExplWinSize=35
let g:treeExplDirSort=1
 
""""""""""""""""""""""""""""""""""""
" MRU
""""""""""""""""""""""""""""""""""""
let MRU_File = '/home/qianli/.vim/.vim_mru_files'
let MRU_Max_Entries=20
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'
""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
"Gvim
""""""""""""""""""""""""""""""
if has("gui_running")
colorscheme desert
set guifont=Monaco\ 10
endif
 
"""""""""""""""""""""""""""""
"key binding
"""""""""""""""""""""""""""""
" To save, ctrl-s.
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Set bracket matching and comment formats
"""""""""""""""""""""""""""""""""""""""""""""""""""
set matchpairs+=<:>
set comments-=s1:/*,mb:*,ex:*/
set comments+=s:/*,mb:**,ex:*/
set comments+=fb:*
set comments+=b:\"
set comments+=n::
 
"""""""""""""""""""""""""""""""""""
" Cursor keys suck. Use ctrl with home keys to move in insert mode.
"""""""""""""""""""""""""""""""""""
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>
 
""""""""""""""""""""""""""""""""""""""""""""""""""
" Press ,e to jump to the same dir as current file
""""""""""""""""""""""""""""""""""""""""""""""""""
if has("unix")
    map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
else
    map ,e :e <C-R>=expand("%:p:h") . "\" <CR>
endif
