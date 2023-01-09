-- 1.1
testaTriangulo :: Float -> Float -> Float -> Bool
testaTriangulo a b c = (a+b)>c && (a+c)>b && (b+c)>a
-- 1.2
areaTriangulo :: Float -> Float -> Float -> Float
areaTriangulo a b c = (s * (s-a) * (s-b) * (s-c))**(1/2)
                    where s = (a+b+c)/2
-- 1.3
metades :: [a] -> ([a], [a])
metades l = (take (div (length l) 2) l, drop (div (length l) 2) l)
-- 1.4a
last1 :: [a] -> a
last1 l = head ( reverse l )
-- 1.4b
init1 :: [a] -> [a]
init1 l = reverse( tail (reverse l))
-- 1.5a
binom :: Integer -> Integer -> Integer
binom n k = (product [1..n]) `div` (product [1..k] * product[1..n-k])
-- 1.5b
binom2 :: Integer -> Integer -> Integer
binom2 n k | k <= n-k = product [n-k+1..n] `div` product [1..k]
           | k > n-k = product [k+1..n] `div` product [1..n-k]
-- 1.6
raizes :: Float -> Float -> Float -> (Float, Float)
raizes a b c = ( (-b + sqrt bin_dis) / (2*a), (-b - sqrt bin_dis) / (2*a))
            where bin_dis = b^2 -4*a*c
-- 1.7a: [Char]
-- 1.7b: (Char, Char, Char)
-- 1.7c: [(Boolean, Char)]
-- 1.7d: ([Bool], [Char])
-- 1.7e: [func]
-- 1.7f: []??

-- 1.8??

-- 1.9
classifica :: Int -> String
classifica nota
                | nota <= 9 = "reprovado"
                | nota >= 10 && nota <= 12 = "suficiente"
                | nota >= 13 && nota <= 15 = "bom"
                | nota >= 16 && nota <= 18 = "muito bom"
                | nota >= 19 && nota <= 20 = "excelente"
                | nota > 20 = "não."

-- 1.10
classifica1 :: Float -> Float -> String
classifica1 peso altura
                        | imc < 18.5 = "Baixo Peso"
                        | imc >= 18.5 && imc < 25 = "Peso Normal"
                        | imc >= 25 && imc < 30 = "Excesso de Peso"
                        | imc >= 30 = "Obesidade"
                        where imc = peso/(altura^2)

-- 1.11a
max3, min3 :: Ord a => a -> a -> a -> a
max3 x y z = if x>y && x>z then x else if y>x && y>z then y else z
min3 x y z = if x<y && x<z then x else if y<x && y<z then y else z

-- 1.11b
max3_2, min3_2 :: Ord a => a -> a -> a -> a
max3_2 x y z = max (max x y) z
min3_2 x y z = min (min x y) z

-- 1.12
xor :: Bool -> Bool -> Bool
xor a b
   | a==b = False
   | otherwise = True

-- 1.13
safetail_conditional :: [a] -> [a]
safetail_conditional a = if length a == 0 then [] else tail a

safetail_guards :: [a] -> [a]
safetail_guards a
                 |length a == 0 = []
                 |otherwise = tail a

safetail_pattern :: [a] -> [a]
safetail_pattern [] = []
safetail_pattern x = tail x

-- 1.14a
curta1 :: [a] -> Bool
curta1 a = length a < 3

-- 1.14b
curta2 :: [a] -> Bool
curta2 [] = True
curta2 [_] = True
curta2 [_, _] = True
curta2 x = False

-- 1.15a
mediana1 :: Ord a => a -> a -> a -> a 
mediana1 a b c
        | min3 a b c /= a && max3 a b c/= a = a
        | min3 a b c /= b && max3 a b c /= b = b
        | min3 a b c /= c && max3 a b c /= c = c

-- 1.15b (esta funçao apesar de ser o que é sugerido, dá mal caso o maximo/minimo apareça 2x)
mediana2 :: (Num a, Ord a) => a -> a -> a -> a
mediana2 a b c = a + b + c - min3 a b c - max3 a b c

