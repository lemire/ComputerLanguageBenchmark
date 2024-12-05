#!/usr/bin/pike
// -*- mode: pike -*-
// $Id$
// http://www.bagley.org/~doug/shootout/
// from: Martin Nilsson

void main(int argc, array(string) argv)
{
    int i, c = 0;
    int n = (int)argv[-1];
    if (n < 1) n = 1;
      
    mapping(string:int) X = ([]);
    
    for (i=1; i<=n; i++) {
	X[sprintf("%x", i)] = i;
    }
    for (i=n; i>0; i--) {
	if (X[(string)i]) c++;
    }
    write("%d\n", c);
}
