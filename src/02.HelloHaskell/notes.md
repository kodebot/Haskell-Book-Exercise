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