#!/usr/bin/lua
-- $Id$
-- http://www.bagley.org/~doug/shootout/

local lines = {}
local nl = 0

for l in io.lines() do
    nl = nl + 1
    lines[nl] = l
end

for i=nl,1,-1 do
    io.write(lines[i], "\n")
end
