#!/usr/bin/ruby
# -*- mode: ruby -*-
# $Id$
# http://www.bagley.org/~doug/shootout/

IM = 139968
IA = 3877
IC = 29573

$last = 42.0
def gen_random (max) (max * ($last = ($last * IA + IC) % IM)) / IM end

N = Integer(ARGV.shift || 1) - 1
N.times do
    gen_random(100.0)
end
printf "%.9f\n", gen_random(100.0)
