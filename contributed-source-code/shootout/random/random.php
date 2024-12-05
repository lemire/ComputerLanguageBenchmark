#!/usr/bin/php -f
<?php
/*
 $Id$
 http://shootout.alioth.debian.org/
*/
define("IM", 139968);
define("IA", 3877);
define("IC", 29573);

$LAST = 42;
function gen_random ($max) {
    global $LAST;
    return( ($max * ($LAST = ($LAST * IA + IC) % IM)) / IM );
}

$N = (($argc == 2) ? $argv[1] : 1) - 1;
while ($N--) {
    gen_random(100.0);
}

printf("%.9f\n", gen_random(100.0));
?>
