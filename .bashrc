PS1='\[\e[1;31m\]nirvank0\[\e[m\]\[\e[1;34m\]:\W\[\e[m\] # '

[[ $- != *i* ]] && return

c_cyan=`tput setaf 6`
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_sgr0=`tput sgr0`

alias ls='ls --color=auto'
PS1='\[\033[01;31m\]`__git_ps1 "%s "`\[\033[00m\]\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$ \[\033[00m\]'
#PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
PS2='> '
PS4='+ 'R=/usr/bin/vim

alias gst='git status'
alias ga='git add'
alias gci='git commit -m'
alias gp='git pull && git push'
alias gull='git pull'
alias gush='git push'
alias gb='git branch'
alias gco='git checkout'
alias gd='git diff'

export HISTCONTROL=ignoredups
. /etc/bash_completion

 
parse_git_branch ()
{
  if git rev-parse --git-dir >/dev/null 2>&1
  then
          gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  else
          return 0
  fi
  echo -e "($gitver)"
}

branch_color ()
{
        if git rev-parse --git-dir >/dev/null 2>&1
        then
                color=""
                if git diff --quiet 2>/dev/null >&2 
                then
                    if git diff --staged --quiet 2>/dev/null >&2 
                        then
                            color="${c_green}"
                        else
                            color="${c_cyan}"
                    fi
                else
                        color=${c_red}
                fi
        else
                return 0
        fi
        echo -ne $color
}

PS1='\[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\][\u@\h \W]$ '

