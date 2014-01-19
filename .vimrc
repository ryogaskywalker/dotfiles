"--------------------
" 基本的な設定
"--------------------
"新しい行のインデントを現在行と同じにする
"set autoindent 
 
"vi互換をオフする
set nocompatible
 
"タブの代わりに空白文字を指定する
set expandtab
 
"インクリメンタルサーチを行う
set incsearch
 
"行番号を表示する
set number

"シフト移動幅
set shiftwidth=4

"閉括弧が入力された時、対応する括弧を強調する
set showmatch
 
"新しい行を作った時に高度な自動インデントを行う
"set smarttab
 
"grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

"モード表示
set showmode

"タイトルを表示
set title

"コマンドラインの高さの設定
set cmdheight=2

"文字コードの自動認識
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8

"色の設定
syntax on
"colorscheme 

"highlight LineNr ctermfg=darkyellow
"highlight NonText ctermfg=darkgrey
"highlight Folded ctermfg=blue
"highlight SpecialKey cterm=underline ctermfg=darkgrey

set background=dark
