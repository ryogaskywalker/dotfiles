# bind k and j for VI mode
#bindkey -M vicmd 'k' history-substring-search-up
#bindkey -M vicmd 'j' history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

source ~/dotfiles/.zsh/aliauses.zsh
source ~/dotfiles/.zsh/zshrc.zsh
source ~/dotfiles/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/ditfiles/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
