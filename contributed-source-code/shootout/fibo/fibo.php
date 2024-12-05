#!/usr/bin/php -f
<?php
/*
 $Id$
 http://shootout.alioth.debian.org/
*/
function fibo($n){
    return(($n < 2) ? 1 : fibo($n - 2) + fibo($n - 1));
}
$n = ($argc == 2) ? $argv[1] : 1;
$r = fibo($n);
print "$r\n";
?>
