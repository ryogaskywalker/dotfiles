export PATH="/Applications/UpTeX.app/teTeX/bin:$PATH"

function tex(){
	rm *.aux *.log *.dvi *.bbl *.blg
	platex -kanji=sjis $1.tex
	jbibtex -kanji=sjis $1
	platex -kanji=sjis $1.tex
	platex -kanji=sjis $1.tex
	dvipdfmx $1.dvi
	open $1.pdf
}
#lsに色を付ける
alias ls='ls -aG'
alias cp='cp -i'
export LSCOLORS=gxfxcxdxbxegedabagacad

#eval $(gdircolors /path/to/dircolors-solarized/dircolors.ansi-universal)
