source ~/.zsh/zgen-setup
source ~/.zsh/zsh-opts

# Theme
ZSH_THEME="pure"

# Aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias fuck='$(thefuck $(fc -ln -1))'

# Editor
export EDITOR="/usr/local/bin/mate -w"

# Maven
export MAVEN_OPTS="-Xmx1024m -Dfile.encoding=UTF-8 -Djava.awt.headless=true"

# Ant
export ANT_OPTS="-Xmx1024m"

# Android
export ANDROID_HOME="/Users/dries/Tools/android-sdk-macosx"

# Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.8/Contents/Home
export JAVA_OPTS="-Dfile.encoding=UTF-8"

# Activator
export ACTIVATOR_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=9999"

# Ruby gems
export GEM_HOME=$HOME/.gem

# Pad
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$GEM_HOME/bin:$PATH

# PostgreSQL
alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
