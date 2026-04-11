HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

export PATH="/opt/local/bin:/opt/local/sbin:$PATH:$HOME/.cargo/bin:$HOME/Library/Python/3.14/bin"

setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY

fpath+=~/.zfunc
autoload -U compinit; compinit

alias gp="git pull"
alias gs="git status"
alias cd_obsidian="cd /Users/brooks/Library/Mobile\ Documents/iCloud~md~obsidian/Documents"
alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
alias ls='ls -G'
alias lsa='ls -lah'

eval "$(starship init zsh)"
