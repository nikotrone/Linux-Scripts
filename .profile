alias ll='ls -lGh $@'

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local      YELLOW="\[\033[0;33m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  local     DEFAULT="\[\e[0m\]"

PS1="${TITLEBAR}\
$GREEN[$DEFAULT\u@\h:$GREEN\w\
 $RED\$(parse_git_branch)$GREEN\
]$DEFAULT "
PS2='> '
PS4='+ '
}
proml

if [ -x /usr/bin/fortune ]; then
        echo ""
        fortune
        echo ""
fi

source ~/.git-aliases
source ~/.env.vandebron
