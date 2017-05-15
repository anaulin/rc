# Add bash-completion (installed via 'brew install bash-completion')
# Enables __git_ps1 function
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Created with help from http://ezprompt.net/
export PS1="\w\[\e[35m\]\`__git_ps1\`\[\e[m\] \$ "

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
### For access to Android tools
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
### For Go
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin

### Git-related aliases
alias gs='git status'
alias gb='git branch'
alias gc='git commit -a'
alias gk='git checkout'
alias gcleanup="git branch --merged | grep -v '\*' | xargs -n 1 git branch -d"
alias grenew='gk master && git pull origin && gcleanup'

# Tweaks to bash history
export HISTCONTROL=ignoredups:erasedups
export HISTIGNORE='ls:history'
export HISTTIMEFORMAT='%F %T '
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend
export PROMPT_COMMAND="history -a; history -r;"

# Colorize ls
alias ls='ls -G'

# The next line updates PATH for the Google Cloud SDK.
source '/Users/anaulin/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/Users/anaulin/google-cloud-sdk/completion.bash.inc'

# Add env variables to connect to docker
eval $(docker-machine env default)

alias sm='open /Applications/Emacs.app'

# Simple Git auto-sync functionality.
gas() {
  echo "** Adding all and committing"
  git add .
  git commit -m "`date`"
  echo "** Pushing, fetching and checking status"
  git push -u
  git fetch
  git status
}
