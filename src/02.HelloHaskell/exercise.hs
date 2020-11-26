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

{-|
2.7 Declaring Values
Heal the sick
1. let area x = 3. 14 * (x * x)
2. let double x = b * 2
3. x = 7
     y = 10
   f = x + y
-}

-- Answers
area x = 3.14 * (x * x) -- space after 3. (3. 14)

double x = x * 2 -- b is undefined

x = 7
y = 10 -- incorrect indentation of y
f = x +y 

{-|
2.10 Head code
1. let x = 5 in x
Ans: 
5
echo  = x
    where x = 5

2. let x = 5 in x * x
Ans:
25

mult  = x * x
    where x = 5

3. let x = 5; y = 6 in x * y
Ans: 
30

times = x * y
    where x = 5
          y = 6

4. let x = 3; y = 1000 in x + 3
Ans:
6

exp = x + 3
    where x = 3
          y = 1000
-}

{-|
2.1. Chapter exercise
-}

-- Parenthesis

p1 = 2 + 2 * 3 - 1
pa1 = 2 + (2 * 3) -1

p2 = (^) 10 $ 1 + 1
pa2 = (^) 10 (1 + 1)

p3 = 2 ^ 2 * 4 ^ 5 + 1
pa3 = ((2 ^ 2) * (4 ^ 5)) + 1

-- Equivalent Expressions
{-|
1 + 1 = 2
10 ^ 2 = 10 + 9 * 10 -> 9 * 10 is evaluated first
400 - 37 != (-) 37 400 -> right hand side is equivalent to 37 - 400
100 `div` 3 != 100 / 3 -> `div` is integer division / is not
2 * 5 + 18 != 2 * (5 + 8) -> parenthesis changes the order of evaluation
-}


-- more fun with functions
{-|
z = 7
y = z + 8
x = y ^ 2
waxOn = x * 5 -- 1125

-- 1
10 + waxOn --  1135
(+10) waxOn -- 1135
(-) 15 waxOn -- -1110
(-) waxOn 15 -- 1110

-- 2
triple x = x * 3

-- 3
triple waxOn -- 1125 * 3 -> 3375
-}

-- 4
waxOn = x * 5
    where x = y ^ 2
          y = z + 8
          z = 7

-- 5
triple x = x * 3

-- 6
waxOff x = triple x

-- 7
res1 = waxOff 10 -- 30
res2 = waxOff (-50 ) -- -150
