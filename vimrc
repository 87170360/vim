
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

set nu!
colorscheme desert
syntax enable
syntax on

let g:neocomplete#enable_at_startup = 1
set tags=tags;
set autochdir

let Tlist_Show_One_File=1 
let Tlist_Exit_OnlyWindow=1

let g:winManagerWindowLayout='FileExplorer|TagList' 
nmap wm :WMToggle<cr>

"nnoremap <silent> <F3> :Grep <CR> D:/MobileGame/bin/**/*.lua
"全字匹配
noremap <silent> <F3> :vimgrep /\<<C-r><C-w>\>/j D:\HuiheGame\GameTrunk\Server\bin\**\*.lua <Bar> cw<CR>
"noremap <silent> <F3> :vimgrep /\<<C-r><C-w>\>/j D:\HuiheGame\GameBranches\Server\bin\**\*.lua <Bar> cw<CR>

"模糊匹配
nnoremap <silent> <F4> :cclose<CR> 
nnoremap <silent> <F5> :MRU<CR> 
"nnoremap <silent> <F6> :NERDTreeToggle<CR>
nnoremap <silent> <F6> :NERDTreeToggle D:\HuiheGame\GameTrunk\Server\bin\GS\lua\modules<CR>
"nnoremap <silent> <F6> :NERDTreeToggle D:\HuiheGame\GameBranches\Server\bin\GS\lua\modules<CR>
nnoremap <silent> <F7> :%s/\s*$//g<CR>

set nocompatible "使用vim的键盘布局
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
filetype on                  "侦测文件类型插件
filetype plugin on       "为特定文件类型载入相关缩进文件
filetype indent on       "为特定文件类型载入相关缩进文件
set nobackup             "不要备份文件
set showmatch          "高亮显示匹配的括号
""set ignorecase           "搜索时忽略大小写，这个很实用
set incsearch             "搜索时，输入的词句逐字符高亮
set ruler                      "右下角显示光标位置的状态行
"set hlsearch               "高亮显示搜索结果
set nohlsearch

set autoindent             "继承前一行的缩进方式
set smartindent           "开启新行是使用智能自动缩进
set cindent                  "使用c样式的缩进
set tabstop=4              "制表符为4
set softtabstop=4
set shiftwidth=4          "统一缩进为4
set noexpandtab         "不要用空格代替制表符
set showmode            "显示文本处理模式
set confirm                  "处理未保存或者只读文件时，给出提示
set fileencoding=utf-8 "文件保存编码

set fileencodings=utf-8,gb2312,gbk,gb18030,cp936  "文件载入时检测的编码

set guioptions-=T        "注意 = 前面 有 - 号 ,隐藏不常用到的工具条

set guifont=Yahei_Mono:h13:cANSI   " 注意 ANS后面的字母是大写的 i 。。。如果自己安装了字体，在字体选择里面能看见你安装的font，例如它的名字是 YaHei  Consolas   Hybrid 的话，用下划线连接成：YaHei_Consolas_Hybrid，字母大小写也区分，否则不能识别。。。加载无效果，h后面的数字是字体大小，根据需 要设置即可。。

"自动全屏
 autocmd GUIEnter * simalt ~x

let MRU_Max_Entries = 1000 "设置mru缓存条目
let MRU_File = 'C:\Users\xx\_vim_mru_files'

"保存文件时，去掉指定格式文件的行尾空格
autocmd FileType cpp,lua autocmd BufWritePre <buffer> %s/\s\+$//e
