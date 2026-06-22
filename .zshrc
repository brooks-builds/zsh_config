HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

export PATH=" /Users/brooks/.cargo/bin:/opt/local/bin:/opt/local/sbin:$HOME/.cargo/bin:$HOME/Library/Python/3.14/bin:$PATH"
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

function setup_hermes() {
	PROFILE_DIRECTORY="$1"

	if [ -d "$PROFILE_DIRECTORY" ]
		then
			echo "$PROFILE_DIRECTORY exists. Overwrite? (y/N)"
			read OVERWRITE
			if [ "$OVERWRITE" = "y" ]
				then
					rm -rf "$PROFILE_DIRECTORY"
			else
				echo "cancelling"
				return 0
			fi
	fi

	mkdir -p "$PROFILE_DIRECTORY"
 	docker pull nousresearch/hermes-agent:latest && \
	docker run -it --rm \
	  -v "$PROFILE_DIRECTORY":/opt/data \
	  nousresearch/hermes-agent setup

	run_hermes "$PROFILE_DIRECTORY"
}

function run_hermes() {
	docker run -d \
  --name hermes \
  --restart unless-stopped \
  -v /Users/brooks/.hermes:/opt/data \
  -v "/Users/brooks/Library/Mobile Documents/iCloud~md~obsidian/Documents/Writing":/mnt/Obsidian/Writing:ro \
  -v "/Users/brooks/Library/Mobile Documents/iCloud~md~obsidian/Documents/Hermes":/mnt/Obsidian/Hermes \
  -p 8642:8642 \
  -p 9119:9119 \
  --env-file /Users/brooks/.hermes_env \
  nousresearch/hermes-agent gateway run
}

function upgrade_hermes() {
	docker stop hermes && docker rm hermes
	docker pull nousresearch/hermes-agent
}

