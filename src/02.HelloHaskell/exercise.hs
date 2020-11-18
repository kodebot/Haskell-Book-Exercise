{-|
2.5 Evaluation
1. Given the following lines of code as they might appear in a
source file, how would you change them to use them directly in
the REPL?
-}
half x = x / 2 --let half x = x/2

square x = x * x -- let square x = x * *

{-|
2. Write one function that has one parameter and works for all
the following expressions. Be sure to name the function.
        3.14 * (5 * 5)
        3.14 * (10 * 10)
        3.14 * (2 * 2)
        3.14 * (4 * 4)
-}
piTimes x = 3.14 * x

{-|
3. There is a value in Prelude called pi. Rewrite your function to use pi instead of 3.14
-}
betterPiTies x = pi * x


{-|
2.6 Infix Operators
Below are some pairs of functions that are alike except for parenthesization.
Read them carefully and decide if the parentheses change
the results of the function. Check your work in GHCi.
    1. 
        a) 8 + 7 * 9
        b) (8 + 7) * 9
        Ans: Yes. a) 71 b) 135
    2. 
        a) perimeter x y = (x * 2) + (y * 2)
        b) perimeter x y = x * 2 + y * 2
        Ans: No
    3. 
        a) f x = x / 2 + 9
        b) f x = x / (2 + 9)
        Ans: Yes. let x = 110 a) 55 + 9 b) 10
-}