if [ -f /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh ]; then
  source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
fi

# Created with help from http://ezprompt.net/
export PS1="\w\[\e[35m\]\`__git_ps1\`\[\e[m\] \$ "

### For Go
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin

### Git-related aliases
alias gs='git status'
alias gb='git branch'
alias gc='git commit -a'
alias gk='git checkout'
alias gp='git push -u origin HEAD'
alias gcleanup="git branch --merged | grep -v '\*' | xargs -n 1 git branch -d"
alias grenew='gk master && git pull origin && gcleanup'
alias grim='git rebase -i master'

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

# Add env variables to connect to docker
#eval $(docker-machine env default)

### Docker cleanup aliases. From https://www.calazan.com/docker-cleanup-commands/
# Delete all stopped containers.
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm
$(docker ps -a -q)'

# Delete all untagged images.
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi
$(docker images -q -f dangling=true)'

# Delete all stopped containers and untagged images.
alias dockerclean='dockercleanc || true && dockercleani'

# Ruby stuff
source /usr/local/share/chruby/chruby.sh
chruby ruby-2.6.4  # default Ruby version
alias bex='bundle exec '

# Helper to free a port that's in use
function free_port() {
  lsof -ti :$1 | xargs kill -9
}
export -f free_port

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/anaulin/bin/google-cloud-sdk/path.bash.inc' ]; then . '/Users/anaulin/bin/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/anaulin/bin/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/anaulin/bin/google-cloud-sdk/completion.bash.inc'; fi
