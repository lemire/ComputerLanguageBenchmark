#!/usr/bin/perl 
# $Id$
# http://www.bagley.org/~doug/shootout/

use strict;

my $NUM = $ARGV[0];
$NUM = 1 if ($NUM < 1);

my $str = "";
$str .= "hello\n" foreach (1..$NUM);
print length($str),"\n";

