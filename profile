# /etc/profile: system-wide .profile file for the Bourne shell (sh(1))
# and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).

if [ "`id -u`" -eq 0 ]; then
  PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
else
  PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
fi
export PATH

if [ "$PS1" ]; then
  if [ "$BASH" ] && [ "$BASH" != "/bin/sh" ]; then
    # The file bash.bashrc already sets the default PS1.
    # PS1='\h:\w\$ '
    if [ -f /etc/bash.bashrc ]; then
      . /etc/bash.bashrc
    fi
  else
    if [ "`id -u`" -eq 0 ]; then
      PS1='# '
    else
      PS1='$ '
    fi
  fi
fi

if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi

export JAVA_HOME=/opt/java/jdk1.8.0_72
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH


export MAVEN_HOME=/opt/maven3
export MAVEN_PATH=$MAVEN_HOME/bin
export PATH=$MAVEN_PATH:$PATH

alias git='LANG=en_GB git'

export PATH=$PATH:/home/hy/sh/sf:/home/hy/sh/kz

export GOROOT=$HOME/soft/go
export PATH=$PATH:$GOROOT/bin

alias ll='ls -la'

export SCALA_HOME=/opt/scala/scala-2.11.8
export PATH=$SCALA_HOME/bin:$PATH

export GRADLE_HOME=/opt/gradle 
export PATH=$GRADLE_HOME/bin:$PATH

export ANT_HOME=/opt/ant  
export PATH=$ANT_HOME/bin:$PATH

export PATH=$PATH:/sbin

#export ENV_SERVER_IP=127.0.0.1
#export ENV_SERVER_PORT=10000
#export ENV_SERVER_REAL_PORT=10000
xmodmap /home/hy/.xmodmap-`uname -n`  

