#!/bin/bash

#FOR AUTO HEALTH CHECKS, CALL THIS WITH SNET IDX VARIABLES
# as in this crontab example
#*/20 * * * * snet=54.239.31.83. idx=aws /etc/measure/measure-pub/bin/mon-nmap-pings.sh

#CONFIG CAN USE THESE VARIABLES MANUALLY
export DIR=/var/www/dokuwiki/syslog/  #demo only 
export INFLUX='http://influ:8086/write?db=dba&precision=m'  # influx db in DNS

#OR CONFIG FILE, RECOMMENDED
source /etc/measure/sping-conf/common.conf.sh

# Ping & Summarize in Line
nmap -sP ${snet}2-99 | grep 10.149. -A1|perl -pe " s/.*for \d+\.\d+\.\d+\.(.*)\s$/${idx},i=\1 ip=\1/; s/.*\((.+)s lat.*/,lat=\1/" > $DIR/raw-$idx-$snet.txt

#send to Influx
cat $DIR/raw-$idx-$snet.txt | curl -i -XPOST $INFLUX --data-binary @- ## mins


