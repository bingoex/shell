# shell
提供实用shell脚本，并记录语法、demo(无实际意义)、linux命令
- demo结尾命名的目录均为语法demo，不存在实际意义
- 其他命名的目录均为实用性脚本

## online\_log\_demo
日志捞取脚本demo
- find -maxdepth
- xargs -i {}
- set -x
- date -d{日期} +%s
- while read -d
- $(()) ：calculate

## batch\_operation\_demo
批量操作demo
- mysql
- gawk
- awk printf sprintf rshift and lshift or strtonum
- for

## curl\_sha\_demo
使用sha256sum计算密文并发送http请求
- date
- sha256sum
- cut -d
- curl -H

## memory\_claer
内存清理脚本（删除无用systemV共享内存、参数调优（减少swap使用、减少缓存占用）、清理swap、清空cache）
- ipcs
- sed
- xargs
- swapoff/swapon
- sync

## static\_swa\_use
统计运行进程使用swap量
- for
- find 
- cut
- cut
- egrep
- /dir smaps
- let

## check\_remote\_conntor
监控并打印连接本机某端口（可配）的‘远端‘机器ip
- export
- netstat
- grep
- awk
- sort
- uinq

## refresh\_web
- RANDOM
- for arry
- curl
- sleep
