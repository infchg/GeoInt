#!/bin/bash

#thanks echo `hostname` # new edits by anthony
where=$(hostname|cut -f1,2 -d\-)
where=${where#min-};where=${where%-*}; # echo $where


