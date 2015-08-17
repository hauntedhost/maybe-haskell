-- Player is either X or O
data Player = X | O

-- Square is either open or taken by a player
data Square = Open | Taken Player

-- Row is top, middle or bottom
data Row = T | M | B

-- Column is left, center or right
data Column = L | C | R

-- Position is a tuple with row, column
type Position = (Row, Column)

-- Space is a tuple with position, square
type Space = (Position, Square)

-- Board is a list of spaces
type Board = [Space]

gameOver :: Board -> Bool
gameOver = undefined

openSpace :: Row -> Column -> Space
openSpace r c = ((r, c), Open)

openBoard :: Board
openBoard = openSpace <$> [T, M, B] <*> [L, C, R]
