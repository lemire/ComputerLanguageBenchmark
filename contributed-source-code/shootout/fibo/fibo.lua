-- $Id$
-- http://www.bagley.org/~doug/shootout/

function fib(n)
    if (n < 2) then return(1) end
    return( fib(n-2) + fib(n-1) )
end

N = tonumber((arg and arg[1])) or 1
io.write(fib(N), "\n")
