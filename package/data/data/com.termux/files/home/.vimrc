runtime! debian.vim
"""""""""""""""""""""""
" 定义后面用到的变量
" 可以在~/.vimrc内覆写
"""""""""""""""""""""""

" 插入文件头用到的作者
let g:author="Syomie"
" 调试/执行程序时的命令行参数
let g:cliagr="${HOME} OKEY!"

" 快捷键
" 自定义leader键 空格键
" <leader>bn :bn
" 映射全选+复制 ctrl+a
" 选中状态下 Ctrl+c 复制
" leader+1去空行
" leader+2比较文件
" leader+f+l格式化
" 新建标签 <M-2> :tabnew<CR>
" 按空格+5编译运行(支持C,C++,Java,Shell)
" 按空格+6调试运行(支持C,C++,Java,Shell)


"""""""""""""""""""""""
" 其他设置
"
"""""""""""""""""""""""

" 不兼容vi
set nocompatible

" 语法高亮
syntax on

" 根据检测到的文件类型加载缩进规则和插件。
filetype plugin indent on
filetype plugin on

" 以下内容会导致Vim的许多行为与普通的VI不同，但它们是强烈推荐的。
set showcmd		      " 在状态行显示指令(部分)
set showmatch		    " 显示匹配的括号
set ignorecase		  " 匹配时忽略大小写
set smartcase		    " 智能case匹配
set incsearch		    " 增量搜索
set autowrite		    " 在执行:next和:make等命令之前自动保存
set hidden		      " 放弃缓冲区时隐藏缓冲区
set mouse=a		      " 启用鼠标(所有模式)
set selection=exclusive
set selectmode=mouse,key
set number 		      " 显示行号
set hlsearch        " 搜索逐字符高亮
set autoread        " 自动读取改动

set shortmess=atI  	" 不显示援助乌干达儿童的提示
set vb t_vb=        " 关闭vim烦人的哔哔提示效果
set whichwrap+=<,>,h,l  " 允许backspace和光标键跨越行边界(不建议)
set scrolloff=3     	" 光标移动到buffer的顶部和底部时保持3行距离
set novisualbell    	" 不要闪烁(不明白)
set laststatus=1    	" 启动显示状态行(1),总是显示状态行(2)

" 折叠
set foldenable      	" 允许折叠
set foldcolumn=0
set foldminlines=10   " 允许折叠的最小行数
set foldmethod=indent
set foldlevel=3

" 显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
    set langmenu=zh_CN.UTF-8
endif

" 编码
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

" 自定义功能键 空格键
let mapleader="\<space>"
nmap <leader>w :w!<CR>
nmap <leader>bn :bn<CR>
" 映射全选+复制 ctrl+a
nnoremap <C-A> ggVGY
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y
"去空行
nnoremap <leader>1 :g/^\s*$/d<CR>
"比较文件
nnoremap <leader>2 :vert diffsplit
" 格式化
nnoremap <leader>fl gg=G
" 新建标签
nnoremap <M-2> :tabnew<CR>
" 按空格+5编译运行(支持C,C++,Java,Shell)
nnoremap <leader>5 <Esc>:call CompileRunGcc()<CR>
" 按空格+6调试运行(支持C,C++,Java,Shell)
nnoremap <leader>6 <Esc>:call Rungdb()<CR>

func! CompileRunGcc()
    exec "w"
    if &filetype == 'c' |filetype == 'h'
        exec "!g++ %:p -o %:p:r && %:p:r ".g:cliagr
    elseif &filetype == 'cpp'
        exec "!g++ %:p -o %:p:r && %:p:r ".g:cliagr
    elseif &filetype == 'java'
        exec "!javac % && java %:p:r ".g:cliagr
    elseif &filetype == 'sh'
        exec "!chmod 755 %:p && %:p ".g:cliagr
    else
        echoerr "未设置预设适合的编译器！"
    endif
endfunc
"C,C++的运行调试
func! Rungdb()
    exec "w"
    exec "!g++ %:p -g -o %:h/%:t"
    exec "!gdb %:h/%:t"
endfunc
nnoremap <F8> :call Rungdb()<CR>

" 共享剪贴板
set clipboard+=unnamed
" make 运行
set makeprg=g++\ -Wall\ \ %
" 设置魔术
set magic
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set cindent
" Tab键的宽度
set tabstop=2
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 空格代替制表符
set expandtab
" 在行和段开始处使用制表符
set smarttab
" 历史记录数
set history=1000
" 生成临时文件
set backup
set swapfile
set incsearch
" 行内替换
set gdefault
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2

" 符号补全
inoremap <leader><TAB> <C-P>
inoremap ` ``<Left>
inoremap ' ''<Left>
inoremap <leader>F  <Esc>:cal FunctionCreate("")<Left><Left>

func Func_create_sh(name)
    call append(line("."),"}")
    call append(line("."),"    ")
    call append(line("."),a:name."(){")
    normal 2j$a
endfunc

func FunctionCreate(name)
    if &filetype == 'sh'
        call Func_create_sh(a:name)
    endif
endfunc
" 默认文件头
func SetFileHead_all()
    call setline(1,"/*")
    call append(line("."), "")
    call append(line("."), "")
    call append(line("."), " */")
    call append(line("."), " *")
    call append(line("."), " *   描    述：")
    call append(line("."), " *   创建日期：".strftime("%Y年%m月%d日"))
    call append(line("."), " *   创 建 者：".g:author)
    call append(line("."), " *   文件名称：".expand("%:t"))
    call append(line("."), " *   ")
    call append(line("."),   " *   Copyright (C) ".strftime("%Y")." All rights reserved.")
    normal Gk0
endfunc
" 加入shell,Makefile文件头
func SetFileHead_sh()
    call setline(3, "#################################################################")
    call setline(4, "#   Copyright (C) ".strftime("%Y")." All rights reserved.")
    call setline(5, "#   ")
    call setline(6, "#   文件名称：".expand("%:t"))
    call setline(7, "#   创 建 者：".g:author)
    call setline(8, "#   创建日期：".strftime("%Y年%m月%d日"))
    call setline(9, "#   描    述：")
    call setline(10, "#")
    call setline(11, "#################################################################")
    call setline(12, "")
    call setline(13, "")
endfunc

" 插入文件头
" g:author为作者
func SetFileHead()
    if &filetype == 'make'
        call setline(1,"")
        call setline(2,"")
        call SetFileHead_sh()

    elseif &filetype == 'sh'
        call setline(1,"#!/bin/bash")
        call setline(2,"")
        call SetFileHead_sh()
    else
        call SetFileHead_all()
        if expand("%:e") == 'hpp'
            call append(line("."), "#endif //".toupper(expand("%:t:r"))."_H")
            call append(line("."), "#endif")
            call append(line("."), "}")
            call append(line("."), "#ifdef __cplusplus")
            call append(line("."), "")
            call append(line("."), "#endif")
            call append(line("."), "{")
            call append(line("."), "extern \"C\"")
            call append(line("."), "#ifdef __cplusplus")
            call append(line("."), "#define _".toupper(expand("%:t:r"))."_H")
            call append(line("."), "#ifndef _".toupper(expand("%:t:r"))."_H")
        elseif expand("%:e") == 'h'
            call append(line("."), "#pragma once")
        elseif &filetype == 'java'
            call append(line("."), "}")
            call append(line("."), "    }")
            call append(line("."), "        ")
            call append(line("."), "    public void function ".expand("%:r")."(){")
            call append(line("."), "public class ".expand("%:r")." {")
        elseif &filetype == 'c'
            call append(line("."),"#include <".expand("%:t:r").".h>")
        elseif &filetype == 'cpp'
            call append(line("."), "")
            call append(line("."), "}")
            call append(line("."), "")
            call append(line("."), "int main(int argc,char* argv[]){")
            call append(line("."), "")
            call append(line("."), "}")
            call append(line("."), "    return hash_(p);")
            call append(line("."), "constexpr unsigned long long operator \"\" _hash(char const* p, size_t){")
            call append(line("."), "// 编译时字符串＋后缀_hash(\"abc\"_hash) 将调用hash_转换为数值常量，可用于case判断")
            call append(line("."), "}")
            call append(line("."), "    return *str ? hash_(str+1, (*str ^ last_value) * prime) : last_value;")
            call append(line("."), "constexpr hash_t hash_(char const* str, hash_t last_value = basis){")
            call append(line("."), "")
            call append(line("."), "constexpr hash_t basis = 0xCBF29CE484222325ull;")
            call append(line("."), "constexpr hash_t prime = 0x100000001B3ull;")
            call append(line("."), "")
            call append(line("."), "typedef uint64_t hash_t;")
            call append(line("."), "using namespace std;")
            call append(line("."), "")
            call append(line("."), "#include <cstdlib>")
            call append(line("."), "#include <cstdio>")
        endif
    endif
endfun

"新建文件，自动插入文件头
autocmd BufNewFile *.[ch],*.hpp,*.cpp,Makefile,*.mk,*.sh,*.java exec ":call SetFileHead()"
autocmd InsertEnter * se cul    " 用浅色高亮当前行
