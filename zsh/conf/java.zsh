if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# Android
export ANDROID_HOME=/usr/local/opt/android-sdk

# Activator
export ACTIVATOR_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=9999"

# SBT Node.js
export SBT_OPTS="-Dsbt.jse.engineType=Node -Dsbt.jse.command=$(which node) ${SBT_OPTS}"
