#!/usr/bin/tclsh
# $Id$
# http://www.bagley.org/~doug/shootout/
# from: Kristoffer Lawson

proc main {n} {
    incr n
    while {[incr n -1]} {
        append str "hello\n"
    }
    puts [string length $str]
}

main [lindex $argv 0]
