-- $Id$
-- http://www.bagley.org/~doug/shootout/
-- implemented by: Roberto Ierusalimschy

assert(readfrom("Usr.Dict.Words"))
local dict = {}
-- reads the whole file at once, and then break it into words
gsub(read("*a"), "(%w+)", function (w)
  %dict[w] = 1
end)
readfrom()    -- closes dictionary

-- reads the whole file at once, and then break it into words
gsub(read("*a"), "(%w+)", function (w)
  if not %dict[w] then print(w) end
end)
