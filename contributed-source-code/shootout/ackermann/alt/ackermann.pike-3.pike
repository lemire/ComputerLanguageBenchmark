#!/usr/bin/pike
// -*- mode: pike -*-
// $Id$
// http://www.bagley.org/~doug/shootout/
// from: Marcus Comstedt

// this version avoids the recursive function altogether!

void main( int argc, array(string) argv )
{
    int n = (int)argv[-1];
    if( n < 1 )
	n = 1;
    write( "Ack(3,%d): %d\n", n, (8<<n)-3 );
}
