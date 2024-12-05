%%% $Id$
%%% http://dada.perl.it/shootout/
%%%
%%% contributed by Isaac Gouy

%%  Usage: start from command line with
%%     ozc -x strcat.oz -o strcat.oz.exe
%%     strcat.oz.exe 40000

functor
import System Application

define

fun {RepeatAppend N S}
   if N == 0 then S else
      {RepeatAppend N-1 {Append "hello\n" S}} end
end

in
   local Args N in 
      [Args] = {Application.getArgs plain}
      N = {String.toInt Args}

      {System.showInfo {Length {RepeatAppend N nil}} }
   end
   {Application.exit 0}
end
