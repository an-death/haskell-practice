{-# LANGUAGE ImplicitParams #-}
module NewYear where
import Data.Char

import GHC.IO.Encoding
import Control.Monad

alphabet = "абвгдеёжзийклмнопрстуфчцчшщъыьэюя"

decode :: String -> String
decode [] = []
decode (magicNumber:xs) = toLetters $ toIds $ payload where 
    payload = reverse xs
    toLetters = capitalize . map (alphabet !!)
    toIds :: String -> [Int]
    toIds [] = []
    toIds (x:y:xl) = toId [x,y] :toIds xl
    toId :: String -> Int
    toId = (subtract $ read [magicNumber]) . read
    

capitalize :: String -> String
capitalize [] = []
capitalize (x:xs) = toUpper x:xs



main ::IO ()
main = do
    setLocaleEncoding utf8

    forever $ main'

main' = do
    putStrLn "put str"
    inputStr <- getLine
    putStrLn   $ decode $ inputStr
