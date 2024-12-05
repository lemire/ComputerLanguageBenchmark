#!/bin/bash
# $Id$
# http://www.bagley.org/~doug/shootout/

function fib {
    if [ $1 -lt 2 ] ; then
	echo 1
    else
	echo $[ `fib $[ $1 - 2 ]` + `fib $[ $1 - 1 ]` ]
    fi
}

N=${1:-1}
fib $N
