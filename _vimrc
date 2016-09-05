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
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"�Զ�ȫ��
autocmd GUIEnter * simalt ~x
"pathogen
execute pathogen#infect()
"�ļ�����ʶ��
filetype plugin indent on
"�﷨����
syntax on
syntax enable
"�к�
set nu!
"��ɫ����
colorscheme desert

"mru
let MRU_Max_Entries = 1000 "����mru������Ŀ

"��ݼ�
nnoremap <silent> <F3> :vimgrep /\<<C-r><C-w>\>/j E:\ZjhServer\c++\**\*.* <Bar> cw<CR>
nnoremap <silent> <F4> :cclose<CR>
nnoremap <silent> <F5> :MRU<CR> 
nnoremap <silent> <F6> :NERDTree E:\ZjhServer\c++<CR>
