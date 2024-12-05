-- $Id$
-- http://shootout.alioth.debian.org/
-- Brent Fulgham

import System(getArgs)
import Read

ack :: Int -> Int -> Int
ack m n
  | m == 0 = n + 1
  | n == 0 = ack (m - 1) 1
  | otherwise = ack (m - 1) (ack m (n - 1))

main = do
       ~[number] <- getArgs
       let n = read readDec number in
         putStrLn ("Ack(3," ++ (show n) ++ "): " ++ (show (ack 3 n)))
