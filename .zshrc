export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export GOROOT=~/Documents/go
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:/usr/local/src/android-sdk-linux/tools:/usr/local/src/android-sdk-linux/platform-tools

export BSTINPUTS=$BSTINPUTS:/usr/share/texmf/jbibtex/bst

function tex(){
         rm *.aux *.log *.dvi *.bbl *.blg
         platex -kanji=sjis $1.tex
         jbibtex -kanji=sjis $1
         platex -kanji=sjis $1.tex
         platex -kanji=sjis $1.tex
         dvipdfmx $1.dvi
         #open $1.pdf
         evince $1.pdf
}

function reload(){
  source ~/.zshrc
}

function cachefree(){
  sudo sysctl -w vm.drop_caches=3
}

function eow(){
  w3m "eow.alc.co.jp/$1"
}

function wikipedia(){
  w3m "ja.wikipedia.org/wiki/$1"
}

function google(){
  w3m "google.co.jp/search?q=`echo $@ | tr ' ' +`"
}

# bind k and j for VI mode
#bindkey -M vicmd 'k' history-substring-search-up
#bindkey -M vicmd 'j' history-substring-search-down
#export PATH="/Applications/UpTeX.app/teTeX/bin:$PATH"
# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

source ~/dotfiles/.zsh/aliauses.zsh
source ~/dotfiles/.zsh/zshrc.zsh
source ~/dotfiles/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/dotfiles/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
