set nocompatible
"filetype on

call plug#begin('~/.config/nvim/plugged')

Plug 'ludovicchabant/vim-gutentags'
"Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'jedverity/feral-vim'
"Plug 'pangloss/vim-javascript'
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'tomtom/tlib_vim'
"Plug 'StanAngeloff/php.vim'
"Plug 'xenoterracide/html.vim'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
"Plug 'othree/xml.vim'
"Plug 'Kris2k/matchit'
"Plug 'vim-scripts/YankRing.vim'
Plug 'machakann/vim-highlightedyank'
"Plug 'ap/vim-css-color'
"Plug 'tpope/vim-eunuch'
"Plug 'kshenoy/vim-signature'
"Plug 'rizzatti/funcoo.vim'
"Plug 'rizzatti/dash.vim'
"Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rhubarb'
"Plug 'xolox/vim-misc'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-dispatch'
"Plug 'mxw/vim-jsx'
"Plug 'AndrewRadev/splitjoin.vim'
"Plug 'terryma/vim-expand-region'
"Plug 'dahu/vim-lotr'
"Plug 'airblade/vim-gitgutter'
"Plug 'jeffkreeftmeijer/vim-numbertoggle'
"Plug 'gabesoft/vim-ags'
"Plug 'nanotech/jellybeans.vim'
"Plug 'nixprime/cpsm'
"Plug 'heavenshell/vim-jsdoc'
"Plug 'vim-scripts/ReplaceWithRegister'
"Plug 'unblevable/quick-scope'
"Plug 'kana/vim-operator-user'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'facebook/vim-flow'
"Plug 'tpope/vim-speeddating'
Plug 'leafgarland/typescript-vim'
"Plug 'ekalinin/Dockerfile.vim'
"Plug 'fatih/vim-go'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'preservim/nerdtree' |
      \ Plug 'Xuyuanp/nerdtree-git-plugin' |
      \ Plug 'ryanoasis/vim-devicons'
Plug 'bryanmylee/vim-colorscheme-icons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'vim-test/vim-test'
"Plug 'rhysd/git-messenger.vim'
Plug 'radenling/vim-dispatch-neovim'

call plug#end()

""set encoding=utf8
"set guifont=Inconsolata_Nerd_Font:h12
""
set rtp+=~/.fzf

set modelines=0
"" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
"set list
"" remove trailing spaces automatically on save
autocmd BufWritePre * %s/\s\+$//e

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set scrolloff=3
set autoindent
set smartindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set cursorcolumn
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile
set relativenumber
set isfname+=32

nnoremap <SPACE> <Nop>
map <Space> <Leader>

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader>, :noh<cr>
nnoremap <leader>r :%s/

"set wrap
set textwidth=79
set formatoptions=qrn1

set list
set listchars=tab:▸\

"" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

"" real-time highlighting when substituting
set inccommand=split

"noremap <up>    <C-W>+
"noremap <down>  <C-W>-
"noremap <left>  3<C-W><
"noremap <right> 3<C-W>>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

"nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
"nnoremap <leader>ft Vatzf
"nnoremap <leader>v V`]
nnoremap <leader>ev <C-w><C-v><C-l>:e ~/.config/nvim/init.vim<cr>
"nnoremap <leader>eb <C-w><C-v><C-l>:e config/bundles.vim<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>
"nnoremap <leader>w <C-w>v<C-w>l
nmap <leader><space> :w<cr>

colorscheme feral
""colorscheme OceanicNext
""
set wildignore+=*.o,*.obj,app/locale/**,app/code/community/**,/Users/jed/Sites/ecomom/gooder/var,/Users/jed/Sites/ecomom/gooder/lib,*.png,*.jpg,*.gif,**/.DS_Store,*.csv,.sass-cache/**,node_modules

"" replace selected text
"vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

"let javascript_enable_domhtmlcss=1

"nnoremap <leader>bi vi{
"nnoremap <leader>pi vi(
"nnoremap <leader>ba va{
"nnoremap <leader>pa va(

"" easy toggle to last buffer
nnoremap ,, <C-^>

"" easier autocompletion
"inoremap <C-c><C-f> <C-x><C-f>

"" git shortcuts
nnoremap <leader>gm :Gmerge<CR>
nnoremap <leader>gs :Gstatus<CR><C-w>20+
nnoremap <leader>ps :Dispatch git push<CR>
nnoremap <leader>pu :Gpull<CR>
nnoremap <leader>yu :GBrowse!<CR>
vnoremap <leader>yu :GBrowse!<CR>
nnoremap <leader>yl :.GBrowse!<CR>
vnoremap <leader>yl :.GBrowse!<CR>
nnoremap <leader>ou :GBrowse<CR>
nnoremap <leader>ol :.GBrowse<CR>

""quick access to clipboard history
"nmap ,yr :YRShow<CR>
"imap ,yr :YRShow<CR>

""paste from system clipboard
"nmap <P "*P
"nmap <p "*p

""quick language switch
"nmap ,html :setf html<CR>
"nmap ,php :setf php<CR>

""window enter / leave hooks
au FocusLost * :set number
au FocusGained * :set relativenumber
au WinEnter * :set cursorline
au WinLeave * :set nocursorline
au WinEnter * :set cursorcolumn
au WinLeave * :set nocursorcolumn
au WinEnter * :set colorcolumn=85
au WinLeave * :set colorcolumn=0

"" Autoclear trailing white-space and save cursor position
""fun! <SID>StripTrailingWhitespaces()
  ""let l = line(".")
  ""let c = col(".")
  ""%s/\s\+$//e
  ""call cursor(l, c)
""endfun

""autocmd FileType c,cpp,java,php,ruby,python,vim,coffee,js,html,css autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

""line movement aliases
"nnoremap <leader>lj :m .+1<CR>==
"nnoremap <leader>lk :m .-2<CR>==
"inoremap <leader>lj <Esc>:m .+1<CR>==gi
"inoremap <leader>lk <Esc>:m .-2<CR>==gi
"vnoremap <leader>lj :m '>+1<CR>gv=gv
"vnoremap <leader>lk :m '<-2<CR>gv=gv''

"" easier beginning and end of line
"noremap H ^
"noremap L $

""dash shortcut
":nmap <silent> <leader>d <Plug>DashSearch

""statusline (powerline)
"set noshowmode

"if ! has('gui_running')
    "set ttimeoutlen=10
    "augroup FastEscape
        "autocmd!
        "au InsertEnter * set timeoutlen=0
        "au InsertLeave * set timeoutlen=1000
    "augroup END
"endif


""====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======

    "exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
    "set list

"" location list stuff
nmap <leader>xl :lclose<CR>:cclose<CR>

""system copy/paste
"vmap <Leader>y "+y
"vmap <Leader>d "+d
"nmap <Leader>p "+p
"nmap <Leader>P "+P
"vmap <Leader>p "+p
"vmap <Leader>P "+P

""calendar
"let g:calendar_google_calendar = 1
"let g:calendar_google_task = 1

""delimitMate
"let delimitMate_expand_cr = 1

"" Move visual block
"vnoremap J :m '>+1<CR>gv=gv
"vnoremap K :m '<-2<CR>gv=gv

"" vim-easy-align
"" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
"vmap <Enter> <Plug>(EasyAlign)

"nmap <Leader>ae mz<Plug>(EasyAlign)ip=`zmz
"nmap <leader>ac viB<CR>:

""easyalign visual mode with 'from' as delimiter
"vmap <leader>af <CR>*<C-X>from<CR>
"nmap <leader>af vip<CR>*<C-X>from<CR>


"" suffixes for go to file
"set suffixesadd+=.js

"" common scenario of inserting then camelcasing
"inoremap <c-e> <esc>l~

"" prettify json
"nmap <Leader>js :%!python -m json.tool

"" save and push (from commit message)
"nmap <Leader>zzp :Gwrite<cr>:Gpush<cr>

""Dispatch
"nmap <Leader>bb :Dispatch

""Search and replace
"" .vim/plugin/qfdo.vim
"" Run a command on each line in the Quickfix buffer.
"" Qfdo! uses the location list instead.
"" Author: Christian Brabandt
"" Author: Douglas
"" See: http://vim.1045645.n5.nabble.com/execute-command-in-vim-grep-results-td3236900.html
"" See: http://efiquest.org/2009-02-19/32/
"" Usage:
""     :Qfdo s#this#that#
""     :Qfdo! s#this#that#
""     :Qfdofile %s#this#that#
""     :Qfdofile! %s#this#that#

"" Christian Brabandt runs the command on each *file*
"" I have mapped Qfdo to line-by-line below
"function! QFDo(bang, command)
   "let qflist={}
   "if a:bang
      "let tlist=map(getloclist(0), 'get(v:val, ''bufnr'')')
   "else
      "let tlist=map(getqflist(), 'get(v:val, ''bufnr'')')
   "endif
   "if empty(tlist)
      "echomsg "Empty Quickfixlist. Aborting"
      "return
   "endif
   "for nr in tlist
      "let item=fnameescape(bufname(nr))
      "if !get(qflist, item,0)
            "let qflist[item]=1
      "endif
   "endfor
   "execute 'argl ' .join(keys(qflist))
   "execute 'argdo ' . a:command
"endfunction

"" Run the command on each *line* in the Quickfix buffer (or location list)
"" My own crack at it, based on Pavel Shevaev on efiquest
"function! QFDo_each_line(bang, command)
   "try
      "if a:bang
         "silent lrewind
      "else
         "silent crewind
      "endif
      "while 1
         "echo bufname("%") line(".")
         "execute a:command
         "if a:bang
            "silent lnext
         "else
            "silent cnext
         "endif
      "endwhile
   "catch /^Vim\%((\a\+)\)\=:E\%(553\|42\):/
   "endtry
"endfunction

"command! -nargs=1 -bang Qfdo :call QFDo_each_line(<bang>0,<q-args>)
"command! -nargs=1 -bang Qfdofile :call QFDo(<bang>0,<q-args>)

"" go to matching parens/brace
"nmap <leader>fc f(%
"nmap <leader>fC f{%
"nmap <leader>fo f)%
"nmap <leader>fO f}%

"" add spaces inside parens/brace
""nmap <leader>sb vibS<space>i<esc>
""nmap <leader>sB viBS<space>i<esc>

""easy add surrounding quotes
"nmap <leader>s' viwS'<esc>
"nmap <leader>s" viwS"<esc>

""jsdoc
"let g:jsdoc_allow_input_prompt  = 1
"let g:jsdoc_access_descriptions = 1
"let g:jsdoc_allow_shorthand     = 1
"let g:jsdoc_input_description   = 0

"" quick-scope
"let g:qs_first_occurrence_highlight_color = 155
"let g:qs_second_occurrence_highlight_color = 81

""search alias
nmap <leader>fs :Ag

"" fzf.vim
let g:fzf_buffers_jump = 1
nmap <leader>og :GitFiles<CR>
nmap <leader>or :History<CR>
nmap <leader>of :Files<CR>
nmap <leader>ob :Buffers<CR>
nmap <leader>ol :Lines<CR>
nmap <leader>ot :BTags<CR>
nmap <leader>tt :Tags<CR>
nmap <leader>oc :Commits<CR>
nmap <leader>bc :BCommits<CR>
let g:fzf_layout = { 'down': '~20%' }

"" allow for passing options into :Ag
"function! s:ag_with_opts(arg, bang)
  "let tokens  = split(a:arg)
  "let ag_opts = join(filter(copy(tokens), 'v:val =~ "^-"'))
  "let query   = join(filter(copy(tokens), 'v:val !~ "^-"'))
  "call fzf#vim#ag(query, ag_opts, a:bang ? {} : {'down': '40%'})
"endfunction

"autocmd VimEnter * command! -nargs=* -bang Ag call s:ag_with_opts(<q-args>, <bang>0)

"let g:python_host_prog = '/Users/glortho/miniconda3/bin/python'
"let g:python3_host_prog = '/Users/glortho/miniconda3/bin/python3'

"" airline
"let g:airline_powerline_fonts = 1

"" open quickfix window after grep
"autocmd QuickFixCmdPost *grep* cwindow

"" navigating w0rp/ale lint errors
"let g:ale_javascript_eslint_executable = 'eslint_d'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
"call airline#parts#define_function('ALE', 'ALEGetStatusLine')
"call airline#parts#define_condition('ALE', 'exists("*ALEGetStatusLine")')
"let g:airline_section_error = airline#section#create_left(['ALE'])
"let g:ale_linters = {
"\   'javascript': ['eslint'],
"\}

" NERDTree Mappings
nmap <leader>nf :NERDTreeFind<Cr>

"if exists("g:loaded_webdevicons")
  "call webdevicons#refresh()
"endif

let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-git',
  "\ 'coc-snippets',
  "\ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ ]

"" Use tab for trigger completion with characters ahead and navigate.
"" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"" Use <c-space> to trigger completion.
""if has('nvim')
  ""inoremap <silent><expr> <c-space> coc#refresh()
""else
  ""inoremap <silent><expr> <c-@> coc#refresh()
""endif

"" Make <CR> auto-select the first completion item and notify coc.nvim to
"" format on enter, <cr> could be remapped by other vim plugin
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              "\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"" Use `[g` and `]g` to navigate diagnostics
"" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

"" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

"" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>

"function! s:show_documentation()
  "if (index(['vim','help'], &filetype) >= 0)
    "execute 'h '.expand('<cword>')
  "elseif (coc#rpc#ready())
    "call CocActionAsync('doHover')
  "else
    "execute '!' . &keywordprg . " " . expand('<cword>')
  "endif
"endfunction

"" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

"" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)

"" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

"augroup mygroup
  "autocmd!
  "" Setup formatexpr specified filetype(s).
  "autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  "" Update signature help on jump placeholder.
  "autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end

"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

"" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)

"" Map function and class text objects
"" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"omap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap af <Plug>(coc-funcobj-a)
"xmap ic <Plug>(coc-classobj-i)
"omap ic <Plug>(coc-classobj-i)
"xmap ac <Plug>(coc-classobj-a)
"omap ac <Plug>(coc-classobj-a)

"" Remap <C-f> and <C-b> for scroll float windows/popups.
"if has('nvim-0.4.0') || has('patch-8.2.0750')
  "nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  "nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  "inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  "inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  "vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  "vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"endif

"" Use CTRL-S for selections ranges.
"" Requires 'textDocument/selectionRange' support of language server.
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

"" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocAction('format')

"" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)

"" Add `:OR` command for organize imports of the current buffer.
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"" Add (Neo)Vim's native statusline support.
"" NOTE: Please see `:h coc-status` for integrations with external plugins that
"" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"" Use <C-l> for trigger snippet expand.
"imap <C-l> <Plug>(coc-snippets-expand)

"" Use <C-j> for select text for visual placeholder of snippet.
"vmap <C-l> <Plug>(coc-snippets-select)

"" Use <C-j> for jump to next placeholder, it's default of coc.nvim
"let g:coc_snippet_next = '<c-l>'

"" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
"let g:coc_snippet_prev = '<c-k>'

"" Use <leader>x for convert visual selected code to snippet
"xmap <leader>x  <Plug>(coc-convert-snippet)

"" Show pop-up window for git blame
"nmap <leader>b :GitMessenger<CR>

"" Test Nearest test
"nmap <leader>tn :TestNearest<CR>
"nmap <leader>tf :TestFile<CR>
"nmap <leader>tl :TestLast<CR>
"nmap <leader>tv :TestVisit<CR>

"" Send results out to quickfix
"let test#strategy = "dispatch"

"" Explicitly declare jest as test runner for vim-test
"let g:test#javascript#runner = 'jest'

"Rails
nmap <leader>tfr :Start bin/rails test %<CR>
nmap <leader>tnr :execute "Start bin/rails test %:" . line(".")<CR>
nmap <leader>av :AV<CR>

"Integration tests
nmap <leader>tfi :Start npm run test:integration:storybook %<CR>
nmap <leader>tni :Start npm run test:integration:storybook %<CR>
