#! /bin/sh
### BEGIN INIT INFO
# Provides:             keymap
# Required-Start:       
# Required-Stop:
# Default-Start:        S
# Default-Stop:
# Short-Description:    Set keymap
# Description:          Set the Console keymap
### END INIT INFO
#
# skeleton	example file to build /etc/init.d/ scripts.
#		This file should be used to construct scripts for /etc/init.d.
#
#		Written by Miquel van Smoorenburg <miquels@cistron.nl>.
#		Modified for Debian 
#		by Ian Murdock <imurdock@gnu.ai.mit.edu>.
#
# Version:	@(#)skeleton  1.9  26-Feb-2001  miquels@cistron.nl
#

set -e

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
which kbdcontrol >/dev/null

do_start() {
	if test -e /etc/kbdcontrol.conf ; then
		echo -n "Loading console keymap..."
		kbdcontrol -l `grep -v ^# /etc/kbdcontrol.conf` < /dev/console
		echo "done."
	fi
}

case "$1" in
  start|"")
	do_start
	;;
  restart|reload|force-reload)
	echo "Error: argument '$1' not supported" >&2
	exit 3
	;;
  stop)
	# No-op
	;;
  *)
	echo "Usage: mountall.sh [start|stop]" >&2
	exit 3
	;;
esac

exit 0