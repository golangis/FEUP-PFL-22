-- 3.1
-- map(f filter( p x ))

-- 3.2
dec2int:: [Int] -> Int
dec2int lis = foldl (+) 0 list
            where list = zipWith (*) [10^x | x <- [0..]] (reverse lis)

-- 3.3
zipWith1 :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith1 _ [] _ = []
zipWith1 _ _ [] = []
zipWith1 f (e1:xs1) (e2:xs2) = [f e1 e2] ++ zipWith f xs1 xs2
