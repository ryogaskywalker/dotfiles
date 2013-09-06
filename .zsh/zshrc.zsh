autoload -U compinit; compinit # 補完機能を有効にする
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
setopt complete_in_word
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z} r:|[-_.]=**'
zstyle ':completion:*' user-cache yes
zstyle ':completion:*' verbose yes
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

tmp_prompt="
%{${fg[green]}%}[%D{%Y/%m/%d %T}]%{${reset_color}%} %U%{${fg[magenta]}%}%n%B@%m%b${reset_color}%}%u
%{${fg[cyan]}%}%# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color} %}"
tmp_rprompt="%{${fg[green]}%}[%~]%{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [y, n, Abort, Edit]:%{${reset_color} %}"

PROMPT=$tmp_prompt    # 通常のプロンプト
PROMPT2=$tmp_prompt2  # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
RPROMPT="$tmp_rprompt$vcs_prompt"  # 右側のプロンプト(update by vcs.sh)
SPROMPT=$tmp_sprompt  # スペル訂正用プロンプト
# SSHログイン時のプロンプト
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"

setopt correct           # コマンドのスペルを訂正する
autoload -Uz colors
colors

#do_enter部分
function do_enter() {
    # ls_abbrev
    if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
        echo
        echo -e "\e[0;33m--- git status ---\e[0m"
        git status -sb
    fi
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    my-reset-prompt
    return 0
}

bindkey '^m' do_enter
zle -N do_enter
function my-reset-prompt() {
    echo
    ls
    echo
    echo
    zle reset-prompt
}
function cd() {
    builtin cd $@ && ls;
}

