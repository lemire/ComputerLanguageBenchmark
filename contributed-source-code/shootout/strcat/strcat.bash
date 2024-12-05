#!/bin/bash
# $Id$
# http://www.bagley.org/~doug/shootout/ 

NUM=$1
str=""
while [ $NUM -gt 0 ] ; do
    str="${str}hello
"
    NUM=$[ $NUM - 1 ]
done
echo ${#str}
