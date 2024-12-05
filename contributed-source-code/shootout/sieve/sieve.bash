#!/bin/bash
# $Id$
# http://www.bagley.org/~doug/shootout/
# from Steve Fink 

NUM=${1:-1}

while [ $NUM -gt 0 ]; do
    i=2
    while [ $i -le 8192 ]; do
        eval P$i=true
        i=$[ $i + 1 ]
    done

    count=0
    i=2
    while [ $i -le 8192 ]; do
        if eval \$P$i; then
            # remove all multiples of prime: i
            k=$[ $i + $i ]
            while [ $k -le 8192 ]; do
                eval P$k=false
                k=$[ $k + $i ]
            done
            count=$[ $count + 1 ]
        fi
        i=$[ $i + 1 ]
    done

    NUM=$[ $NUM - 1 ]
done

echo Count: $count
