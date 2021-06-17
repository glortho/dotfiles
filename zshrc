# ZSH Config
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

 alias zshrc="code ~/.zshrc"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(go git brew fabric osx npm docker jsontools sudo kubectl zsh-syntax-highlighting)

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
