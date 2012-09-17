" all my macros start with SPACEBAR
let maplocalleader=' '

" timeouts
" :set timeout timeoutlen=500

" toggle insert mode
nnoremap <C-CR> i
imap <C-CR> <Esc>

" quiting
nmap <C-q> :q<CR>

" wtf is this
map <localleader>n :execute 'NERDTreeToggle ' . getcwd()<CR>

" initial gvim position
":winpos 300 0
":set lines=55
":set columns=120
":set winheight=9999
":set winwidth=9999

" paste from clipboard
map <LocalLeader>pp "+gP 
map <LocalLeader>yy "+y 

" settings for fftextmate
" fftextmate still not worky
let g:fuzzy_ignore = "*.log"
let g:fuzzy_matching_limit = 70

" we need this so that fuzzy finder works as planned
" with MRU file
let g:fuf_modesDisable = []

" Autoclose tag
au FileType xhtml,xml so ~/.vim/ftplugin/html_autoclosetag.vim


"----------------------------------------------------------------------------
" what i use with the uber cool minibufexplorer
" let g:miniBufExplMapCTabSwitchBufs = 1
" let g:miniBufExplModSelTarget = 1
" let g:miniBufExplMaxSize = 2 

"----------------------------------------------------------------------------
" my navigation mappings
let g:fuf_reuseWindow = 0
nmap <C-S-Tab> :FufFileWithFullCwd<CR>
nmap <C-Tab> :FufBuffer<CR>
nmap <LocalLeader>ff :FufFile<CR>
nmap <LocalLeader>b :FufBuffer<CR>
nmap <LocalLeader>m :FufMruFile<CR>
" breaks the timeout on ff
" nmap <LocalLeader>ffc :FufFileWithFullCwd<CR>
nmap <LocalLeader>fc :FufMruCmd<CR>
nmap <LocalLeader>d :FufFileWithCurrentBufferDir<CR>

" change window in an easy way
nmap <Tab> <C-W>
" save
nmap <C-s> :w!<CR>


" ctrl space mapping - damn
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

"----------------------------------------------------------------------------
" Set the visual style
if has("gui_running")
" moira rox
      set gfn=Monospace\ 9
      let moria_style='dark'
      let moria_fontface = 'mixed' 
      colo moria
" or xoria
"     colo xoria256
" or zenburn maybe
      let g:zenburn_high_Contrast = 1
      " let g:zenburn_alternate_Visual = 1
      " let g:zenburn_alternate_Error = 1
      " let g:zenburn_alternate_Include = 1
      " let g:zenburn_force_dark_Background = 1
      " unlet g:zenburn_alternate_Include
      " colo zenburn
      colo jellybeans
      " colo inkpot
      " colo wombat
      " colo xoria

      set guioptions-=T       " no toolbar
      set cursorline          " show the cursor line
endif

" ---------------------------------------------------------------------------
" first the disabled features due to security concerns
set modelines=0               " no modelines [http://www.guninski.com/vim1.html]
let g:secure_modelines_verbose = 0 " securemodelines vimscript
let g:secure_modelines_modelines = 15 " 15 available modelines

"Since these are all simple features, I won’t bother to explain them besides the inline comments:

" ---------------------------------------------------------------------------
" operational settings
syntax on
set nospell
set ruler                     " show the line number on the bar
set more                      " use more prompt
set autoread                  " watch for file changes
set number                    " line numbers
set hidden
set noautowrite               " don't automagically write on :next
set lazyredraw                " don't redraw when don't have to
set showmode
set showcmd
set nocompatible              " vim, not vi
set autoindent smartindent    " auto/smart indent
set expandtab                 " expand tabs to spaces
set smarttab                  " tab and backspace are smart
set tabstop=3                 " 6 spaces
set shiftwidth=4
set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set backspace=indent,eol,start
set showfulltag               " show full completion tags
set noerrorbells              " no error bells please
set nolinebreak
set nowrap
set cmdheight=2               " command line two lines high
set undolevels=1000           " 1000 undos
set updatecount=100           " switch every 100 chars
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set ttyfast                   " we have a fast terminal
let g:tex_flavor='tex'
filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins
compiler ruby                 " Enable compiler support for ruby
set wildmode=longest:full
set wildignore+=*.o,*~,.lo    " ignore object files
set wildmenu                  " menu has tab completion
set foldmethod=syntax         " fold on syntax automagically, always
set foldcolumn=2              " 2 lines of column for fold showing, always

set dictionary=/usr/share/dict/words " more words!

"I do like candycode for my terminals (which tend to be black) and I like macvim for my GUI, so I change schemes depending on which I’m using.

if !has("gui_running")
      colorscheme candycode   " yum candy
end

"For the taglist plugin, I want it to appear on the right and to quick vim as soon as I close the last file I’m working on.

" Settings for taglist.vim
let Tlist_Use_Right_Window=1
let Tlist_Auto_Open=0
let Tlist_Enable_Fold_Column=0
let Tlist_Compact_Format=0
let Tlist_WinWidth=33
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close = 1

"Misc TOhtml settings

" Settings for :TOhtml
let html_number_lines=1
let html_use_css=1
let use_xhtml=1

"My status line is basically <filename> [<filetype>] [+] #<buffernum> <linenum>/<totallines>,<columnnum>

" ---------------------------------------------------------------------------
" status line
set laststatus=2
if has('statusline')
        function! SetStatusLineStyle()
                let &stl="%f %y "                       .
                        \"%([%R%M]%)"                   .
                        \"%#StatusLineNC#%{&ff=='unix'?'':&ff.'\ format'}%*" .
                        \"%{'$'[!&list]}"               .
                        \"%{'~'[&pm=='']}"              .
                        \"%="                           .
                        \"#%n %l/%L,%c%V "              .
                        \""
        endfunc
        call SetStatusLineStyle()

        if has('title')
                set titlestring=%t%(\ [%R%M]%)
        endif

endif

"More simple search options, see inline comments

" ---------------------------------------------------------------------------
"  searching
set incsearch                 " incremental search
set ignorecase                " search ignoring case
set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
set diffopt=filler,iwhite       " ignore all whitespace and sync

"I *occasionally* use the mouse. If I have to.

" ---------------------------------------------------------------------------
"  mouse stuffs
set mouse=a                   " mouse support in all modes
set mousehide                 " hide the mouse when typing
" this makes the mouse paste a block of text without formatting it
" (good for code)
map <MouseMiddle> <esc>"*p

"I prefer not to litter my current directory with backup files, so I put them all in ~/.backup. I also save a lot of line positions in the viminfo file.

" ---------------------------------------------------------------------------
"  backup options
set backup
set backupdir=~/.backup
set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo
set history=200
"set viminfo='100,f1

"I use ,ss to toggle between spellcheck on and spellcheck off.

" ---------------------------------------------------------------------------
" spelling...
if v:version >= 700

"  setlocal spell spelllang=en
  nmap <LocalLeader>ss :set spell!<CR>

endif

"Here are all the keyboard shortcuts I use most often:

" ---------------------------------------------------------------------------
" some useful mappings
" Y yanks from cursor to $
" toggle list mode
nmap <LocalLeader>tl :set list!<cr>
" change directory to that of current file
nmap <LocalLeader>cd :cd%:p:h<cr>
" change local directory to that of current file
nmap <LocalLeader>lcd :lcd%:p:h<cr>
" correct type-o's on exit
nmap q: :q
" save and build
nmap <LocalLeader>wm  :w<cr>:make<cr>
" open all folds
nmap <LocalLeader>fo  :%foldopen!<cr>
" close all folds
nmap <LocalLeader>fc  :%foldclose!<cr>
" ,tt will toggle taglist on and off
nmap <LocalLeader>tt :Tlist <CR>
" When I'm pretty sure that the first suggestion is correct
map <LocalLeader>r 1z=

"I use this one quite often, as I often forget to do “sudo vim file” in the first case, now I don’t have to exit vim to write the file with sudo.

" If I forgot to sudo vim a file, do that with :w!!
cmap w!! %!sudo tee > /dev/null %
" ruby helpers
iab rbang #!/usr/bin/env ruby
iab idef def initialize

"Switch between tabs with ,tn and ,tp

" ---------------------------------------------------------------------------
" tabs
" (LocalLeader is ",")
map <LocalLeader>tc :tabnew %<cr>    " create a new tab
map <LocalLeader>td :tabclose<cr>    " close a tab
map <LocalLeader>tn :tabnext<cr>     " next tab
map <LocalLeader>tp :tabprev<cr>     " previous tab
map <LocalLeader>tm :tabmove         " move a tab to a new location

"Load extensions we need and change some format options for markdown files.

" ---------------------------------------------------------------------------
" auto load extensions for different file types
if has('autocmd')
        filetype plugin indent on
        syntax on

        autocmd BufReadPost *
                \ if line("'\"") > 0|
                \       if line("'\"") <= line("$")|
                \               exe("norm '\"")|
                \       else|
                \               exe "norm $"|
                \       endif|
                \ endif

        " improve legibility
        au BufRead quickfix setlocal nobuflisted wrap number

        " improved formatting for markdown
        " http://plasticboy.com/markdown-vim-mode/
        autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
        autocmd BufRead ~/.blog/entries/*  set ai formatoptions=tcroqn2 comments=n:>
endif

" * You can now set a darker background for bright environments. To activate, use:
"   contrast Zenburn, use:
"
"      let g:zenburn_high_Contrast = 1
"
" * To get more contrast to the Visual selection, use
"   
"      let g:zenburn_alternate_Visual = 1
" 
" * To use alternate colouring for Error message, use
"     
"      let g:zenburn_alternate_Error = 1
"
" * The new default for Include is a duller orange. To use the original
"   colouring for Include, use
"     
"      let g:zenburn_alternate_Include = 1
"
" * Work-around to a Vim bug, it seems to misinterpret ctermfg and 234 and 237
"   as light values, and sets background to light for some people. If you have
"   this problem, use:
"
"      let g:zenburn_force_dark_Background = 1
"
" * To turn the parameter(s) back to defaults, use UNLET:
"
"      unlet g:zenburn_alternate_Include
"
"   Setting to 0 won't work!
"
" That's it, enjoy!
"

" for tex-vim?
set runtimepath+=/usr/share/vim/addons/
