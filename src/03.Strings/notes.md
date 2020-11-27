## 3.1 Printing string
Sequence or list of characters are called string

## 3.2 A first look at types

* Type is a way to categorize values. For example integer, boolean, etc..

* `char` is a type for character. Characters are enclosed in single quotes
```
'a'
```
Type of a value can be printed using `GHCi`
```
:type 'a'

'a' :: Char
```

`::` represents type signature. This can be read as "has a type"

so 'a' has a type Char

* strings are enclosed in double quotes

```
:type "abc"

"abc" :: [Char]

```
here `[Char]` is syntactic sugar for Char list.

`String` is alias for `[Char]`

## 3.3 Printing simple strings

`print` prints any type. When using `print` function to print string, it is printed with double quotes

`putStrLn` prints string and inserts new line

`purStr` prints string 

### 3_3_print1.hs
main is not a function but function application is assigned to it

when using stack `main` function is compulsory but any file (without main function) can be loaded in to `GHCi` and run

The type of `main` in this example is `IO`. `IO` indicates any effect other than evaluating an expression. Printing to screen is an effect so the type of `main` is `IO`

### 3_3_print2.hs

`do` is used to list sequence of actions. `do` makes the code readable

### String concatenation

* top level definition can be used through out the module
* it is good habit to put the type signature of top level definition
* string concatenation is done using `++` operator
* `concat` function is used to combine list of string
