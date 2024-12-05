#!/usr/bin/perl
# $Id$
# http://www.bagley.org/~doug/shootout/

use integer;
shift;
while (<>) { $tot += $_ }
print "$tot\n";
