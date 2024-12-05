#!/usr/bin/ruby
# -*- mode: ruby -*-
# $Id$
# http://www.bagley.org/~doug/shootout/
# from Avi Bryant

n = Integer(ARGV.shift || 1)
x = 0
n.times do
    n.times do
	n.times do
	    n.times do
		n.times do
		    n.times do
			x += 1
		    end
		end
	    end
	end
    end
end
puts x
