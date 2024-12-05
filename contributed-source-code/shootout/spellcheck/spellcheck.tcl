#!/usr/bin/tclsh
# $Id$
# http://www.bagley.org/~doug/shootout/
# from: Miguel Sofer
# some modifications suggested by Kristoffer Lawson

proc main {} {
    set 1 [open "Usr.Dict.Words" r]
    foreach 2 [read $1 [file size "Usr.Dict.Words"]] {set $2 1}
    close $1

    fconfigure stdout -buffering full
    while {[gets stdin 1] >= 0} {if {[catch {set $1}]} {puts $1}}
}

main
