#!/usr/bin/ruby
# -*- mode: ruby -*-
# $Id$
# http://shootout.alioth.debian.org/
# Revised by Dave Anderson 

dict = Hash.new
l = ""

IO.foreach("Usr.Dict.Words") do |l|
  dict[l.chomp!] = 1
end 

STDIN.each do |l|
  unless dict.has_key? l.chomp!
    puts l
  end
end
