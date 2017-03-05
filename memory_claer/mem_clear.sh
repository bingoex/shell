#!/bin/bash

#remote shm which attach is 0
/usr/bin/ipcs -m | /bin/sed '1,3d' | /bin/sed '$d' | /bin/awk '{if($6 == 0) print $2}' | /usr/bin/xargs -ti /usr/bin/ipcrm -m {}

#clear swap
/sbin/swapoff -a && /sbin/swapon -a

#To optimize the parameters TODO
/bin/echo 500 > /proc/sys/vm/vfs_cache_pressure
/bin/echo 500 > /proc/sys/vm/dirty_expire_centisecs
/bin/echo 10 > /proc/sys/vm/swappiness

#clear cache
sync
/bin/echo 3 > /proc/sys/vm/drop_caches
#recover
/bin/echo 1 > /proc/sys/vm/drop_caches
