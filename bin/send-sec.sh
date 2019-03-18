#!/bin/bash

export DIR=/var/www/html/checks
export INFLUX='http://mob:8086/write?db=dba&precision=m'

#send data to db
head -1 ~/rep*|perl -pe 's/ snm/,snet=/; s/ (\d+) /=\1,/g; s/blic /blic=/' | curl -i -XPOST $INFLUX --data-binary @- ## mins

