#!/usr/bin/pike
// -*- mode: pike -*-
// $Id$
// http://www.bagley.org/~doug/shootout/
// from Per Hedbor

void main(int argc, array(string) argv) {
    int n = (int)argv[-1];
    if (n < 1) n = 1;
      
    String.Buffer str = String.Buffer();
    function f = str->add;
    for (int i=0; i<n; i++) {
	f("hello\n");
    }
    write("%d\n", strlen(str->get()));
}
