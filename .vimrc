" config start by wangxufeng

set nocompatible
set shortmess=atI
set mouse=a
set number

syntax enable
syntax on
filetype plugin indent on
 
set autoindent
set smartindent
set cindent shiftwidth=4 

set backspace=2

set tabstop=4
set softtabstop=4
set expandtab

set nobackup
set noswapfile
set backupcopy=yes

" show chinese double char
set ambiwidth=double
" 正确地处理中文字符的折行和拼接
set formatoptions+=mM
" high current line
set cursorline
"hi CursorLine   cterm=NONE ctermbg=LightGray
set guifont=Consolas\ 12

" high the seach char
set hlsearch
set incsearch
set ignorecase
set smartcase
set history=1000
set lbr
" 代码中的所有数字都当成十进制处理
set nrformats=
 
"不要闪烁
set novisualbell
set noerrorbells

set showcmd
set showmatch
set autochdir
set hidden
" auto read modified file
set autoread

" auto complete, like bash
set wildmode=longest,list

noremap <C-j> gT
noremap <C-k> gt

" set vim statusbar show
set laststatus=2
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)

cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

" remap * and # in visual mode
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch()
	let temp = @s
	norm! gv"sy
	let @/ = '\v' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
	let @s = temp
endfunction
 
"Taglist{
let g:Tlist_Show_One_File=1     " just show the tag of this code, not all.
let g:Tlist_Exit_OnlyWindow=1   " if taglist window is the last, exit vim.
let g:Tlist_File_Fold_Auto_Close=1
nmap <F4>  :Tlist<CR>
set tags=tags;
"}

"cscope{
"set cscopequickfix=s-,g-,c-,d-,i-,t-,e-
set nocscopeverbose
if filereadable("./cscope.out")
    :cs add ./cscope.out
endif
"}

"bufexplorer{
let g:bufExplorerDefaultHelp = 0
let g:bufExplorerDetailedHelp = 0
let g:bufExplorerShowRelativePath = 1
nmap <F8> :BufExplorer <CR>
"}

"project{
nmap <silent> <C-F7>  :Project<CR>
"}

"NERDTree{
let NERDTreeIgnore=['.svn', '.git', '.repo']
let g:NERDChristmasTree = 1
let g:NERDTreeShowHidden = 0
let g:NERDTreeWinPos = 'right'
let g:NERDTreeHighlightCursorline = 1
nnoremap <silent> <F9> :NERDTreeToggle<CR>
nnoremap <silent> <C-t><C-f> :NERDTreeFind<CR>
"}

"srcExpl{
nmap <F7> :SrcExplToggle<CR>
" // Set the height of Source Explorer window
let g:SrcExpl_winHeight = 8
" // Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 100
" // Set Enter key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<ENTER>"
" // Set Space key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"
" // In order to avoid conflicts, the Source Explorer should know what plugins
" // except itself are using buffers. And you need add their buffer names into
" // below listaccording to the command :buffers!
let g:SrcExpl_pluginList = [
        \ "__Tag_List__",
        \ "_NERD_tree_"
        \ ]
" // Enable/Disable the local definition searching, and note that this is not
" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
" // It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 1
" // Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0
" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" //  create/update a tags file
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
" // Set <F12> key for updating the tags file artificially
"let g:SrcExpl_updateTagsKey = "<F12>"
" // Set <F3> key for displaying the previous definition in the jump list
"let g:SrcExpl_prevDefKey = "<F3>"
" // Set <F4> key for displaying the next definition in the jump list
"let g:SrcExpl_nextDefKey = "<F4>"
"}

"lookupfile{
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件 
let g:LookupFile_TagsExpandCamelCase = 0

let g:LookupFile_TagExpr = '"./filenametags"'
"}

"OmniCppComplete{
set nocp
let g:OmniCpp_NamespaceSearch = 1
let g:OmniCpp_GlobalScopeSearch = 1
let g:OmniCpp_ShowAccess = 1
let g:OmniCpp_ShowPrototypeInAbbr = 1  " show function parameters
let g:OmniCpp_MayCompleteDot = 1       " autocomplete after.
let g:OmniCpp_MayCompleteArrow = 1     " autocomplete after ->
let g:OmniCpp_MayCompleteScope = 1     " autocomplete after ::
let g:OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
"}

"ctrlp{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_follow_symlinks=1
let g:ctrlp_cache_dir = $HOME.'/.ctrlp/cache/'

set wildignore+=*/tmp/*,*.so,*.zip,*.o,*.a,*.png,*/.repo/*
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|repo)$',
    \ 'file': '\v\.(exe|so|dll|png|xml)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }
let g:ctrlp_user_command = 
  \ 'find %s -type f | grep -v -P "\.jpg$|/tmp/|/kout/|/out/|/Download/|/Documentation/|/\.repo/|/\.git/|/\.svn/"'
let g:ctrlp_by_filename = 0
"}

"minibufexpl{
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1   
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
"}

"grep{
nnoremap <silent> <F3> :Grep<CR>

let g:Grep_Skip_Dirs = 'out .svn .git .repo'
let g:Grep_Skip_Files = '*.bak *~ cscope.* tags filenametags'
"}

