#!/usr/bin/ruby
# -*- mode: ruby -*-
# $Id$
# http://www.bagley.org/~doug/shootout/
# based on code from Aristarkh A Zagorodnikov and Dat Nguyen

STUFF = "hello\n"
hello = ''
(ARGV.first.to_i || 1).times do
    hello << STUFF
end
puts hello.length
