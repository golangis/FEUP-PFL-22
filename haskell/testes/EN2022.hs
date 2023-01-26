type Species = (String, Int)
type Zoo = [Species]

-- 1
isEndangered :: Species -> Bool
isEndangered s = snd s <= 100

-- 2
updateSpecies :: Species -> Int -> Species
updateSpecies s nb = (fst s, snd s + nb)

-- 3
filterSpecies :: Zoo -> (Species -> Bool) -> Zoo
filterSpecies [] _ = []
filterSpecies (sp: zx) p = if (p sp) then sp : filterSpecies zx p else filterSpecies zx p

-- 4
countAnimals :: Zoo -> Int 
countAnimals z = foldr ((+) . snd) 0 z

-- 5
substring1 :: (Integral a) => String -> a -> a -> String
substring1 string begin end = [ string !! fromIntegral pos | pos <- [begin..end]] 

substring2 :: (Integral a) => String -> a -> a -> String
substring2 string begin end = [ letter | (letter, index) <- zip string [0..length string], index >=  fromIntegral begin && index <= fromIntegral end ] 

-- 6
hasSubstr :: String -> String -> Bool
hasSubstr str substr = length [ i |  i <- [0..start_last_piece], substr == substring1  str i (i + (length substr - 1))] > 0 
                       where start_last_piece = ( (length str) - (length substr))

-- 7
sortSpeciesWithSubstr :: Zoo -> String -> (Zoo, Zoo)
sortSpeciesWithSubstr zoo str = ([species | species <- zoo, hasSubstr (fst species) str ], [species | species <- zoo,  not (hasSubstr (fst species) str)] )

-- 8 jasus
rabbits :: (Integral a) => [a]
rabbits = 2 : 3 : zipWith (+) rabbits (tail rabbits)

-- 9
rabbitYears :: (Integral a) => a -> Int
rabbitYears population = head [ years| (nr, years) <- zip rabbits [0..], population <= nr ]
                        where n = 0

-- 10
data Dendrogram = Leaf String | Node Dendrogram Int Dendrogram 

myDendro :: Dendrogram 
myDendro = Node (Node (Leaf "dog") 3 (Leaf "cat")) 5 (Leaf "octopus")

dendroWidth :: Dendrogram -> Int 
dendroWidth dendro = foldl (+) 