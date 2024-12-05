#!/usr/bin/ruby
# -*- mode: ruby -*-
# $Id$
# http://www.bagley.org/~doug/shootout/
# from: Mathieu Bouchard, revised by Dave Anderson

count = 0
l=""
STDIN.each{ |l|
    count += l.to_i
}
puts count
