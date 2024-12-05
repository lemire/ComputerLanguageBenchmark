# $Id$
# http://www.bagley.org/~doug/shootout/

BEGIN { delete ARGV; tot = 0 }
{ tot += $1 }
END { print tot }
