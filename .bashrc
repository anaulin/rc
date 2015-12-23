# Add bash-completion (installed via 'brew install bash-completion')
# Enables __git_ps1 function
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Created with help from http://ezprompt.net/
export PS1="\[\e[32;40m\]\t\[\e[m\] \w\[\e[35m\]\`__git_ps1\`\[\e[m\] \$ "

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
