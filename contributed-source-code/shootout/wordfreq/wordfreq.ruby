#!/usr/bin/ruby
# -*- mode: ruby -*-
# $Id$
# http://shootout.alioth.debian.org/

freq = Hash.new(0)
loop {
    data = (STDIN.read(4095) or break) << (STDIN.gets || "")
    for word in data.downcase.tr_s('^A-Za-z',' ').split(' ')
	freq[word] += 1
    end
}
freq.delete("")

lines = Array.new
freq.each{|w,c| lines << sprintf("%7d %s\n", c, w) }
print lines.sort.reverse
