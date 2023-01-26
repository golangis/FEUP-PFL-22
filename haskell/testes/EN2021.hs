import Data.Type.Coercion (trans)
-- 1
maxpos :: [Int] -> Int
maxpos [] = 0
maxpos (x:xs) = if (x > 0 && x > maxpos xs) then x else maxpos xs

-- 2
dups :: [a] -> [a]
dups [] = []
dups (x:xs) = x : x : if length xs /= 0 then  (head xs) : dups (tail xs)  else []

-- 3
transforma :: String -> String
transforma [] = []
transforma (x:xs) = if is_vogal then x: 'p' : x : transforma xs else x : transforma xs
                    where is_vogal = x =='a' || x =='e' || x == 'i' || x =='o' || x == 'u'

-- 4
type Vector = [Int]
type Matriz = [[Int]]

--transposta :: Matriz -> Matriz
--transposta matriz = [ [] | (a, b) <- zip ]
