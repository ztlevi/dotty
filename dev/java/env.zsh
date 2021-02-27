export GRADLE_USER_HOME="$XDG_CACHE_HOME/gradle"

# Android
export ANDROID_SDK_HOME="$XDG_DATA_HOME/android"
export ADB_VENDOR_KEYS="$ANDROID_SDK_HOME/.android"
path=($ANDROID_SDK_HOME/bin $path)

# Java
if [[ -f /usr/libexec/java_home ]]; then
  export JAVA_HOME=$(/usr/libexec/java_home -v 1.8) # 1.8 or 11
elif [[ -f /usr/bin/javac ]]; then
  export JAVA_HOME=$(dirname $(dirname $(readlink -e /usr/bin/javac)))
fi

if [[ $JAVA_HOME ]]; then
  export JRE_HOME=$JAVA_HOME/jre
  export CLASSPATH=$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
  path=($JAVA_HOME/bin $path)
fi
