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