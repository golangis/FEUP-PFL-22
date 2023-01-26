data Arv a = Vazia | No a (Arv a) (Arv a)
-- 4.1
sumArv :: Num a => Arv a -> a
sumArv Vazia = 0
sumArv (No a b c) = a + sumArv b + sumArv c  

-- 4.2
listar :: Arv a -> [a]
