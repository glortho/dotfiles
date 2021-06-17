# ZSH Config
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bullet-train"

BULLETTRAIN_KCTX_KCONFIG=/home/glortho/.kube/config
BULLETTRAIN_PROMPT_ORDER=(
  status
  dir
  git
  kctx
  nvm
  ruby
  custom
  time
)
BULLETTRAIN_STATUS_BG=black
BULLETTRAIN_TIME_BG=black
BULLETTRAIN_TIME_FG=white
BULLETTRAIN_GIT_COLORIZE_DIRTY=true
BULLETTRAIN_GIT_COLORIZE_DIRTY_BG_COLOR=yellow
BULLETTRAIN_GIT_DIRTY=""
BULLETTRAIN_KCTX_BG=039
BULLETTRAIN_CUSTOM_MSG="🐍\ $CONDA_DEFAULT_ENV"
BULLETTRAIN_CUSTOM_BG=137
BULLETTRAIN_CUSTOM_FG=white
BULLETTRAIN_RUBY_PREFIX=♦

#/Users/jed/.nvm/versions/node/v5.9.1/bin/node ~/Google\ Drive/messages.js | cowsay


# My Scripts
#source "$HOME/.scripts/aliases.sh"
#source "$HOME/.scripts/env.sh"

# PERLS
# source ~/perl5/perlbrew/etc/bashrc

# ZSH Configurations
#COMPLETION_WAITING_DOTS="true"


 alias zshrc="nvim ~/.zshrc"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(go git brew fabric osx npm docker jsontools sudo kubectl zsh-syntax-highlighting)

#on _update_ruby_version()
#{
    #typeset -g ruby_version=''
    #if which rvm-prompt &> /dev/null; then
      #ruby_version="$(rvm-prompt i v g)"
      #rvm-prompt i v g
    #else
      #if which rbenv &> /dev/null; then
        #ruby_version="$(rbenv version | sed -e "s/ (set.*$//")"
      #fi
    #fi
#}

#chpwd_functions+=(_update_ruby_version)

source $ZSH/oh-my-zsh.sh

alias alg='alias | grep'
alias gbg='git branch | grep'
alias psg='ps -ax | grep'

alias k='kubectl'

alias ls='ls -alh --color'
colorflag="--color"

# List all files colorized in long format, including dot files
alias la="ls -laF ${colorflag}"

# List only directories
alias lsd='ls -lF ${colorflag} | grep "^d"'

# List according to date modified
alias lst='ls -alGt'

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Shortcuts
alias d="cd ~/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias g="git"
alias h="history"
alias j="jobs"
alias vim="nvim"
alias o="open"
alias oo="open ."

# git aliases
alias gpl='git pull'

alias gs='git status'
alias gps='git push'
alias gpsu='git push --set-upstream origin'
alias gco='git commit'
alias gch='git checkout'
alias gm='git merge'
alias pr='hub pull-request'

# Undo last commit
alias undocommit="git reset HEAD~"

# Undo a `git push`
alias undopush="git push -f origin HEAD^:master"

alias preview="fzf --preview 'bat {}'"
alias du="ncdu -r --exclude .git"

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export PATH="$HOME/anaconda3/bin:$PATH"
~

# use ag for fzf
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(vim {})+abort'"

# init rupa/z
. ~/z.sh

# use vim
set -o vi
export HISTCONTROL=ignoredupes
setopt HIST_IGNORE_ALL_DUPS

# ctrl-z as toggle with vim
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

eval "$(rbenv init -)"
