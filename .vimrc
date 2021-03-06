"" Pathogen
runtime bundle/core/pathogen/autoload/pathogen.vim
for path in ["core","helpers", "text-helpers", "syntax", "theme", "experiment"]
  call pathogen#infect("~/.vim/bundle/" . path)
endfor

"" Globals
let $vimrc="~/.vimrc"
set nocompatible                  " Use vim, no vi defaults
syntax enable
filetype plugin indent on         " filetype detection[ON] plugin[ON] indent[ON]
set hidden                        " Allow Buffers to be hidden without save.
set history=10000                 " Command History
set t_ti= t_te=                   " Prevent Vim from clobbering the scrollback buffer.
set mouse=a                       " Support for mouse
set synmaxcol=300                 " Syntax coloring lines that are too long just slows down the world
set switchbuf=useopen             " How New Buffers Open [split, newtab, useopen]
set splitbelow                    " New split will appear at the bottom.
set splitright                    " New split will appear the right.
set encoding=utf-8                " Set default encoding to UTF-8
set ttyfast                       " Fast Terminal, sends more characters.
set t_Co=256                      " enable 256-color mode.
let &winheight = &lines * 2 / 10  " Set the window minimum height
set laststatus=2                  " The first line is used by vim Powerline
set timeoutlen=800                " Timout wait for <leader> keys
set lazyredraw
set ruler
set number                        " Show line numbers
set visualbell                    " Sssshh!
set undofile                      " Persistent Undo Hisotry
set undodir=~/.vim/_undo

"" Wildmenu settings
set wildmode=full                                                              " command completion works with tab.
set wildmenu                                                                   " make tab completion for files/buffers act like bash
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem            " Disable output and VCS files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.dmg                  " Disable archive files
set wildignore+=*.pdf,*.ai,*.psd,*.doc,*.gdoc,*.jpeg,*.jpg,*.jpeg,*.png,*.gif  " Disable archive files
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*   " Ignore bundler and sass cache
set wildignore+=*.swp,*~,._*,*/.AppleDouble*,*.DS_STORE                        " Disable temp and backup files
set wildignore+=*/templates_cached/*,*/ul/*                                    " Custom

"" Whitespace
set wrap                        " wrap long lines, vim hates long lines.
set linebreak
set nolist
set textwidth=0 wrapmargin=0    " prevent wrapping newly inserted text
set formatoptions+=l            " keep your existing 'textwidth' settings
set shiftwidth=2                " a tab is two spaces
set softtabstop=2               " backspace deletes two spaces.
set expandtab                   " use spaces, not tabs
set showbreak=\ \               " Break
set backspace=indent,eol,start  " backspace through everything in insert mode
set autoindent                  " automatically indent
set scrolloff=3                 " don't show search results as the first line

"" Searching
set hlsearch                                         " highlight matches
set incsearch                                        " incremental searching
set ignorecase                                       " searches are case insensitive...
set smartcase                                        " ... unless they contain at least one capital letter
set showmatch

" Quick 'Replace' shortcut.
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Cleanup previous Highlights
map <Space> :noh<CR>

"" Theme Settings
colorscheme solarized
set background=dark
let g:Powerline_symbols='fancy'
let g:Powerline_colorscheme='solarizedDark'
let mapleader = "\\"  " <leader> keys
hi IndentGuidesOdd ctermbg=0
hi IndentGuidesEven ctermbg=8
" Quickly switch between color schemes.
" You need to config your iTerm2 to use "Dark" and "Light" Color Scheme.
command Dark set background=dark | !echo -e '\033]50;SetProfile=Dark\aColor Scheme Changed'
command Light set background=light | !echo -e '\033]50;SetProfile=Light\aColor Scheme Changed'

" Allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>


" Split separator
highlight VertSplit ctermfg=11 ctermbg=none gui=none
set fillchars+=vert:\ 

"  TODO DOCUMENT FROM HERE
"  TODO DOCUMENT FROM HERE
"  TODO DOCUMENT FROM HERE
"  TODO DOCUMENT FROM HERE
let g:UltiSnipsDontReverseSearchPath="1"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Jump to last non-space character in line ( opposite of ^ )
map & g_

"" FileTypes Preferences
"" Intent & Manual Folding side to side.
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufRead * normal zR  " Expand all folds by default.
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
au BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,} | normal zR
au BufNewFile,BufRead *.json set ft=javascript
au FileType make setlocal noexpandtab
au FileType python call StabHard(4)
au FileType php call StabHard(4)
au FileType html call StabHard(4)
au FileType smarty call StabHard(4)
au FileType html let g:syntastic_quiet_warnings=1
au BufRead,BufNewFile *.scss set filetype=scss
au FileType css,scss,html,haml setlocal iskeyword+=-
au BufRead,BufNewFile *.phtml set filetype=phtml
au BufRead,BufNewFile *.sass setlocal foldmethod=indent | normal zR
" Colorizer
let g:colorizer_auto_filetype='css,scss,sass,html,haml,tpl,js,coffee'

" Remember last location in file, but not for commit messages.
" see :help last-position-jump
au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g`\"" | endif


"" Arrows are not acceptable on Normal mode.
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

"" Window Resizing
if bufwinnr(1)
  nmap + <C-W>+
  nmap - <C-W>-
  nmap ) :vertical res +1<cr>
  nmap ( :vertical res -1<cr>
endif

""
"" General Mappings (Normal, Visual, Operator-pending)
""

"" Move lines (up, right, top, left)
nnoremap K i<CR><ESC>
nnoremap <C-l> :><CR>
nnoremap <C-h> :<<CR>
nnoremap <C-j> <Esc>:m .+1<cr>==
nnoremap <C-k> <Esc>:m .-2<cr>==
vnoremap <C-l> :><CR>gv
vnoremap <C-h> :<<CR>gv
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

"" Add a line above or below current line
nnoremap <leader>O :set paste<CR>m`O<Esc>``:set nopaste<CR>
nnoremap <leader>o :set paste<CR>m`o<Esc>``:set nopaste<CR>

" Switch Folds
noremap <F1> za
vnoremap <F1> zf

" Switch scrollbind
noremap <F12> :set scrollbind!<CR>

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
cmap w!! %!sudo tee > /dev/null %

" format the entire file
nmap <leader>fef ggVG=

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Create the directory containing the file in the buffer
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='
nmap <silent> <leader>ul :t.\|s/./=/g\|:nohls<cr>

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" Adjust viewports to the same size
map <Leader>= <C-w>=

if has("gui_macvim") && has("gui_running")
  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <D-]> >gv
  vmap <D-[> <gv

  nmap <D-]> >>
  nmap <D-[> <<

  omap <D-]> >>
  omap <D-[> <<

  imap <D-]> <Esc>>>i
  imap <D-[> <Esc><<i

  " Bubble single lines
  nmap <D-Up> [e
  nmap <D-Down> ]e
  nmap <D-k> [e
  nmap <D-j> ]e

  " Bubble multiple lines
  vmap <D-Up> [egv
  vmap <D-Down> ]egv
  vmap <D-k> [egv
  vmap <D-j> ]egv

  " Map Command-# to switch tabs
  map  <D-0> 0gt
  imap <D-0> <Esc>0gt
  map  <D-1> 1gt
  imap <D-1> <Esc>1gt
  map  <D-2> 2gt
  imap <D-2> <Esc>2gt
  map  <D-3> 3gt
  imap <D-3> <Esc>3gt
  map  <D-4> 4gt
  imap <D-4> <Esc>4gt
  map  <D-5> 5gt
  imap <D-5> <Esc>5gt
  map  <D-6> 6gt
  imap <D-6> <Esc>6gt
  map  <D-7> 7gt
  imap <D-7> <Esc>7gt
  map  <D-8> 8gt
  imap <D-8> <Esc>8gt
  map  <D-9> 9gt
  imap <D-9> <Esc>9gt
else
  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <A-]> >gv
  vmap <A-[> <gv

  nmap <A-]> >>
  nmap <A-[> <<

  omap <A-]> >>
  omap <A-[> <<

  imap <A-]> <Esc>>>i
  imap <A-[> <Esc><<i

  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>

  " Map Control-# to switch tabs
  map  <C-0> 0gt
  imap <C-0> <Esc>0gt
  map  <C-1> 1gt
  imap <C-1> <Esc>1gt
  map  <C-2> 2gt
  imap <C-2> <Esc>2gt
  map  <C-3> 3gt
  imap <C-3> <Esc>3gt
  map  <C-4> 4gt
  imap <C-4> <Esc>4gt
  map  <C-5> 5gt
  imap <C-5> <Esc>5gt
  map  <C-6> 6gt
  imap <C-6> <Esc>6gt
  map  <C-7> 7gt
  imap <C-7> <Esc>7gt
  map  <C-8> 8gt
  imap <C-8> <Esc>8gt
  map  <C-9> 9gt
  imap <C-9> <Esc>9gt
endif

""
"" Command-Line Mappings
""

" Insert the current directory into a command-line path
cmap <C-P> <C-R>=expand("%:p:h") . "/"<CR>

"" Buffer Controls
noremap <C-left> :bprev<CR>
noremap <C-right> :bnext<CR>

"" Some system wide fixes.

imap <C-d> <Del>
imap <C-a> <Esc>^i
imap <C-e> <Esc>$a
imap jj <Esc>

"" Git
map <leader>g :Git
map <leader>gs :Gstatus<CR>
map <leader>gf :Git fetch<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
map <leader>gf :Git fetch<CR>
map <leader>gpl :Git pull
map <leader>gplom :Git pull origin master<CR>
map <leader>gp :Git push
map <leader>gaa :Git add all<CR>
map <leader>gau :Git update-index --assume-unchanged
map <leader>gch :Git checkout

"" Tabularize
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

""
"" Backup and swap files
""
set backupdir=~/.vim/_backup/    " where to put backup files.
set directory=~/.vim/_temp/      " where to put swap files.


"" Tabs
nnoremap tf  :tabfirst<CR>
nnoremap tn  :tabnext<CR>
nnoremap tp  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tc  :tabnew<CR>
nnoremap tm  :tabm<Space>
nnoremap tx  :tabclose<CR>

"" Aliases for Copy pasting between terminal and mac.
vmap <leader>c :w !pbcopy<CR><CR>
vmap <leader>p <Esc>;set paste<CR>;r !pbpaste<CR>;set nopaste<CR>

"" Auto Tabularize Tables when using space
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
 
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction


" Wrapper function to restore the cursor position, window position,
" and last search after running a command. ( https://docwhat.org/vim-preserve-your-cursor-and-window-state/ )
function! Preserve(command)
  let save_cursor = getpos(".")
  execute a:command
  call setpos('.', save_cursor)
endfunction

"" Remove Trailing Whitespace
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>
autocmd BufWritePre *.txt,*.py,*.js,*.coffee,*.txt,*.rb,*.css,*.scss,*.html,*.erb,*.haml,*.yaml :call Preserve("%s/\\s\\+$//e")

"" CtrlP
""
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'


" Nerd Toggle Hotkeys
nmap <leader>s :NERDTreeToggle<cr>
nmap <C-S> :NERDTreeToggle<cr>
nmap <leader>sf :NERDTreeFind<cr>
nmap <leader>re :so %<cr>
map <TAB> :BufExplorer<CR>

" Tagbar
nmap <leader>S :TagbarToggle<cr>

" Zencoding
let g:user_zen_leader_key = '<leader>'

" Copy and Close
function! CopyAndClose()
  normal ggVG"+y
  q!
endfunction

nmap <leader>cac :call CopyAndClose()<CR>

" IndentConsistencyCopAutoCMD
let g:indentconsistencycop_CheckOnLoad = 0
" IndentGuides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0 " Dark Color Scheme


" EasyMotion
let g:EasyMotion_leader_key = '<Leader>'
hi link EasyMotionTarget Identifier
hi link EasyMotionShade  Comment

" Evervim
let g:evervim_devtoken='S=s33:U=3496a7:E=142edb92811:C=13b9607fc11:P=1cd:A=en-devtoken:H=24cbf9668ffb6d1d6db044cdc7df649d'


" iTerm2 Bindings

vmap <c-c> "+y
imap <c-v> <esc>"+pi
nmap <leader>a ggV
nmap <leader>ay ggVG"+y
nmap <leader>ad ggVG"+d
nmap <C-s> <Esc>;w<CR>
imap <C-s> <Esc>;w<CR>a

" Return indent (all whitespace at start of a line), converted from
" tabs to spaces if what = 1, or from spaces to tabs otherwise.
" When converting to tabs, result has no redundant spaces.
function! Indenting(indent, what, cols)
  let spccol = repeat(' ', a:cols)
  let result = substitute(a:indent, spccol, '\t', 'g')
  let result = substitute(result, ' \+\ze\t', '', 'g')
  if a:what == 1
    let result = substitute(result, '\t', spccol, 'g')
  endif
  return result
endfunction

" Convert whitespace used for indenting (before first non-whitespace).
" what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
" cols = string with number of columns per tab, or empty to use 'tabstop'.
" The cursor position is restored, but the cursor will be in a different
" column when the number of characters in the indent of the line is changed.
function! IndentConvert(line1, line2, what, cols)
  let savepos = getpos('.')
  let cols = empty(a:cols) ? &tabstop : a:cols
  execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
  call histdel('search', -1)
  call setpos('.', savepos)
endfunction
command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)

" Define a command to make it easier to use
command! -nargs=+ QFDo call QFDo(<q-args>)

command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction


" Additions from http://statico.github.com/vim.html
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nmap <leader>l :call NumberToggle()<CR>
nmap <leader>p :set paste!<CR>
" Movement on Wrapped lines.
nmap j gj
nmap k gk
" Some Emacs imrpovements
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby', 'php'], 'passive_filetypes': [] }
nmap<F2> :SyntasticCheck<CR>
imap <F2> <ESC>:SyntasticCheck<CR>a

source ~/.vimrc_system
