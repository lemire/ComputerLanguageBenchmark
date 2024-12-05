-- $Id$
-- http://www.bagley.org/~doug/shootout/
-- based on code from Roberto Ierusalimschy

assert(io.open("Usr.Dict.Words"))
local dict = {}
for line in io.lines("Usr.Dict.Words") do
  dict[line] = true
end

for word in io.lines() do
  if not dict[word] then print(word) end
end

