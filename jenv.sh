#!/bin/sh
/usr/libexec/java_home -V 1>/dev/null 2>/tmp/jvms.$$

tail -n +2 /tmp/jvms.$$ | cut -f 3 | while read JVM_PATH ; do
  echo ${JVM_PATH}
  jenv add ${JVM_PATH}
done

rm /tmp/jvms.$$
