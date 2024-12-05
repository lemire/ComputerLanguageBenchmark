#!/usr/bin/php -f
<?php
/*
 $Id$
 http://shootout.alioth.debian.org/
*/
$n = ($argc == 2) ? $argv[1] : 1;
$str = "";
while ($n-- > 0) {
    $str .= "hello\n";
}
$len = strlen($str);
print "$len\n";
?>
