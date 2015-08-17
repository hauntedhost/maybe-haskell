import Data.List (find)
import Data.Maybe (fromJust, fromMaybe)

-- MODEL

data User = User { userId :: Int, userName :: String }

users :: [User]
users = [(User 1 "sean"), (User 2 "alli"), (User 3 "sebastian")]

-- MAYBE

findUser :: [User] -> Int -> Maybe User
findUser users id = find (\user -> (userId user) == id) users

-- VIEW

showUserId :: Maybe User -> String
showUserId Nothing = ""
showUserId user = show (fromJust (fmap userId user))

showUserName :: Maybe User -> String
showUserName user = fromMaybe "" (fmap userName user)

showUser :: Maybe User -> String
showUser Nothing = ""
showUser user = "{ id: " ++ id ++ ", name: " ++ name ++ " }"
  where id = showUserId user
        name = showUserName user

-- DATA

alli :: Maybe User
alli = findUser users 2

nobody :: Maybe User
nobody = findUser users 999
