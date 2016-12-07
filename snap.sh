#!/bin/sh -e

export JAVA_HOME=$SNAP/usr/lib/jvm/default-java
export PATH=$SNAP/usr/lib/jvm/default-java/bin:$SNAP/usr/lib/jvm/default-java/jre/bin:$PATH
export ZEPPELIN_LOG_DIR=$SNAP_DATA/logs
export ZEPPELIN_PID_DIR=$SNAP_DATA/pid
export ZEPPELIN_CONF_DIR=$SNAP_COMMON/conf
export ZEPPELIN_WAR_TEMPDIR=$SNAP_DATA/tmp
export ZEPPELIN_NOTEBOOK_DIR=$SNAP_COMMON/notebooks


mkdir -p "$ZEPPELIN_CONF_DIR"

for x in $SNAP/conf/*; do
  if [ ! -e "$ZEPPELIN_CONF_DIR/$(basename $x)" ]; then
    echo "Copying $x"
    cp $x $ZEPPELIN_CONF_DIR
  fi
done

$SNAP/bin/zeppelin-daemon.sh start
