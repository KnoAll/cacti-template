#!/bin/sh
#
# /etc/init.d/smokeping
#
### BEGIN INIT INFO
# Provides:          smokeping
# Required-Start:    $syslog $network $remote_fs
# Should-Start:      sshd apache
# Required-Stop:     $syslog $network $remote_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start or stop the smokeping latency logging system daemon
# Description:       SmokePing is a latency logging and graphing system
#                    that consists of a daemon process which organizes
#                    the latency measurements and a CGI which presents
#                    the graphs. This script is used to start or stop
#                    the daemon.
### END INIT INFO
#

set -e

# Source LSB init functions
. /lib/lsb/init-functions

DAEMON=/opt/smokeping/bin/smokeping
NAME=smokeping
DESC="latency logger daemon"
CONFIG=/opt/smokeping/etc/config
PIDFILE=/opt/smokeping/var/$NAME.pid
DAEMON_USER=cacti
DEFAULTS=/opt/smokeping/etc/smoke-defaults
MODE=slave
DAEMON_ARGS="--config=$CONFIG"

# LC_ALL prevents resetting LC_NUMERIC which in turn interferes
# with Smokeping internal regexps matching floating point numbers
unset LC_ALL

# Check whether the binary is still present:
test -f "$DAEMON" || exit 0

# source defaults for master vs. slave mode
if [ -f "$DEFAULTS" ]
then
    . "$DEFAULTS"
fi

check_slave() {
    if [ "$MODE" != "slave" ]
    then
        return
    fi
    if [ -z "$SHARED_SECRET" ]
    then
        log_progress_msg "(missing \$SHARED_SECRET setting)"
        log_end_msg 6 # program is not configured
        exit 6
    fi
    if [ ! -r "$SHARED_SECRET" ]
    then
        log_progress_msg "(invalid \$SHARED_SECRET setting)"
        log_end_msg 2 # invalid or excess argument(s)
        exit 2
    fi
    if [ -z "$MASTER_URL" ]
    then
        log_progress_msg "(missing \$MASTER_URL setting)"
        log_end_msg 6 # program is not configured
        exit 6
    fi
    DAEMON_ARGS="$DAEMON_ARGS --master-url $MASTER_URL --shared-secret $SHARED_SECRET"
    if [ -n "$SLAVE_NAME" ]
    then
        DAEMON_ARGS="$DAEMON_ARGS --slave-name $SLAVE_NAME"
    fi
    DAEMON_ARGS="$DAEMON_ARGS --cache-dir /opt/smokeping/htdocs/cache"
    DAEMON_ARGS="$DAEMON_ARGS --pid-dir /opt/smokeping/var"
}

check_config () {
    # Check whether the configuration file is available
    if [ ! -r "$CONFIG" ] && [ "$MODE" = "master" ]
    then
        log_progress_msg "($CONFIG does not exist)"
        log_end_msg 6 # program is not configured
        exit 6
    fi
}

case "$1" in
    start)
        log_daemon_msg "Starting $DESC" $NAME
        check_config
        check_slave
        set +e
        pidofproc "$DAEMON" > /dev/null
        STATUS=$?
        set -e
        if [ "$STATUS" = 0 ]
        then
            log_progress_msg "already running"
            log_end_msg $STATUS
            exit $STATUS
        fi

        if [ ! -d /tmp/smokeping ]; then
            mkdir /tmp/smokeping
            chown ${DAEMON_USER}.root /tmp/smokeping
            chmod 0755 /var/run/smokeping
        fi

        set +e
        start-stop-daemon --start --quiet --exec $DAEMON --oknodo \
            --chuid $DAEMON_USER --pidfile $PIDFILE \
            -- $DAEMON_ARGS \
            | logger -p daemon.notice -t $NAME
        STATUS=$?
        set -e

        log_end_msg $STATUS
        exit $STATUS
        ;;


    stop)
        log_daemon_msg "Shutting down $DESC" $NAME

        set +e
        start-stop-daemon --oknodo --stop --retry 3 --quiet --pidfile /opt/smokeping/var/$NAME.pid --signal 15
        STATUS=$?
        set -e

        log_end_msg $STATUS
        exit $STATUS
        ;;


    restart)
        # Restart service (if running) or start service
        $0 stop
        $0 start
        ;;


    reload|force-reload)
        log_action_begin_msg "Reloading $DESC configuration"

        check_config
        set +e
        $DAEMON --reload $DAEMON_ARGS | logger -p daemon.notice -t smokeping
        STATUS=$?
        set -e

        if [ "$STATUS" = 0 ]
        then
            log_action_end_msg 0 "If the CGI has problems reloading, see README.Debian."
        else
            log_action_end_msg $STATUS
        fi
        exit $STATUS
        ;;


    status)
        log_daemon_msg "Checking $DESC status" $NAME
        # Use pidofproc to check the status of the service,
        # pidofproc returns the exit status code of 0 when it the process is
        # running.

        # LSB defined exit status codes for status:
        # 0    program is running or service is OK
        # 1    program is dead and /var/run pid file exists
        # 2    program is dead and /var/lock lock file exists
        # 3    program is not running
        # 4    program or service status is unknown
        # 5-199    reserved (5-99 LSB, 100-149 distribution, 150-199 applications)

        set +e
        pidofproc "$DAEMON" > /dev/null
        STATUS=$?
        log_progress_msg "(status $STATUS)"
        log_end_msg 0
        set -e
        exit $STATUS
        ;;


    *)
        echo "Usage: $0 {start|stop|status|restart|force-reload|reload}"
        exit 1
        ;;
esac
