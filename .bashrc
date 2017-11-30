# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
export PATH=$PATH:/usr/local/emacs/bin:/home/hy/soft/bazel/bin:/home/hy/ndk/soft/matlab2016a/bin
#Make sure you have "/home/hy/soft/bazel/bin" in your path. You can also activate bash
#completion by adding the following line to your :
#source /home/hy/soft/bazel/lib/bazel/bin/bazel-complete.bash

#java
export JAVA_HOME=/opt/java/jdk1.8.0_72
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH

#maven
export MAVEN_HOME=/opt/maven3
export MAVEN_PATH=$MAVEN_HOME/bin
export PATH=$MAVEN_PATH:$PATH

alias git='LANG=en_GB git'
alias emacs="export LC_CTYPE=zh_CN.UTF-8;emacs -nw"

export PATH=$PATH:/home/hy/sh/sf:/home/hy/sh/fq:/usr/sbin/:/sbin:/home/hy/sh/rdesktop


#go
export GOROOT=$HOME/soft/go
export GOPATH=/home/hy/soft/sharego:/home/hy/workspace/go/wrk1:/home/hy/workspace/go/wrk2:/home/hy/workspace/go/wrk3
export PATH=$PATH:$GOROOT/bin

#sbt
export PATH=$PATH:/opt/sbt/bin
alias grep='grep --color=auto'
alias ll='ls -lah'

function git_branch {
  branch="`git branch 2>/dev/null | grep "^\*" | sed -e "s/^\*\ //"`"
  if [ "${branch}" != "" ];then
      if [ "${branch}" = "(no branch)" ];then
          branch="(`git rev-parse --short HEAD`...)"
      fi
      echo "($branch)"
  fi
}

export PS1='\[\033[1;33m\]\u\[\033[01;32m\]@\[\033[1;36m\]\h\[\033[00m\][\[\033[01;36m\]\W\[\033[01;32m\]$(git_branch)\[\033[00m\]]\$ '
# export PS1='\[\033[01;32m\]\u@\h\[\033[00m\][\[\033[01;36m\]\W\[\033[01;32m\]$(git_branch)\[\033[00m\]]\$ '

#alias define
alias gc='git add -A;git commit -m '
alias scala="scala -Dscala.color=true"


EDITOR=vim; export EDITOR
#export LANG="zh_CN.UTF-8" 
#export http_proxy="http://192.168.99.238:1080"
#export https_proxy="http://192.168.99.238:1080"

#xmodmap ~/.xmodmap-`uname -n`

#hadoop
export HADOOP_HOME=/home/hy/soft/hadoop-2.6.5
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin


# added by Anaconda2 4.2.0 installer
#export PATH="/home/hy/soft/anaconda2/bin:$PATH"
export PATH=$PATH:/home/hy/soft/node/bin


function cd () {
  if [[ $# > 0 ]]; then
    if [ ${1:0:2} == '..' ]; then
      rest=${1:2}
      rest=${rest//./../}
      builtin cd "${1:0:2}/${rest}"
    else
      builtin cd "$1"
    fi
  else
    builtin cd
  fi
}



export dp=/home/hy/workspace/company/bbkj/deploy
