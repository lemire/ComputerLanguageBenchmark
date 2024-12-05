#!/usr/bin/perl
# $Id$
# http://www.bagley.org/~doug/shootout/

# this program is modified from:
#   http://cm.bell-labs.com/cm/cs/who/bwk/interps/pap.html
# Timing Trials, or, the Trials of Timing: Experiments with Scripting
# and User-Interface Languages</a> by Brian W. Kernighan and
# Christopher J. Van Wyk.

use strict;

my($nl, $nw, $nc);
while (read(STDIN, $_, 4095)) {
    $_ .= <STDIN>;
    $nl += scalar(split(/\n/));
    $nc += length;
    $nw += scalar(split);
}
print "$nl $nw $nc\n";
