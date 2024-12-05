"* The Computer Language Benchmarks Game
    http://shootout.alioth.debian.org/
    contributed by Isaac Gouy
    modified by Eliot Miranda *"!

!Tests class methodsFor: 'benchmarking'!

   self print: a1 withName: '(2/3)^k' to: output.
   self print: a2 withName: 'k^-0.5' to: output.
   self print: a3 withName: '1/k(k+1)' to: output.
   self print: a4 withName: 'Flint Hills' to: output.
   self print: a5 withName: 'Cookson Hills' to: output.
   self print: a6 withName: 'Harmonic' to: output.
   self print: a7 withName: 'Riemann Zeta' to: output.
   self print: a8 withName: 'Alternating Harmonic' to: output.
   self print: a9 withName: 'Gregory' to: output.

!Tests class methodsFor: 'benchmarking'!
print: number withName: name to: output
   output print: number digits: 9; tab; nextPutAll: name; nl! !

