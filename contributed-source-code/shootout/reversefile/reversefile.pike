#!/usr/bin/pike
// -*- mode: pike -*-
// $Id$
// http://www.bagley.org/~doug/shootout/
// from: Fredrik Noring

void main() { write((reverse(Stdio.stdin.read()/"\n")*"\n")[1..]+"\n"); }
