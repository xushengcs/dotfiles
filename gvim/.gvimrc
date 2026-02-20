""" 设置语言
" set langmenu=en_US  " 英文菜单
" let $LANG = 'en_US'  " 显示英文信息
set langmenu=zh_CN.UTF-10  " 中文菜单
language message zh_CN.UTF-10  " 显示中文信息

""" 菜单乱码问题
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set guifont=Cascadia\ Mono:h11:cDEFAULT  " 字体
set columns=120
set lines=40
" winpos 700 30
