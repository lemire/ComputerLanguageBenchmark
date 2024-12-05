#!/usr/bin/ruby
# -*- mode: ruby -*-
# $Id$
# http://www.bagley.org/~doug/shootout/
# with help from Aristarkh A Zagorodnikov

n = (ARGV.shift || 1).to_i

hash = {}
for i in 1..n
    hash['%x' % i] = 1
end

c = 0
n.downto 1 do |i|
    c += 1 if hash.has_key? i.to_s
end

puts c
