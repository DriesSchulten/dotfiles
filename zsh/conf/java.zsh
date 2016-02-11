if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# Set Java7/Java8 home (retrolambda)
export JAVA7_HOME=${HOME}/.jenv/versions/1.7
export JAVA8_HOME=${HOME}/.jenv/versions/1.8

# Maven
export MAVEN_OPTS="-Xmx1024m -Dfile.encoding=UTF-8 -Djava.awt.headless=true"

# Ant
export ANT_OPTS="-Xmx1024m"

# Android
export ANDROID_HOME=/usr/local/opt/android-sdk

# Activator
export ACTIVATOR_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=9999"
