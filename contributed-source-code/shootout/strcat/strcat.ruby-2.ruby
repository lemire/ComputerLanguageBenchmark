#!/usr/bin/ruby
# -*- mode: ruby -*-
# $Id$
# http://shootout.alioth.debian.org/

n = Integer(ARGV.shift || 1)

str = ''
for i in 1 .. n
    str += "hello\n"
end
puts str.length
