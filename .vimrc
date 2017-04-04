"-----------------------------------------------------------
"                yshen's vim settings
"----------------------------------------------------------
"
" PLUGINS
" ---------
" 1.插件管理
"   Vundle
" 2.索引提示
"   ctag             生成工程的符号文件
"   cscope           生成工程符号文件引用关系
"   Tagbar           右边栏显示文件中的符号
" 3.自动完成
"   echofunc.vim     显示函数定义
"   OmniCppComplete  提示结构体成员
"   SuperTab         TAB键自动完成
" 4.文件浏览
"   The-NERD-tree
"   ctrlp.vim
" 5.其他
"   molokai          配色主题
"   c-standard-functions-highlight  高亮C语言函数
"
"
" HOWTO
" ----------
" 1.快捷键映射
"   <F1>
"   <F2> 显示目录窗口
"   <F3> 显示符号窗口
"   <F4> 生成工程的符号文件
"
"   <F5> 高亮文本中的符号 && 为CCTree 加载符号cscope.out
"   <F6> 代码格式
"   <F7>
"   <F8>
"
"   <F9>
"   <F10>
"   <F11>
"   <F12>
"
" INSTALL
" ---------
" 1. Install Vundle first
" 2. Install plugin by Vundle using :PluginUpdate
" 3. Copy this setting in your ~/.vimrc
"
"-----------------------------------------------------------
"                Vundle settings
"----------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

Plugin 'vim-airline/vim-airline'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}
"Plugin 'taglist.vim'
Plugin 'Tagbar'
Plugin 'The-NERD-tree'
Plugin 'c-standard-functions-highlight'
Plugin 'molokai'
Plugin 'ctrlp.vim'
Plugin 'echofunc.vim'
Plugin 'OmniCppComplete'
"Plugin 'Syntastic'
Plugin 'SuperTab'
Plugin 'hari-rangarajan/CCTree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"-----------------------------------------------------------
"                generic vim settings
"----------------------------------------------------------

" 显示行号
set nu
" tab键为4个空格
set ts=4
" 自动切换为编辑文件的目录
set autochdir

"忽略大小写检索
set ignorecase
"输入检索时动态变化
set incsearch
"检索高亮
set hlsearch
" 突出显示当前行
"set cursorline 
" 打开状态栏标尺
set ruler 
" 语法高亮
syntax on
" 在INSERT模式下移动
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
" 设置匹配模式，显示匹配的括号
set showmatch 
" 使用鼠标
set mouse=a
"自动缩进
set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set cindent
set autoindent
set noautoindent
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s


"-----------------------------------------------------------
"                indent the current file 
"----------------------------------------------------------
" 1.save 2.run indent 3.reopen
map <F6> :w <CR> :!indent --blank-lines-after-declarations --no-space-after-function-call-names --brace-indent0 --declaration-indentation9  % <CR> :e<CR>
"-----------------------------------------------------------
"                ctags
"----------------------------------------------------------
set tags=./
set tags=tags;
"生成tag cscope tags.vim等符号文件
"ctags --list-kinds 来查看生成那些符号
map <F4> :!ctags -R  --fields=+iaS --extra=+q . && cscope -Rbq  &&  awk '{print "syntax keyword tag "$1}' tags > tags.vim <CR>
"映射F4在插入模式下也可以用
imap <F4> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . && cscope -Rbq  &&  awk '{print "syntax keyword tag "$1}' tags > tags.vim<CR>
map <F5> :so tags.vim<CR> :CCTreeLoadDB cscope.out<CR>
imap <F5> <ESC> :so tags.vim<CR> :CCTreeLoadDB cscope.out<CR>

" Ctrl+\ - Open the definition in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" Alt+] - Open the definition in a vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"-----------------------------------------------------------
"                tagbar
"----------------------------------------------------------
"type help: tagbar for more info
let g:tagbar_ctags_bin='ctags'          "ctags程序的路径
let g:tagbar_width=30                   "窗口宽度的设置
"let g:tagbar_left = 1
let g:tagbar_right = 1
map <F3> :Tagbar<CR>
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen() "如果是c语言的程序的话，tagbar自动开启
"-----------------------------------------------------------
"               NERDTree 
"----------------------------------------------------------
"type help: nerdtree for more info
"autocmd vimenter * NERDTree     "自动打开NERDTree
map <F2> :NERDTreeToggle<CR>  "打开和关闭的快捷键
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif "自动关闭

"-----------------------------------------------------------
"               Cscope 
"----------------------------------------------------------
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
     cs add cscope.out
  " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
  
  set csverb
endif

nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" Using 'CTRL-spacebar' then a search type makes the vim window
" split horizontally, with search result displayed in
" the new window.

nmap <C-\>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :scs find d <C-R>=expand("<cword>")<CR><CR>
" Hitting CTRL-space *twice* before the search type does a vertical
" split instead of a horizontal one

nmap <C-\><C-\>s
        \:vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\><C-\>g
        \:vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\><C-\>c
        \:vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\><C-\>t
        \:vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\><C-\>e
        \:vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\><C-\>i
        \:vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\><C-\>d
        \:vert scs find d <C-R>=expand("<cword>")<CR><CR>

	
"-----------------------------------------------------------
"               color scheme
"                         https://github.com/altercation/vim-colors-solarized
"                         https://github.com/tomasr/molokai
"----------------------------------------------------------

"set background=light
"colorscheme solarized

"set background=dark
"colorscheme solarized

colorscheme molokai
let g:molokai_original = 1

"-----------------------------------------------------------
"               auto complete
"                   https://github.com/vim-scripts/OmniCppComplete
"----------------------------------------------------------

let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全 
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全 
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表 


"-----------------------------------------------------------
"               syntastic
"             https://github.com/vim-syntastic/syntastic
"----------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"-----------------------------------------------------------
"               cctree
"----------------------------------------------------------
let g:CCTreeKeyTraceForwardTree = '<C-\>>'
let g:CCTreeKeyTraceReverseTree = '<C-\><'
let g:CCTreeKeyHilightTree = '<C-l>'
let g:CCTreeKeySaveWindow = '<C-\>y'
let g:CCTreeKeyToggleWindow = '<C-\>w'
let g:CCTreeKeyCompressTree = 'zs'  
let g:CCTreeKeyDepthPlus = '<C-\>='
let g:CCTreeKeyDepthMinus = '<C-\>-'
