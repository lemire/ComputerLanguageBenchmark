#!/usr/bin/perl
# $Id$
# http://shootout.alioth.debian.org/
# Revised by Soren Morton

undef($/);
print reverse( split(/^/, <STDIN>));
#print join("\n", reverse split(/\n/, <STDIN>)),"\n";
