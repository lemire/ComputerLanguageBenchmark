#!/usr/bin/perl
# $Id$
# http://shootout.alioth.debian.org/

# Tony Bowden suggested using tr versus lc and split(/[^a-z]/)
# Some corrections to comply with tr/wc/sort "master" implementation

use strict;

my %count = ();
while (read(STDIN, $_, 4095) and $_ .= <STDIN>) {
    tr/A-Za-z/\n/cs;
    ++$count{$_} foreach split('\n', lc $_);
}

my @lines = ();
my ($w, $c);
while (($w, $c) = each(%count)) {
    next if ("$w" eq "");
    push(@lines, sprintf("%7d %s\n", $c, $w));
}
print sort { $b cmp $a } @lines;
