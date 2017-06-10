set nocompatible
filetype plugin on

" VAM and Plugins "

fun! SetupVAM()
    let c = get(g:, 'vim_addon_manager', {})
    let g:vim_addon_manager = c
    let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'
    " most used options you may want to use:
    " let c.log_to_buf = 1
    " let c.auto_install = 0
    let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
    if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
        execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
            \       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
    endif
    call vam#ActivateAddons([ ], {'auto_install' : 1})
endfun

call SetupVAM()

VAMActivate EasyMotion
VAMActivate ShowTrailingWhitespace
VAMActivate ctrlp
VAMActivate github:altercation/vim-colors-solarized
VAMActivate vim-airline
call vam#ActivateAddons([ 'vim-airline' ])

let mapleader = ","

" Misc "

syntax on
set number
set cursorline
set pastetoggle=<leader>.
set showcmd
set wildmenu
set wildmode=list:longest
set title
set visualbell
set backspace=indent,eol,start
set scrolloff=10
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Spell check if .tex
autocmd BufNewFile,BufRead *.tex set spell

" Indentation
filetype indent off
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set autoindent
filetype plugin indent off

" Search highlighting
set hlsearch
set ignorecase
nnoremap ./ :nohlsearch<CR>

" Quick editing and sourcing of the vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Colors (solarized)
set background=dark
colorscheme solarized

" Use w!! to write the file even if I forgot sudo
cnoremap w!! w !sudo tee % > /dev/null

" Window mastery (mad props to Brad Hekman)
nnoremap - :new<CR>
nnoremap \| :vnew<CR>
set splitbelow
set splitright
nnoremap <leader>- :res -5<CR>
nnoremap <leader>= :res +5<CR>
nnoremap <leader>9 :vertical res -5<CR>
nnoremap <leader>0 :vertical res +5<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Quicker buffer switching and closing
nnoremap <leader>m :bnext!<CR>
nnoremap <leader>n :bprevious!<CR>
nnoremap <leader>z :bp <BAR> bd #<CR>

" Disable Shift-K
nnoremap K <NoP>

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Plugin Config "

" Remove silly <leader><leader> thing in EasyMotion
"map <Leader> <Plug>(easymotion-prefix)

" Remap find-repeat-backwards
nnoremap ' ,

" vim-airline
" Show the open buffers across the top of the window
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" ctrlp
" Switching c-p and c-c so that c-p will close it
let g:ctrlp_prompt_mappings = {
    \ 'PrtHistory(1)':        ['<c-c>'],
    \ 'PrtExit()':            ['<esc>', '<c-p>', '<c-g>'],
    \ }

let g:ctrlp_custom_ignore = { 'file': '\.o$\|\.d$' }

filetype indent off

