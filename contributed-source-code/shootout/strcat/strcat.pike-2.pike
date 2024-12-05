#!/usr/bin/pike
// -*- mode: pike -*-
// $Id$
// http://shootout.alioth.debian.org/

void main(int argc, array(string) argv)
{
    int n = (int)argv[-1];
    if (n < 1) n = 1;
      
    string str = "";
    for (int i=0; i<n; i++) {
	str += "hello\n";
    }
    write("%d\n", strlen(str));
}
