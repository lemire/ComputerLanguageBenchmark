#!/usr/bin/perl
# $Id$
# http://www.bagley.org/~doug/shootout/

use strict;

my $n = ($ARGV[0] > 0) ? $ARGV[0] : 1;
my $x = 0;
my $a = $n;
while ($a--) {
    my $b = $n;
    while ($b--) {
	my $c = $n;
	while ($c--) {
	    my $d = $n;
	    while ($d--) {
		my $e = $n;
		while ($e--) {
		    my $f = $n;
		    while ($f--) {
			$x++;
		    }
		}
	    }
	}
    }
}
print "$x\n";
