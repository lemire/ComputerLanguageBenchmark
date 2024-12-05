# $Id$
# http://www.bagley.org/~doug/shootout/

BEGIN { delete ARGV }
{ x[NR] = $0 }
END { for (i = NR; i >= 1; i--)
    print x[i]
}
