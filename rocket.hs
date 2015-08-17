import Data.Maybe (fromJust, fromMaybe)

data Rocket = Rocket {
  rocketName :: String,
  rocketFuel :: Int,
  rocketLaunched :: Bool }

data LaunchError = LaunchError { launchErrorReason :: String }
type Launched a = Either LaunchError a

newRocket :: String -> Rocket
newRocket name = Rocket name 100 False

launchRocket :: Rocket -> Launched Rocket
launchRocket rocket
  | rocketFuel rocket <= 25 = Left (LaunchError "Not enough fuel!")
  | otherwise               = Right (rocket { rocketLaunched = True })

showLaunchResult :: Launched Rocket -> String
showLaunchResult launch =
  case launch of
    Right successRocket            -> "Rocket launched!"
    Left (LaunchError errorReason) -> "Rocket failure: " ++ errorReason

doLaunch :: Rocket -> String
doLaunch rocket = showLaunchResult (launchRocket rocket)

badRocket :: Rocket
badRocket = (newRocket "BadRocket") { rocketFuel = 0 }

goodRocket :: Rocket
goodRocket = newRocket "CatRocket"
