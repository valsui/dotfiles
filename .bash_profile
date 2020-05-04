eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
export PATH="~/bin:$PATH"
export PATH="/usr/local/Cellar/postgresql@10/10.9/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

#set default editor
export VISUAL=nvim
export EDITOR="$VISUAL"

#git branch autocomplete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# show git branch
COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $COLOR_RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_YELLOW
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_GREEN
  else
    echo -e $COLOR_OCHRE
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit)"
  fi
}

PS1="\[$COLOR_WHITE\]\n[\W]"          # basename of pwd
PS1+="\[\$(git_color)\]"        # colors git status
PS1+="\$(git_branch)"           # prints current branch
PS1+="\[$COLOR_BLUE\]\$\[$COLOR_RESET\] "   # '#' for root, else '$'
export PS1

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

#shortcuts
alias gs='git status'
alias ga='git add .'
alias gca='git commit -am'
alias gdb='git branch --merged | egrep -v "(^\*|master|staging)" | xargs git branch -d'
alias be='bundle exec'
alias ber='bundle exec rspec'
alias beri="bundle exec rspec --exclude-pattern 'spec/features/**/*_spec.rb'"
alias upg='cd $(git rev-parse --show-toplevel)'
alias hosts='vi /etc/hosts'
alias gco='git checkout'
alias dgssh='./dgssh'
alias vim='nvim'
alias vimrc='nvim ~/.vimrc'
alias bp='nvim ~/.bash_profile'
alias sbp='source ~/.bash_profile'
alias ptest="rails parallel:spec['spec\/(?!features)']"
