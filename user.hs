import Data.List (find)
import Data.Maybe (fromJust, fromMaybe)

-- MODEL

data User = User { userId :: Int, userName :: String, userEmail :: String }
data Param = Param { paramKey :: String, paramValue :: String }

users :: [User]
users = [
  User 1 "sean" "somlor@eml.cc",
  User 2 "alli" "alli.crwfrd@gmail.com"]

alli :: Maybe User
alli = findUser users 2

nobody :: Maybe User
nobody = findUser users 999

params :: [Param]
params = [
  Param "name" "sebastian",
  Param "email" "sebastian@kittycats.net",
  Param "_token" "48djs0gjk4208vs$"]

-- MAYBE

nextUserId :: [User] -> Int
nextUserId [] = 1
nextUserId users = maximum (map userId users) + 1

findUser :: [User] -> Int -> Maybe User
findUser users id = find (\user -> (userId user) == id) users

getParam :: String -> [Param] -> Maybe String
getParam key params = fmap paramValue maybeParam
  where maybeParam = find (\param -> (paramKey param) == key) params

userFromParams :: [Param] -> Maybe User
userFromParams params = User (nextUserId users)
  <$> getParam "name" params
  <*> getParam "email" params

findUserName :: Int -> Maybe String
findUserName id =
  findUser users id >>= \user ->
  Just (userName user)

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
