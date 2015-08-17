five :: Maybe Int
five = Just 5

notFive :: Maybe Int
notFive = Nothing

getValue :: Maybe a -> a
getValue (Just x) = x
getValue Nothing = error "Nope"

whenJust :: (a -> b) -> Maybe a -> Maybe b
whenJust f (Just x) = Just (f x)
whenJust _ Nothing = Nothing
