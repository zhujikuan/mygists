set nocompatible     " vim运行在兼容模式
set backspace=2      " 在大多数终端修正backspace的行为
syntax on            " 支持语法高亮显示
set number      " 显示行号
set relativenumber      " 显示行号
set ruler
set showmode
set showcmd
set wildmenu
set hlsearch    " 高亮搜索结果

" 为swap文件指定统一存放位置
"if !isdirectory("~/.vim/swap")
"    call mkdir("~/.vim/swap","p")
"endif
"set directory=~/.vim/swap//   
set noswapfile

" 为所有文件设置永久性撤销
set undofile
" if !isdirectory("~/.vim/undodir")
"    call mkdir("~/.vim/undodir","p")
" endif
set undodir="~/.vim/undodir"

" 缩进相关
filetype plugin indent on "启用根据文件类型自动缩进
set autoindent       " 开始新行时处理缩进
set shiftwidth=4     "用于自动缩进的空格数
set expandtab        "将制表符tab展开为空格
set tabstop=4        "要计算的空格数


set foldmethod=syntax


" =====================================================
" Plug Management
" =====================================================
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    " autocmd 
endif

call plug#begin()
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"  跳转插件
Plug 'easymotion/vim-easymotion'

" 主题插件
Plug 'ghifarit53/tokyonight-vim'
"

Plug 'preservim/tagbar'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()


" 主题美化
" https://github.com/ghifarit53/tokyonight-vim
set background=dark
set termguicolors
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

" 按键映射
" · <space>表示空格。
" · <esc>表示Esc键。
" · <cr>和<enter>表示Enter键。
" · <tab>表示制表符Tab键。
" · bs表示退格键。
" · <up>、<down>、<left>和<right>表示箭头键。
" · <pageup>、<pagedown>表示上下翻页键。
" · <f1>～<f12>表示12个功能键。
" · <home>、<insert>、<del>和<end>分别表示Home、Insert、Delete和End键
let mapleader = "\<SPACE>" " 将先导键映射为空格键
noremap <leader>wq :wq<cr>
nnoremap <F2> :TagbarToggle<CR>
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F8> :PlugInstall<CR>
" noremap wh :vertical resize +1<CR>
" noremap wl :vertical resize -1<CR>


" vim-which-key setting
" https://github.com/liuchengxu/vim-which-key
" By default timeoutlen is 1000 ms
" coc.vim setting
"

