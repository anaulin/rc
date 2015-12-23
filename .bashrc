PS1="\u:\w $ "

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
### For access to Android tools
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"

### Git-related aliases
alias gs='git status'
alias gb='git branch'
alias gc='git commit -a'
alias gk='git checkout'
alias gcleanup="git branch --merged | grep -v '\*' | xargs -n 1 git branch -d"

# Tweaks to bash history
export HISTCONTROL=ignoredups:erasedups
export HISTIGNORE='ls:history'
export HISTTIMEFORMAT='%F %T '
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend
export PROMPT_COMMAND="history -a; history -r; update_terminal_cwd;"

# Colorize ls
alias ls='ls -G'
