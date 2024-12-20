#!/usr/bin/perl
# $Id$
# http://www.bagley.org/~doug/shootout/
# 
# Updated per suggestions by Alan Post

use strict;

# read dictionary
open(DICT, "<Usr.Dict.Words") or
    die "Error, unable to open Usr.Dict.Words\n";

my %dict;
while (<DICT>) {
    chomp;
    $dict{$_} = undef;
}
close(DICT);

$\ = "\n";
while (<STDIN>) {
    chomp;
    print unless exists $dict{$_};
}
