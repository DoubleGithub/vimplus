
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YCM 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set runtimepath+=~/.vim/YouCompleteMe     

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","      " 定义<leader>键
set nocompatible         " 设置不兼容原始vi模式
filetype on              " 设置开启文件类型侦测
filetype plugin on       " 设置加载对应文件类型的插件
set noeb                 " 关闭错误的提示
syntax enable            " 开启语法高亮功能
syntax on                " 自动语法高亮
set t_Co=256             " 开启256色支持
set cmdheight=2          " 设置命令行的高度
set showcmd              " select模式下显示选中的行数
set ruler                " 总是显示光标位置
set laststatus=2         " 总是显示状态栏
set number               " 开启行号显示
set cursorline           " 高亮显示当前行
set whichwrap+=<,>,h,l   " 设置光标键跨行
set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面
"set mouse=a              " 鼠标使能
"winpos 632 5             " 设定窗口位置       
"set lines=50 columns=92  " 设定窗口大小  
set noshowmode           " 不显示左下角提示
set vb t_vb=		     " 关闭警告音
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent           " 设置自动缩进
set cindent              " 设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0    " 设置C/C++语言的具体缩进方式
set smartindent          " 智能的选择对其方式
filetype indent on       " 自适应不同语言的智能缩进
set expandtab            " 将制表符扩展为空格
set tabstop=4            " 设置编辑时制表符占用空格数
set shiftwidth=4         " 设置格式化时制表符占用空格数
set softtabstop=4        " 设置4个空格为制表符
set smarttab             " 在行和段开始处使用制表符
set nowrap               " 禁止折行
set backspace=2          " 使用回车键正常处理indent,eol,start等

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu             " vim自身命名行模式智能补全
set completeopt-=preview " 补全时不显示窗口，只显示补全列表

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch            " 高亮显示搜索结果
set incsearch           " 开启实时搜索功能
set ignorecase          " 搜索时大小写不敏感

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码折叠
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=syntax   " 设置基于语法进行代码折叠
set nofoldenable        " 关闭折叠代码

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backup              " 设置备份
set backupdir=~/.vim/TempFiles/backupdir
set swapfile            " 允许生成临时文件
set directory=~/.vim/TempFiles/swapdir
set undofile            " 允许生成Undo文件
set undodir=~/.vim/TempFiles/undodir
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=DroidSansMono\ Nerd\ Font\ 12
"set langmenu=utf-8
"set helplang=cn

"读：fileencoding—–> encoding 
"显：encoding ——> termencoding 
"写：encoding ——-> fileencoding
"显示和内部处理的编码
set encoding=utf-8
"如果和上述的编码不匹配，则匹配下一个
set fileencodings=utf-8,gb18030,gbk,gb2312,cp936,ucs-bom,shift-jis
"终端编码方式
set termencoding=utf-8
"该选项是vim写入文件时采用的编码类型
set fileencoding=utf-8
    
"解决菜单乱码    
"source $VIMRUNTIME/delmenu.vim   
"source $VIMRUNTIME/menu.vim  
"""""""""""""""""""""""""""""""“”“”""""""""""""""""""""""""""""""""""""
"python	补全
let g:ycm_python_binary_path = 'python'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件列表
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/L9'
"Plug 'chxuan/cppfun'
Plug 'Yggdroot/indentLine'
Plug 'Yggdroot/LeaderF'
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
"Plug 'iamcco/mathjax-support-for-mkdp'
"Plug 'iamcco/markdown-preview.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plug 'rkulla/pydiction'
Plug 'Valloric/MatchTagAlways'
"Plug 'Valloric/YouCompleteMe'
Plug 'docunext/closetag.vim'
Plug 'godlygeek/tabular'
"Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
"Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'majutsushi/tagbar'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'vim-scripts/txt.vim'
"Plug 'ryanoasis/vim-devicons'
Plug 'gorodinskiy/vim-coloresque'
Plug 'will133/vim-dirdiff'
Plug 'mhinz/vim-startify'
Plug 'junegunn/vim-slash'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function'
Plug 'sgur/vim-textobj-parameter'
Plug 'Shougo/echodoc.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'terryma/vim-smooth-scroll'
Plug 'terryma/vim-expand-region'
Plug 'skywind3000/vim-preview'

call plug#end()            
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" load vim default plugin
runtime macros/matchit.vim

" 编辑vimrc文件
nnoremap <leader>e :edit $MYVIMRC<cr>

" 查看help文件
nnoremap <leader>h :edit ~/.vim/help.md<cr>

" 重新加载vimrc文件
nnoremap <leader>s :source $MYVIMRC<cr>

" buffer切换
nnoremap <c-n> :bn<cr>
nnoremap <c-p> :bp<cr>
nnoremap <leader>d :bd<cr>

" 主题
set background=dark
let g:onedark_termcolors=256
colorscheme monokai

" airline
let g:airline_theme="onedark"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_section_error = 0             " (ycm_error_count, syntastic-err, eclim)
let g:airline_section_warning = 0           " (ycm_warning_count, syntastic-warn, whitespace)

" cppfun
nnoremap <leader>y :CopyFun<cr>
nnoremap <leader>p :PasteFun<cr>
nnoremap <leader><leader>fp :FormatFunParam<cr>
nnoremap <leader><leader>if :FormatIf<cr>

" nerdtree
nnoremap <leader>n :NERDTreeToggle<cr>
inoremap <leader>n <esc> :NERDTreeToggle<cr>
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1         
let g:NERDTreeHighlightFoldersFullName = 1 
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollapsible='▼'

" Doxygen
let g:DoxygenToolkit_authorName="chxuan, 787280310@qq.com"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1
let g:DoxygenToolkit_commentType="Qt"


" ctags
"set tags+=/usr/include/tags
"set tags+=~/.vim/systags
"set tags+=~/.vim/x86_64-linux-gnu-systags

" a.vim: .h -> .cpp or .cpp -> .h
nnoremap <silent> <leader>a :A<cr>

" tagbar
let g:tagbar_width = 30
nnoremap <leader>t :TagbarToggle<cr>
inoremap <leader>t <esc> :TagbarToggle<cr>

" cpp_class_scope_highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let c_no_curly_error = 1

" incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" markdown
"let uname = system('uname -s')
"if uname == "Darwin\n"
""    let g:mkdp_path_to_chrome = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"
"else
""    let g:mkdp_path_to_chrome = '/usr/bin/google-chrome-stable %U'
"endif
"nmap <silent> <F7> <Plug>MarkdownPreview
"imap <silent> <F7> <Plug>MarkdownPreview
"nmap <silent> <F8> <Plug>StopMarkdownPreview
"imap <silent> <F8> <Plug>StopMarkdownPreview

" vim-easymotion
let g:EasyMotion_smartcase = 1
map <leader>w <Plug>(easymotion-bd-w)
nmap <leader>w <Plug>(easymotion-overwin-w)

" indentLine
let g:indentLine_enabled=1
nnoremap <leader><leader>il :IndentLinesToggle<cr>

" pydiction
"let g:pydiction_location='~/.vim/plugged/pydiction/complete-dict'
"let g:pydiction_menu_height=10

" nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" LeaderF
nnoremap <leader>f :LeaderfFile ~<cr>
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg','.vscode','.deepinwine','.oh-my-zsh'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}
let g:Lf_UseCache = 0

" echodoc.vim
let g:echodoc_enable_at_startup = 1

" tabular
nnoremap <leader>l :Tab /\|<cr>
nnoremap <leader>= :Tab /=<cr>

" vim-smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" ack
nnoremap <Leader>k :Ack!<space>

" vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-j>'
let g:multi_cursor_select_all_word_key = '<A-j>'
let g:multi_cursor_start_key           = 'g<C-j>'
let g:multi_cursor_select_all_key      = 'g<A-j>'
let g:multi_cursor_next_key            = '<C-j>'
let g:multi_cursor_prev_key            = '<C-k>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"""""""YCM 配置"""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"设置不显示错误信息
"let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_key_invoke_completion = '<c-z>'
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"关闭显示函数原型
"set completeopt=menu,menuone   
"let g:ycm_add_preview_to_completeopt = 0
"显示函数原型后，自动关闭窗口
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_autoclose_preview_window_after_completion = 1

noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
let g:ycm_filetype_whitelist = { 
			\ "c":1,
			\ "cpp":1, 
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
			\ }
			
let g:ycm_confirm_extra_conf = 0 
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_seed_identifiers_with_syntax = 1 
let g:ycm_complete_in_comments = 1 
let g:ycm_complete_in_strings = 1 
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.','re![_a-zA-z0-9]'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::','re![_a-zA-Z0-9]'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
let g:ycm_semantic_triggers.c = ['->', '.', ' ', '(', '[', '&',']']
nnoremap <leader>u :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>i :YcmCompleter GoToDefinition<cr>
nnoremap <leader>o :YcmCompleter GoToInclude<cr>
nnoremap <leader><leader>f :YcmCompleter FixIt<cr>
nmap <F3> :YcmDiags<cr>
			
""""""""""""""""快捷键编译"""""""""""""""""
"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ -Wall % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ -Wall % -o %<"
        exec "! ./%<"
    endif
endfunc
"C,C++的调试
map <F4> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ -Wall % -g -o %<"
    exec "!gdb ./%<"
endfunc            

""""""""""""""""""""格式化代码""""""""""""""""""""""""
map <F9> :call FormatCode()<CR>
func! FormatCode()
    exec "w"
    if &filetype == 'c' || &filetype == 'h'
        exec "!astyle --style=kr  %"
    elseif &filetype == 'cpp' || &filetype == 'cc' || &filetype == 'hpp'
        exec "!astyle --style=kr  %"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'|| &filetype == 'python'
        exec "!autopep8 --in-place --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java  %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""Gtags start"""""""""""""""""""""""""""""
set cscopetag 					" 使用 cscope 作为 tags 命令
set cscopeprg='gtags-cscope' 	" 使用 gtags-cscope 代替 cscope
 
"gtags.vim 设置项
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1

"按键映射
nmap <F10> :Gtags <C-R><C-W><cr>
nmap <F11> :Gtags -r <C-R><C-W><cr>
nmap <F12> :GtagsCursor<cr>

noremap <silent> <leader>cg :cs find g <C-R><C-W><cr>
noremap <silent> <leader>cs :cs find s <C-R><C-W><cr>
noremap <silent> <leader>cc :cs find c <C-R><C-W><cr>
noremap <silent> <leader>ct :cs find t <C-R><C-W><cr>
noremap <silent> <leader>ce :cs find e <C-R><C-W><cr>
noremap <silent> <leader>cf :cs find f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>ci :cs find i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>cd :cs find d <C-R><C-W><cr>
noremap <silent> <leader>ca :cs find a <C-R><C-W><cr>

autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
""""""""""""""""""""Gtags end"""""""""""""""""""""""""""""

"###################    set file head start  #########################
"autocmd创建新文件自动调用setfilehead()函数
autocmd BufNewFile *.v,*.sv,*.cpp,*.c,*.h exec ":call Setfilehead()"
func Setfilehead()
    call append(0, '/***********************************************')
    call append(1, '#')
    call append(2, '#      Filename: '.expand("%"))
    call append(3, '#')
    call append(4, '#        Author: Double HH')
    call append(5, '#   Description: ---')
    call append(6, '#        Create: '.strftime("%Y-%m-%d %H:%M:%S"))
    call append(7, '***********************************************/')
	call append(8, '')
endfunc

"map F6 to creat file head comment
"映射F6快捷键，生成后跳转至第9行，然后使用o进入vim的插入模式
map <F6> :call Setfilehead()<CR>:9<CR>i
"###################    set file head end   ##########################

"###################    set comment start  #########################
func SetComment()
    call append(line(".")  , '/**************** BY_DOUBLE_HH start *************/')
    call append(line(".")+1, '/**************** BY_DOUBLE_HH end   *************/')
endfunc

"映射F7快捷键，生成后跳转至下行，然后使用O进入vim的插入模式
map <F7> :call SetComment()<CR>j<CR>O
"###################    set comment end   ##########################
