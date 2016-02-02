if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# Maven
export MAVEN_OPTS="-Xmx1024m -Dfile.encoding=UTF-8 -Djava.awt.headless=true"

# Ant
export ANT_OPTS="-Xmx1024m"

# Android
export ANDROID_HOME="/Users/dries/Tools/android-sdk-macosx"

# Activator
export ACTIVATOR_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=9999"

