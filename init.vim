  "install vim-plug
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  " " silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
      " " \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " " autocmd VimEnter * PlugInstall --sync
  endif

  call plug#begin('~/.vim/plugged')
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'vim-airline/vim-airline'
  Plug 'Yggdroot/indentLine'
  Plug 'jiangmiao/auto-pairs'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'Lokaltog/vim-distinguished'
  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-surround'
  Plug 'prettier/vim-prettier', { 'do': 'npm install' }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'terryma/vim-multiple-cursors'
  Plug "tpope/vim-repeat" 
  Plug 'joshdick/onedark.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'pangloss/vim-javascript' 
  Plug 'dense-analysis/ale'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'SirVer/ultisnips'
  Plug 'mlaursen/vim-react-snippets'

  call plug#end()
  set nocompatible
 " set number relativenumber
  set nobackup
  set nowritebackup
  set noswapfile
  set number
  set mouse=a
  set expandtab
  set shiftwidth=2
  set softtabstop=2
  set nowrap
  set cursorline
  set termguicolors
  set hidden
  set noshowmode
  set background=dark
  set autoread
  set spell spelllang=en_us
  syntax on
  filetype on
  filetype plugin indent on 
  filetype plugin on
  " setlocal foldmethod=syntax

  if (has("termguicolors"))
  " " set termguicolors
  " endif
  let g:onedark_color_overrides = {
  \ "background": {"gui": "#232323", "cterm": "235", "cterm16": "0" },
  \ "purple": { "gui": "#C678DF", "cterm": "170", "cterm16": "5" },
  \ "foreground": { "gui": "#D0C49F", "cterm": "170", "cterm16": "5"}
  \}

  "colorscheme
  colorscheme onedark


  " use <tab> for trigger completion and navigate to the next complete item
  function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()
  "mappings
  let mapleader=','
  nnoremap <Leader>nn : NERDTreeToggle<cr>
  nnoremap <C-S> :w<CR>
  vnoremap <C-S> <esc>:w<CR>
  inoremap <C-S> <esc>:w<CR>
  nnoremap <C-Q> :q<CR>
  inoremap <C-Q> <esc>:q<CR>
  vnoremap < <gv
  vnoremap > >gv
  " nnoremap <C-A> ggVGG
  " vnoremap <C-A> ggVGG
  nnoremap <Leader><Space> :nohlsearch<CR>
  nnoremap ,, :NERDTreeFind<CR>
  nnoremap <F9> :w <bar> !python3 % <CR>
  nnoremap <F8> :w <bar> !ruby % <CR>
  nnoremap <F5> :w <bar> !firefox %<CR>
  nnoremap <F2> :wq <CR>
  nnoremap <Leader>e : CocCommand eslint.executeAutofix <CR> 
  nnoremap <Leader>a : !rubocop --auto-correct <CR>
  nnoremap <Leader>f : FZF<CR>
  map th  :tabfirst<CR>
  map tk  :tabnext<CR>
  map tj  :tabprev<CR>
  map tl  :tablast<CR>
  " Ctrl + C to xclip
  vnoremap <C-c> "+y
  "emmet
  let g:user_emmet_leader_key=','

  "ultisnips
  let g:UltiSnipsExpandTrigger="<Leader>r"

  " indentLine
  let g:indentLine_first_char = '┊'
  let g:indentLine_char = '┊'
  let g:indentLine_showFirstIndentLevel = 2


  " vim-airline
  let g:airline_theme='onedark'
  let g:airline_powerline_fonts = 1
  "let g:airline#extensions#tabline#enabled = 1
  "let g:airline#extensions#bufferline#enabled = 1
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''


  "silver
 
  let g:ackprg = 'ag --nogroup --nocolor --column'

  " nerdtree
  autocmd StdinReadPre * let s:std_in=1
  "autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  "let NERDTreeMapOpenInTab='<ENTER>'
  " nerdcommenter
  let g:NERDSpaceDelims = 1
  let NERDTreeShowHidden=1
  nnoremap <C-_> :call NERDComment('Toggle', 'Toggle')<CR>
  inoremap <C-_> <esc>:call NERDComment('Toggle', 'Toggle')<CR>
  vnoremap <C-_> :call NERDComment('Toggle', 'Toggle')<CR>gv

  " ALE
  let g:ale_sign_error = ''
  let g:ale_sign_warning = ''

  let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
  let g:ale_linters = {'jsx': ['stylelint', 'eslint']}

  call ale#Set('css_stylelint_executable', 'stylelint')
  call ale#Set('css_stylelint_options', '')
  call ale#Set('css_stylelint_use_global', get(g:, 'ale_use_global_executables', 0))

  function! ale_linters#css#stylelint#GetCommand(buffer) abort
  " " return '%e ' . ale#Pad(ale#Var(a:buffer, 'css_stylelint_options'))
  " " \   . ' --stdin-filename %s'
  endfunction

  call ale#linter#Define('css', {
  \   'name': 'stylelint',
  \   'executable': {b -> ale#node#FindExecutable(b, 'css_stylelint', [
  \      'node_modules/.bin/stylelint',
  \   ])},
  \   'command': function('ale_linters#css#stylelint#GetCommand'),
  \   'callback': 'ale#handlers#css#HandleStyleLintFormat',
  \})

  let g:ale_fixers = {
  \   'javascript': ['prettier', 'eslint'],
  \   'css': ['prettier', 'stylelint'],
  \   'HTML': ['prettier']
  \}

  augroup FiletypeGroup
  " " autocmd!
  " " au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
  augroup END

  " vim-devicons
  let g:DevIconsEnableFoldersOpenClose = 1

  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['json'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['jsx'] = 'ﰆ'
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vim'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['yaml'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['yml'] = ''

  let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {}
  let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*vimrc.*'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.gitignore'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['package.json'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['package.lock.json'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['node_modules'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['webpack\.'] = 'ﰩ'

  let g:NERDTreeHighlightFolders = 1
  let g:NERDTreeHighlightFoldersFullName = 1 

  " autocmd TextChanged,TextChangedI *.md silent write
  au TextChanged,TextChangedI <buffer> if &readonly == 0 && filereadable(bufname('%')) | silent write | endif


endif

command! ChatGPT call send_request()
