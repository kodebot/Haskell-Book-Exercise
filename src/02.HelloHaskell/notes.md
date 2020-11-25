## 2.2 REPL (Read Evaluate Print Loop)
GHCi useful commands:

```
Load file :load <<FILENAME>>
```

```
Unload file :m
```

```
Reload file :r
```

## 2.3 Understanding Expressions
Everything in Haskell is expression or declaration

**Expression** evaluates to a value in a predictable and transparent manner.

Expression can be simple or complex. Literal value is an example for simplest expression. Entire program is an example of complex expression composed on many expressions

**Declaration** is simply a name/label to expressions so it can be easily referred in many places.

### Normal form
Expression is in normal form when it cannot be reduced any further.

For example, the following is reducible
```
1 + 1
```
Reducible expressions are also referred to as `redexes`

The following one is no reducible so it is in `normal form`
```
2
```
The process of `reduction` is also referred to as `evaluation`. It is also referred to as `normalizing` or `executing` but these are less precise.

## 2.4 Functions
`Function` is specific type of expression in Haskell.

Haskell functions are related to mathematical functions. On other words, they simply map input value(s) to output value.

They return same value every time for same input value(s)

### Currying
All functions take one argument and returns one result. When a function takes multiple arguments, it simply means they are series of nested functions each applied with one argument. This is also known as `currying`.

Functions allow abstraction so they can be reused. For example rather than creating a function with ` 2 + 3 ` we can have ` a + b ` where `a` and `b` can be replaced with numbers at the time of evaluation. This means, the same function can be used in places where we need to add two numbers.

### Defining functions
```
[let] <FUNCTION_NAME> <PARAMETER(S)> = <BODY>
```
`let` is used only in `REPL` and they are no longer needed from GHC 8.0.1 onwards

example:
```
triple x = x * 3
```
use `camelCase` for functions and variables

## 2.5 Evaluation
Reducing an expression to value is called `evaluation`. Value is irreducible.

Applications of functions to arguments are reducible.

Haskell does lazy evaluation. ie. it doesn't evaluate a term until it is forced by other term refers it

The final, irreducible form is called canonical or normal form.

Haskell doesn't reduce everything to canonical form immediately. It reduces expressions to what is known as `Weak Head Normal Form` or `WHNF`

Here is an example of `WHNF`

```
(f -> (1, 2 + 2)) 2 // expression
(1, 2 + 2) // WHNF
```
In the example above `2 + 2` is not evaluated to `4` until the last possible moment

## 2.6 Infix Operators
Functions are prefix by default.
Operators are infix by default.
Operators are also functions.

All operators are functions but not all functions are operators.

Functions with name that are alphanumeric are prefix by default but can be made infix by wrapping it in backticks (`) (but not true for all the functions)

Functions with name that are symbol are infix by default but can be made prefix by wrapping it in parenthesis

```
2 + 3
(+) 2 3
div 20 10
20 `div` 10
```
### Parentheses and association
Infix operators and functions have association. We can get this detail using `:info` command in GHCi

```
:info (*)
```
returns
`infixl 7`
`l` - indicates left association
`7` - indicates the precedence in the scale of 0-9

left association example
```
    2 * 3 * 4 = (2 * 3) * 4
```

right association example (exponent)
```
    2 ^ 3 ^ 4 = 2 ^ ( 3 ^ 4)
```

general math rules hold good.

## 2.7 Declaring Values
Use module to group functions that can be imported by name. 
Use PascalCase for module name
```
module Chapter2 where
```

Indentation matters (incorrect one breaks the code)
Use spaces instead of tabs

Indentation of first line of code in a file decides the base indentation 

Part of an expression must be indented under the beginning of the expression

```
let x = 
    6
 ```

Grouped parts of an expression must be indented at the same level
```
let x = 6
    y = 8
```

break to new line if it exceeds 100 columns

## 2.8 Arithmetic functions in Haskell

```
+ addition
```
```
- subtraction
```
```
* multiplication
```
```
/ fractional division

100 / 3 = 33.33333333333336

```

```
div integer division (value is rounded down)

100 / 3 = 33
20 / (-6) = -4 -- note this is -4 because the value is rounded down
```

```
quot integer division (value is rounded towards zero)
100 / 3 = 33
20 / (-6) = -3 -- note this is -3 because the value is rounded towards zero
```

```
rem remainder after division (quot)

4 `rem` 2 = 0
5 `rem` 2 = 1
this is uses quot
so, rem 20 (-6) = 2
quot 20 (-6) = -3

-6 * -3(quot) + 2(rem) = 20
```

```
mod remainder after division (div)
4 `mod` 2 = 0
5 `mod` 2 = 1
mod uses div

so, mod 20 (-6) = -4
div 20 (-6) = -4

-6 * -4(div) + (-4)(mod remainder) = 20
```

### Using mod
`mod` and `rem` look like they are doing the same work but they are not

`mod` is doing modular arithmetic. One best example of modular arithmetic is clock

 For example adding 8 hour to 8 hour is not 16 but 4. It is modular arithmetic of 12


 the difference between `rem` and `mod` is clear when we use negative numbers

 ```
 (3 - 12) `mod` 7 = 5
 (3 - 12 ) `rem` 7 = -2 (note: this is the C# behaviour)
 ```

 When using `mod` the sign of result will be sign of divisor when dividend and divisor have different signs
```
    -5 `mod` 2 = 1
    -5 `mod` -2 = -1
    -5 `mod` -2 = -1
```

### Negative numbers
minus symbol (-) is alias for unary operator `negate`
minus symbol is also overloaded to indicate negative numbers

when negative number is used in an expression when it appears next to an operator with same precedence
then Haskell needs some help

```
100 + -9 --> error
100 + (-9) --> OK
```

## 2.9 Parenthesization

- use parenthesis to use infix operator in prefix position
- partial application of operator (aka sectioning) can be done using parenthesis

```
(+ 2) 2 = 4
(2 +) 2 = 4
```
`+` is commutative so order doesn't matter

```
(/ 1) 2 = 2
(1 /) 2 = 0.5
```
`/` is not commutative so order matters

subtract is special
```
(-1) 2 --> this will not work (-1) is treated is negative number
^^ can be changed to (subtract 1) 
(1 - ) 2 --> this is OK
```

`$` is special operator which is lowest priority right associative operator, mainly used to remove parenthesis when writing expressions

```
(2 ^) (2 + 2) can be rewritten as (2 ^) $ 2 + 2
```
the definition of `$` is `f $ a = f a` 

## 2.10 Let and where

`let` is used to start an expression along with `in` keyword
`where` is used in the expression

difference can be best understood with examples

```
let x = 6
    y = 8
in x + y

sum = x + y
    where x = 6
          y = 8
```