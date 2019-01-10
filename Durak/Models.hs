module Durak.Models
    ( Rank(..)
    , Suit(..)
    , Trump(..)
    , Card(..)
    , CardPair(..)
    , Hand(..)
    , Deck(..)
    , Player(..)
    , Table(..)
    , GameState(..)
    , getSuit
    ) where

data Rank = Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace deriving (Enum, Eq)
instance Show Rank where
    show Six = "6"
    show Seven = "7"
    show Eight = "8"
    show Nine = "9"
    show Ten = "10"
    show Jack = "J"
    show Queen = "Q"
    show King = "K"
    show Ace = "A"

data Suit = Clubs | Diamonds | Hearts | Spades deriving (Enum, Eq)
instance Show Suit where
    show Clubs = "♣"
    show Diamonds = "♦"
    show Hearts = "♥"
    show Spades = "♠"

type Trump = Suit
data Card = Card Rank Suit deriving Eq
getSuit (Card _ suit) = suit
instance Show Card where
    show (Card rank suit) = show rank ++ (show suit)
    showList [] = (\y -> "")
    showList (card:[]) = (\y -> show card)
    showList (card:cards) = (\y -> show card ++ " " ++ (show cards))

type Hand = [Card]
type Deck = [Card]
data Player = Player {
    id :: Int,
    name :: String,
    isAi :: Bool,
    hand :: Hand
} deriving Eq

data CardPair = CardPair Card (Maybe Card)
instance Show CardPair where
    show (CardPair card Nothing) = show card
    show (CardPair card (Just anotherCard)) = show card ++ "/" ++ (show anotherCard)
    showList [] = (\y -> "")
    showList (cardPair:[]) = (\y -> show cardPair)
    showList (cardPair:cardPairs) = (\y -> show cardPair ++ " " ++ (show cardPairs))

type Table = [CardPair]
data GameState = GameState {
                    currentPlayer :: Player,
                    defendingPlayer :: Player,
                    otherPlayers :: [Player],
                    roundNum :: Int,
                    deck :: Deck,
                    trump :: Trump,
                    table :: Table
                 }
