#!/bin/bash

export DIR=/var/www/html/checks
export INFLUX='http://infdb:8086/write?db=dba&precision=m'

source /etc/measure/sping-conf/common.conf.sh

echo sending 
#send data to db
head -1 ~/rep*|perl -pe 's/ snm/,snet=/; s/ (\d+) /=\1,/g; s/blic /blic=/' | curl -i -XPOST $INFLUX --data-binary @- ## mins

