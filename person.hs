--data Person a = PersonWithAge { name :: String, age  :: Int } |
--                PersonWithoutAge { name :: String }

--sean = PersonWithAge "Sean" 39

--ageInc person = sean { age = (age sean) + 1 }

data Person a = PersonWithSomething String a |
                PersonWithNothing String

sean :: Person a
sean = PersonWithNothing "Sean"

alli :: Person Int
alli = PersonWithSomething "Alli" 24

getName :: Person a -> String
getName (PersonWithSomething name _) = name
getName (PersonWithNothing name) = name

getAge :: Person Int -> Int
getAge (PersonWithSomething _ age) = age
getAge (PersonWithNothing _) = 0

