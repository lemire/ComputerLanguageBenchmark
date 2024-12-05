# $Id$
# http://www.bagley.org/~doug/shootout/

function fib(n) {
    if (n < 2) return(1);
    return(fib(n-2) + fib(n-1));
}

BEGIN {
    n = (ARGV[1] < 1) ? 1 : ARGV[1];
    printf("%d\n", fib(n));
    exit;
}
