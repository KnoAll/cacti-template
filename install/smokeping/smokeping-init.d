#!/bin/sh
#
# smokeping    This starts and stops the smokeping daemon
# chkconfig: 345 98 11
# description: Start/Stop the smokeping daemon
# processname: smokeping
# Source function library.
. /etc/rc.d/init.d/functions

SMOKEPING=/opt/smokeping/bin/smokeping
LOCKF=/var/lock/subsys/smokeping
CONFIG=/opt/smokeping/etc/config

[ -f $SMOKEPING ] || exit 0
[ -f $CONFIG ] || exit 0

RETVAL=0

case "$1" in
  start)
        echo -n $"Starting SMOKEPING: "
        daemon -u $SMOKEPING
        RETVAL=$?
        echo
        [ $RETVAL -eq 0 ] && touch $LOCKF
        ;;
  stop)
        echo -n $"Stopping SMOKEPING: "
        killproc $SMOKEPING
        RETVAL=$?
        echo
        [ $RETVAL -eq 0 ] && rm -f $LOCKF
        ;;
  status)
        status smokeping
        RETVAL=$?
        ;;
  reload)
        echo -n $"Reloading SMOKEPING: "
        killproc $SMOKEPING -HUP
        RETVAL=$?
        echo
        ;;
  restart)
        $0 stop
        sleep 3
        $0 start
        RETVAL=$?
        ;;
  condrestart)
        if [ -f $LOCKF ]; then
                $0 stop
                sleep 3
                $0 start
                RETVAL=$?
        fi
        ;;
  *)
        echo $"Usage: $0 {start|stop|status|restart|reload|condrestart}"
        exit 1
esac

exit $RETVAL
