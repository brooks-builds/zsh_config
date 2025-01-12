# Path

export PATH=$HOME/bin:/usr/local/bin:$PATH:/opt/homebrew/bin:$HOME/.rustup/toolchains/stable-aarch64-apple-darwin/bin/

##### OH MY ZSH config #####

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gallois"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker rust)

# Enable autocompletions through homebrew
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='hx'
fi


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias vim="nvim"
alias ycl="cd ~/code/brooks-builds/ycl"
alias lms="cd ~/code/brooks-builds/lms"
alias db="cd ~/code/brooks-builds/brooks_builds/database/"
alias gp="git pull"
alias gs="git status"
alias ts="trunk serve"
alias lt="erd -I -l -H -s name --no-git -. -y inverted"
alias find="erd -I -l -H -p"
alias finddir="erd -I -l -H -t dir -p"
alias zzshrc="zellij ac new-tab -l zshrc"
alias gd="git config branch.main.description"
alias gsd="git branch --edit-description"
alias zca="zellij ac new-tab -l course_articles"
alias ls="eza"
alias ll="eza -l"
alias la="eza -la"

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Rust

source $HOME/.cargo/env

##### Update configs #####

# (
#   if [[ -v ZSH_REPO && -n "$ZSH_REPO" ]]; then
#     cd $ZSH_REPO
#     if ! ./install.sh; then
#       echo "failed to update zsh config"
#     fi
#   fi
# )

# (
#   if [[ -v ALACRITTY_REPO && -n "$ALACRITTY_REPO" ]]; then
#     cd $ALACRITTY_REPO
#     if ! ./install.sh; then
#       echo "failed to update alacritty config"
#     fi
#   fi
# )

# (
#   if [[ -v ZELLIJ_REPO && -n "$ZELLIJ_REPO" ]]; then
#     cd $ZELLIJ_REPO
#     if ! ./install.sh; then
#       echo "failed to update zsh config"
#     fi
#   fi
# )

function random_port() {
  echo $((1024 + RANDOM % (65535 - 1024 + 1)))
}


