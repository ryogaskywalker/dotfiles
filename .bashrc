export PATH="/Applications/UpTeX.app/teTeX/bin:$PATH"

#lsに色を付ける
alias ls='ls -G'
export LSCOLORS=gxfxcxdxbxegedabagacad

#function tex(){

#  platex -kanji=sjis $1.tex

#  jbibtex -kanji=sjis $1

#  platex -kanji=sjis $1.tex

#  platex -kanji=sjis $1.tex

#  dvipdfmx $1.dvi

#  open $1.pdf

#}
