" http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://github.com/ifshiryaev
" Description: My own .vimrc
 
"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.
 
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
 
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
 
" Enable syntax highlighting
syntax enable

 
"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.
 
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden
 
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall
 
" Better command-line completion
set wildmenu
 
" Show partial commands in the last line of the screen
set showcmd
 
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
 
" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
 
 
"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
 
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
 
" Always display the status line, even if only one window is displayed
set laststatus=2
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
 
" Enable use of the mouse for all modes
set mouse=a
 
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
 
" Display line numbers on the left
set number
 
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
 
" Use <F10> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F10>
 
 
"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.
 
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab
 
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4
 
 
"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Replace currently selected text with default register without yanking it
vnoremap p "_dP

" Map <C-L> (rdraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>


" -----------------------------------------------------------
" Custom settings

" Highlight cursor in insert mode
:autocmd InsertEnter,InsertLeave * set cul!

" Sets default clipboard. Allows to copy from vim and paste to whatever place directly
set clipboard=unnamedplus

" Remap ESC key for more natural kj 
inoremap kj <ESC>

" Remap leader
map <SPACE> <leader>

" -----------------------------------------------------------
" Custom pluguins
set nocompatible              " be iMproved, required 
filetype off                  " required

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"-----------------------------------------------------
"Plugin list begin
"-----------------------------------------------------
Plugin 'VundleVim/Vundle.vim'             " Let Vundle manage Vundle, required
Plugin 'Valloric/YouCompleteMe'           " A code-completion engine
Plugin 'rdnetto/YCM-Generator'            " .ycm_extra_conf.py generator
Plugin 'bling/vim-airline'                " Lean & mean status/tabline for vim that's light as air 
Plugin 'scrooloose/nerdtree'              " A tree explorer plugin
Plugin 'majutsushi/tagbar'                " Vim plugin that displays tags in a window, ordered by scope
Plugin 'vim-scripts/Conque-GDB'           " GDB command line interface and terminal emulator
Plugin 'altercation/vim-colors-solarized' " Solarized scheme for vim
Plugin 'tpope/vim-obsession'              " Vim session manager
Plugin 'brgmnn/vim-opencl'                " opencl syntax highlighting
Plugin 'SirVer/ultisnips'                 " Snippets engine
Plugin 'honza/vim-snippets'               " Snippets are separated from the engine
Plugin 'ervandew/supertab'                " Makes YCM compatible with UltiSnips
"-----------------------------------------------------
"Plugin list end
"-----------------------------------------------------

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype off                 " trick to force syntax highlighting for opencl files (vim-opencl plugin) actually work
filetype plugin indent on    " required


" YouCompleteMe config & shortcuts
nnoremap <leader>go :YcmComplete GoTo<CR>
nnoremap <leader>gt :YcmComplete GetType<CR>
nnoremap <leader>gd :YcmComplete GetDoc<CR>
nnoremap <leader>gi :YcmComplete GoToInclude<CR>
nnoremap <leader>fi :YcmComplete FixIt <CR>
nnoremap <F2> :YcmComplete GoToDeclaration<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics <CR>

" Set YCM as error checker (syntastic replacement)
let g:ycm_register_as_syntastic_checker=1

" Populate the location list automatically every time YCM gets new diagnostic data
let g:ycm_always_populate_location_list=1

" Settings for integration with Airline
let g:ycm_error_symbol='!!'
let g:ycm_warning_symbol='>>'

" Additional autocomplete settings
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1

" Diagnostics
let g:ycm_show_diagnostics_ui=1
let g:ycm_max_diagnostics_to_display=1000

" Navigation
let g:ycm_key_list_select_completion=['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-k>', '<Up>']


" SuberTab
let g:SuperTabDefaultCompletionType='<C-n>'


" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-f>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"
let g:UltiSnipsListSnippets="<C-l>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "customsnippets"]
let g:snips_author="Ilia Shiriaev"


" NerdTree config & shortcuts
let NERDTreeShowHidden=1
let g:NERDTreeDirArrows=0 " solve issue/108 when nerdtree are not able to unfold directory
map <C-n> :NERDTreeToggle<CR>


" vim-airline config
let g:Powerline_symbols='fancy'


" Tagbar shortcuts
nmap <F9> :TagbarToggle<CR>


" Toggle source/header file
nnoremap <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>


" Tab shortcuts
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>
nnoremap <leader>tf :tabfirst<CR>
nnoremap <leader>tl :tablast<CR>
nnoremap <leader>tc :tabclose<CR>


" QuickFix shortcuts
nnoremap <leader>co :copen<CR>
nnoremap <leader>cc :cclose<CR>
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprevious<CR>


" Location list shortcuts
nnoremap <leader>io :lopen<CR>
nnoremap <leader>ic :lclose<CR>
nnoremap <leader>in :lnext<CR>
nnoremap <leader>ip :lprevious<CR>


" Remap navigation between panels using <leader>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>/ <C-w>/


" Python code style formating command for yapf, but install YAPF first (pip install yapf)
autocmd FileType python nnoremap <leader>y :0,$!yapf<CR><C-o>

" C/C++ code style formating command for clang-format (apt install clang-format)
nnoremap <leader>cf :!clang-format --style="{BasedOnStyle: Mozilla, IndentWidth: 4}" -i %<CR>


" vim-colors-solarized activation
let g:solarized_termcolors=256
set background=dark
colorscheme solarized


" Save your backup files to a less annoying place than the current directory

" Tell vim to keep a backup files
set backup 

" If you have .vim-backup in the current directory, it'll use that, otherwise we create it
if isdirectory($HOME . '/.vim-backup') == 0
  :silent !mkdir -p ~/.vim-backup >/dev/null 2>&1
endif

" Where to put backup files
set backupdir=~/.vim-backup,. 

" Make backup before overwriting the current buffer
set writebackup 

" Overwrite the original backup file
set backupcopy=yes

" Meaningful backup name, ex: filename@2018-12-14.11:06
au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")

" If you have .vim-swap in the current directory, it'll use that, otherwise we create it
if isdirectory($HOME . '/.vim-swap') == 0
  :silent !mkdir -p ~/.vim-swap >/dev/null 2>&1
endif

" Where to put swap files
set directory=~/.vim-swap//,. 

" If you have .vim-view in the current directory, it'll use that, otherwise we create it
if isdirectory($HOME . '/.vim-view') == 0
  :silent !mkdir -p ~/.vim-view >/dev/null 2>&1
endif

" Where to put views files
set viewdir=~/.vim-view

" Save and restore views (code foldings)
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
