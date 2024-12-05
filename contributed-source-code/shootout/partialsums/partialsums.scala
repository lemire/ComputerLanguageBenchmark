/*
   The Computer Language Benchmarks Game
   http://shootout.alioth.debian.org/
   contributed by Andrei Formiga
   modified by Isaac Gouy
   modified by Meiko Rachimow
*/

object partialsums {

   def main(args: Array[String]) = {
      accumulate(0,0,0,0,0,0,0,0,0, Integer.parseInt(args(0))+1, 1,1)
   }

   val twothirds = 2.0 / 3.0

   def accumulate(a1: double, a2: double, a3: double, a4: double, a5: double,
                  a6: double, a7: double, a8: double, a9: double,
                  n: double, alt: double, k: double) : Unit = {

      if (k < n) {

         val k2 =  Math.pow(k, 2.0)
         val k3 = k2 * k
         val sk = Math.sin(k)
         val ck = Math.cos(k)

         accumulate(
             a1 + Math.pow(twothirds, k - 1.0)
            ,a2 + 1.0 / Math.sqrt(k)
            ,a3 + 1.0 / (k * (k + 1.0))
            ,a4 + 1.0 / (k3 * sk*sk)
            ,a5 + 1.0 / (k3 * ck*ck)
            ,a6 + 1.0 / k
            ,a7 + 1.0 / k2
            ,a8 + alt / k
            ,a9 + alt / (2.0 * k - 1.0)
            ,n
            ,-alt
            ,k + 1.0
            )

      } else {

         val f = "%.9f\t"
         Console.printf( f + "(2/3)^k\n", a1)
         Console.printf( f + "k^-0.5\n", a2)
         Console.printf( f + "1/k(k+1)\n", a3)
         Console.printf( f + "Flint Hills\n", a4)
         Console.printf( f + "Cookson Hills\n", a5)
         Console.printf( f + "Harmonic\n", a6)
         Console.printf( f + "Riemann Zeta\n", a7)
         Console.printf( f + "Alternating Harmonic\n", a8)
         Console.printf( f + "Gregory\n", a9)

      }
   }
}
