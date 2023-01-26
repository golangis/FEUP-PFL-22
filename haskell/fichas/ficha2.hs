import Outputable (dot)
import Data.Char ()
-- 2.1a
myand :: [Bool] -> Bool
myand [] = True
myand a = head a && myand (tail a)

-- 2.1b
myor :: [Bool] -> Bool
myor [] = False
myor a = head a || myor (tail a)

-- 2.1c
myconcat1 :: [[a]] -> [a]
myconcat1 [] = []
myconcat1 a = head a ++ myconcat1 (tail a)

myconcat2 :: [[a]] -> [a]
myconcat2 [] = []
myconcat2 (x:xs) = x ++ myconcat2 xs

-- 2.1d
myreplicate :: Int -> a -> [a]
myreplicate 0 _ = []
myreplicate n c = [c] ++ myreplicate (n-1) c

-- 2.1e
myindex :: [a] -> Int -> a
myindex l 0 = head l
myindex l n = myindex (drop 1 l) (n-1)

-- 2.1f
myelem :: Eq a => a -> [a] -> Bool
myelem _ [] = False
myelem elem (x:xs) = x == elem || myelem elem xs

-- 2.2 -- nao totalmente bem
myintersperse :: Char -> [Char] -> [Char]
myintersperse _ [] = []
myintersperse char (x:xs) = [x] ++ [char] ++ myintersperse char xs

-- 2.3
mdc :: Integer -> Integer -> Integer
mdc a 0 = a
mdc a b = mdc b (a `mod` b)

-- 2.4a
myinsert :: Ord a => a -> [a] -> [a]
myinsert num [] = [num]
myinsert num (x:xs) = if x > num then [num] ++ [x] ++ xs else x : myinsert num xs

-- 2.4b TODO 

-- 2.5 TODO

-- 2.6
somaquadrado :: Integer -> Integer
somaquadrado n = sum [x^2 | x <- [1..n]]

-- 2.7a
aprox1 :: Int -> Double
aprox1 n = sum [ ((-1) ** fromIntegral x) / (2 * fromIntegral x + 1) | x <- [0..n] ] * 4

-- 2.7b
aprox2 :: Int -> Double
aprox2 n = sqrt ( sum [ ((-1) ** fromIntegral x) / (fromIntegral x + 1) ** 2 | x <- [0..n]] * 12)

-- 2.8
dotprod :: [Float] -> [Float] -> Float
dotprod [] [] = 0
dotprod a b = head a * head b + dotprod (tail a) (tail b)

-- 2.9
divprop :: Integer -> [Integer]
divprop n = [x | x <- [1..n-1], n `mod` x == 0]

-- 2.10
perfeitos :: Integer -> [Integer]
perfeitos n = [x | x <- [1..n], sum (divprop x) == x]

-- 2.11
pitagoricos :: Integer -> [(Integer, Integer, Integer)]
pitagoricos n = [(x,y,z) | x<-[1..n] , y<-[1..n] , z<-[1..n], x^2 + y^2 == z^2]

-- 2.12
primo :: Integer -> Bool
primo n = divprop n == [1]

-- 2.13
mersennes :: [(Int, Int)]
mersennes = [ (x, 2^x-1) | x <-[1..30], primo (2^x - 1)]

-- 2.14
