# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
SMTH_COLOR=${SMTH_COLOR:-green}

SMTH_USE_GIT=${SMTH_USE_GIT:-}

ZSH_THEME=${ZSH_THEME:-smth}

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(mix asdf nvm vagrant bundler)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# my aliases
alias now='date +"%Y-%m-%d--%H-%M-%S"'
alias ls='ls --group-directories-first --time-style=+"%Y-%m-%d--%H-%M-%S" --color=auto'
alias free-caches="sudo -- sh -c 'free && sync && echo 3 > /proc/sys/vm/drop_caches && free'"
alias rg='rg --smart-case --no-heading --sort path'

obnovit() {
  if hash yaourt 2>/dev/null; then
    echo 'obnovit via yaourt'
    yaourt -Syyu
  elif hash yum 2>/dev/null; then
    echo 'obnovit via yum'
    sudo yum update -y
  elif hash apt 2>/dev/null; then
    echo 'obnovit via apt'
    sudo -- sh -c '
      apt update
      apt-get dist-upgrade -y
      apt autoremove -y
      apt clean
    '
  else
    echo "Dunno how to obnovit"
  fi
}

setopt hist_ignore_all_dups

# if command not found
[[ -e /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found

# my local binaries
[[ -d "$HOME/.local/bin" ]] && export PATH="$PATH:$HOME/.local/bin"

# rvm stuff
#[[ -d "$HOME/.rvm/bin" ]] && export PATH="$PATH:$HOME/.rvm/bin"
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source $HOME/.rvm/scripts/rvm

# nodejs stuff
[[ -d "$HOME/.node_modules_global" ]] && export NODE_PATH="$HOME/.node_modules_global"
[[ -d "$HOME/.node_modules_global/bin" ]] && export PATH="$HOME/.node_modules_global/bin:$PATH"

# golang stuff
export GOPATH=$HOME/.golang
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

[[ -d "$HOME/.linuxbrew/bin" ]] && export PATH="$HOME/.linuxbrew/bin:$PATH"

# added by travis gem
[ -f "$HOME/.travis/travis.sh" ] && source "$HOME/.travis/travis.sh"

if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
  source ~/.rbenv/completions/rbenv.zsh
fi

[[ -d "$HOME/.asdf" ]] && source $HOME/.asdf/asdf.sh
[[ -d "$HOME/.asdf" ]] && source $HOME/.asdf/completions/asdf.bash

[[ -d "$HOME/.nvm" ]] && source $HOME/.nvm/nvm.sh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# snap
export PATH=$PATH:/snap/bin

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/azat/.sdkman"
[[ -s "/home/azat/.sdkman/bin/sdkman-init.sh" ]] && source "/home/azat/.sdkman/bin/sdkman-init.sh"

:
