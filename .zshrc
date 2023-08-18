# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/mufeedvh/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="darkblood"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=20

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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

alias get='sudo apt-get install'
alias sl='ls'
alias killport='sudo fuser -k'

# bat > cat
alias batcat='batcat --theme=ansi-dark'

# alias cat=bat
command -v batcat > /dev/null && alias bat='batcat --pager=never'

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

cat /dev/null > ~/.bash_history;
alias exit="cat /dev/null > ~/.bash_history && history -c && exit"

pid() {
  ps -Flww -p $1
}

battery() {
  sudo tlp start;
  sudo acpi -V;
}

alias myip="wget -qO - https://api.ipify.org; echo";

alias split="wezterm cli split-pane";

function clean() {
   flatpak remove --unused;
   cargo cache -a
   kondo;
   go clean -modcache;
   # czkawka_gui;
}

function rustfuzz() {
   rustup override set nightly;
   cargo fuzz init;
   cargo fuzz list;
   echo "\ncargo fuzz run [TARGET]\n";
}

alias pyserver="python3 -m http.server";

alias xcalc="speedcrunch";
alias calc="speedcrunch";

# alias bluetooth="service bluetooth start";

# function bluetooth() {
#	 sudo service bluetooth stop;
#	 sudo rmmod btusb;
#	 sudo modprobe btusb;
#	 sudo service bluetooth start;
# }

# check for duplicate lines
function duplicate() {
	awk '{ a[$0]++ } END{ for(x in a) if(a[x]>1) print a[x], x }' $1;
}

alias ls="exa";

alias rustperf="RUSTFLAGS=\"-C target-cpu=native -C target-feature=+avx,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+fma,+popcnt,+lzcnt,+aes --emit=asm\"";

#function perfshort() {
#	echo -1 | sudo tee /proc/sys/kernel/perf_event_paranoid;
#	sudo perf record --call-graph dwarf $1;
#	echo 4 | sudo tee /proc/sys/kernel/perf_event_paranoid;
#}

# alias headphone="bluetooth_battery E4:41:22:73:8F:29"

alias rustbuild="cross build --release --target x86_64-unknown-linux-gnu"

alias cheat="cht.sh"

alias hx="/home/mufeedvh/apps/helix-v0.3.0-x86_64-linux/hx"

alias exif="exiftool -all="

# alias extract="find -name '*.*' -exec cat {} \; >"

# alias extracts="find -name '*.*' -exec strings {} \; >"

# alias extractx="find -name '*.*' -exec xxd {} \; >"

function extract() {
	$(find . -type f -exec strings {} + | rg $1) 2> /dev/null
}

alias tomatimer="./dev/tomatimer/target/release/tomatimer"

alias nvim="/home/mufeedvh/Apps/nvim.appimage"

alias ssh_auth="ssh-add ~/.ssh/id_ed25519"

alias hey="/home/mufeedvh/Apps/hey_linux_amd64"

alias sshchmod="chmod u=rw,go= "

function stringz() {
	strings $1 | awk 'length($0)>10' | sort -u
}

function warp() {
	warp-cli connect;
	curl https://www.cloudflare.com/cdn-cgi/trace;
}

function javav() {
	sudo update-alternatives --config java;
	# sudo update-alternatives --config javac;
}

alias volatility="docker run --rm --user=$(id -u):$(id -g) -v '$(pwd)':/dumps:ro,Z -ti phocean/volatility $@";

function apk() {
	apkeep -a $1 .;
}

function lines() {
	find . -name '*.rs' | xargs wc -l;
}

function cloneall() {
	curl -s https://api.github.com/orgs/$1/repos\?per_page\=100\&type\=source | jq '.[].html_url' | xargs -n 1 git clone;
}

function blob() {
	git whatchanged --all --find-object=$1;
}

function memdump() {
	grep rw-p /proc/$1/maps \
	| sed -n 's/^\([0-9a-f]*\)-\([0-9a-f]*\) .*$/\1 \2/p' \
	| while read start stop; do \
	    gdb --batch --pid $1 -ex \
	        "dump memory $1-$start-$stop.dump 0x$start 0x$stop"; \
	done
}

function release() {
	git add .;
	git commit -m "$1 Release";
	git tag $1;
	git push origin main;
	git push --tags origin;
}

function gta(){
	cd /media/mufeedvh/BIG\ BRAIN/Games/GTA\ San\ Andreas;
	wine samp.exe;
}

function nfs(){
	cd /media/mufeedvh/BIG\ BRAIN/Games/Need\ for\ Speed\ Most\ Wanted;
	wine Speed.exe;
}

function shutup(){
	gsettings set org.gnome.mutter check-alive-timeout 60000
}

function server(){
	ssh root@192.241.132.211
}

# alias code="code-insiders"

eval "$(starship init zsh)";

export ANDROID_SDK_ROOT=/home/mufeedvh/Android/sdk;
export NDK_HOME=/home/mufeedvh/Android/Sdk/ndk/22.1.7171670;

export DENO_INSTALL="/home/mufeedvh/.deno";
export PATH="$DENO_INSTALL/bin:$PATH";

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# bun completions
[ -s "/home/mufeedvh/.bun/_bun" ] && source "/home/mufeedvh/.bun/_bun"

# Bun
export BUN_INSTALL="/home/mufeedvh/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH=/home/mufeedvh/.nimble/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
