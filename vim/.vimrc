set nocompatible     " vim运行在兼容模式
set backspace=2      " 在大多数终端修正backspace的行为
syntax on            " 支持语法高亮显示
packloadall "加载所有插件
silent! helptags ALL  " 为所有插件加载帮助文档

" 为swap文件指定统一存放位置
"if !isdirectory("~/.vim/swap")
"    call mkdir("~/.vim/swap","p")
"endif
"set directory=~/.vim/swap//   
set noswapfile

" 为所有文件设置永久性撤销
set undofile
if !isdirectory("~/.vim/undodir")
    call mkdir("~/.vim/undodir","p")
endif
set undodir="~/.vim/undodir"

" 缩进相关
filetype plugin indent on "启用根据文件类型自动缩进
set autoindent       " 开始新行时处理缩进
set shiftwidth=4     "用于自动缩进的空格数
set expandtab        "将制表符tab展开为空格
set tabstop=4        "要计算的空格数

" 美化
colorscheme murphy   " 修改配色


set foldmethod=syntax
"set foldmethod=marker

set number      " 显示行号
set hlsearch    " 高亮搜索结果



" 插件管理
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    " autocmd 
endif

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Run your favorite search tool from Vim, with an enhanced results list
Plug 'mileszs/ack.vim'

" 
Plug 'easymotion/vim-easymotion'

" let g:plug_timeout = 300
" Plug 'Valloric/YouCompleteMe', {'do':'./install.py'}
"
Plug 'sjl/gundo.vim'

" Initialize plugin system
call plug#end()







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
let mapleader = "\<space>" " 将先导键映射为空格键
noremap <leader>wq :wq<cr>
nnoremap <F3> :NERDTreeToggle<CR>
