#!/usr/bin/pike
// -*- mode: pike -*-
// $Id$
// http://www.bagley.org/~doug/shootout/

void main() {
    array(string) a = Stdio.read_file("Usr.Dict.Words")/"\n";
    mapping dictionary = mkmapping(a, allocate(sizeof(a), 1));
    while (string word = Stdio.stdin.gets()) {
	if (!dictionary[word]) write("%s\n", word);
    }
}
