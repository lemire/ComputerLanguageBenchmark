/* The Computer Language Shootout
   http://shootout.alioth.debian.org/
   contributed by Isaac Gouy (Scala novice)
*/

object harmonic {
   def main(args: Array[String]) = {
      val n = Integer.parseInt(args(0));
      var partialSum = 0.0;

      for (val i <- Iterator.range(1,n+1)) partialSum = partialSum + 1.0/i;
      Console.printf("{0,number,#.000000000}\n")(partialSum);
   }
}
