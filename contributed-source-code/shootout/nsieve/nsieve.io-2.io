/* The Computer Language Benchmarks Game
   http://shootout.alioth.debian.org
   contributed by Robert Brandner */


mkbuf := method(n,
	b := List clone
	b preallocateToSize(n)
	n repeat(b append(true))
	return b
)

nsieve := method(n,
	primes := mkbuf(n)
	cnt := 0
	for(i, 2, n, 
		if(primes at(i),
			k := i + i
			while (k < n,
				primes atPut(k, false)
				k = k + i
			)
			cnt = cnt + 1
		)
	)
	writeln("Primes up to", n asString alignRight(9, " "), cnt asString alignRight(9, " "))
)

n := System args at(1) asNumber
nsieve( (1<<n)*10000 )
nsieve( (1<<(n-1))*10000 )
nsieve( (1<<(n-2))*10000 )
