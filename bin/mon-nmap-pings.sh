#!/bin/bash

#FOR AUTO HEALTH CHECKS, CALL THIS WITH SNET IDX VARIABLES and optionally ${start:-2}-${end:-99} 
# as in this crontab example
snet=${snet:-127.0.0.}
idx=${idx:-test}
#*/20 * * * * snet=54.239.31.83. idx=aws /etc/measure/measure-pub/bin/mon-nmap-pings.sh

#CONFIG CAN USE THESE VARIABLES MANUALLY
export DIR=/var/www/dokuwiki/syslog/  #demo only 
export INFLUX='http://influ:8086/write?db=dba&precision=m'  # influx db in DNS ## mins
export ELASTIC='http://starter-us-west-2-infra-1717073047.us-west-2.elb.amazonaws.com:9200/' #change with your elastic

#OR CONFIG FILE, RECOMMENDED
source /etc/measure/sping-conf/common.conf.sh

#WHERE variable and DAT file
source /etc/measure/measure-pub/bin/location-hostname.sh 
export dat=$DIR/raw-$idx-$snet.txt

# Ping & Summarize in Line
 #start & end end=${end:-99}  # start & end , start=${start:-2}  #
nmap -n -sP ${snet}${start:-2}-${end:-99} | egrep -e '\.[0-9]+\.'  -A1|perl -pe " s/.*for \d+\.\d+\.\d+\.(.*)\s$/${idx},r=${where},snet=${snet},i=\1 ip=\1/; s/.*\((.+)s lat.*/,lat=\1/" > $dat   ##  DIR/raw-$idx-$snet.txt

#send to Influx     -> for Grafana
		#cat $DIR/raw-$idx-$snet.txt | curl -i -XPOST $INFLUX --data-binary @- ## mins
curl -i -XPOST $INFLUX --data-binary @$dat 

#Send to Elastic bulk  -> for Kibana 
perl -pe 's/^(\w+),/{"index":{"_index":"\1","_type":"_doc"}}\n{"/; s/ /,/;s/ /,time=/;s/\s*$/000}\n/;   s/,([\w\.]+)=/,"\1":/g; s/=/":/; s/:([\w\.]+),/:"\1",/g'   $dat  |curl -s -H 'Content-Type: Application/json'  -XPOST ${ELASTIC}/_bulk  --data-binary @-


# perl -pe 's/^(\w+),/{"index":{"_index":"\1","_type":"_doc"}}\n{"/; s/ /,/;s/ /,time=/;s/\s*$/000}\n/;   s/,([\w\.]+)=/,"\1":/g; s/=/":/; s/:([\w+),/:"\1",/g'   $dat  |curl -s -H 'Content-Type: Application/json'  -XPOST ${ELASTIC}/_bulk  --data-binary @-


