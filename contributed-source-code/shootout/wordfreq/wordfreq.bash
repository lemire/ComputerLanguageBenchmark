#!/bin/bash
# $Id$
# http://www.bagley.org/~doug/shootout/

# data comes on stdin
# first tr lowercases all letters
# second tr turns non-alpha into whitespace
# grep removes lines that do not contain alpha chars
# sort the words
# take a count of each uniq word
# display frequencies in descending order
tr A-Z a-z | tr -cs a-z "[\012*]" | grep "[a-z]" | sort | uniq -c | sort -rn
