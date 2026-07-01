HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

export PATH="/Users/brooks/.cargo/bin:/opt/local/bin:/opt/local/sbin:$HOME/.cargo/bin:$HOME/Library/Python/3.14/bin:$PATH:/opt/homebrew/bin"
export EDITOR=hx

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

function take() {
	mkdir $1
	cd $1
}

function update_ports() {
	sudo port selfupdate && \
	sudo port upgrade outdated
}

eval "$(/opt/homebrew/bin/brew shellenv zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm use --lts

source <(sbx completion zsh)

# Autocomplete history with up/down arrow. Taken from https://unix.stackexchange.com/questions/621606/zsh-completion-with-up-and-down-arrows
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
