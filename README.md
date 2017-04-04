# simple-calc

This is a simple command line program that can calculate the answer of two numbers with the +, -, *, /, and % operators, the factorial of a single number, as well as the count and average of an arbitrarily large set of numbers.

# Using simple-calc

### In the terminal without arguments
While inside of the directory containing main.swift, enter 

`$ ./main.swift`

or 

`$ swift main.swift`

The program will prompt the user to enter an expression separated by returns

This would mean typing in a number, pressing return, and then typing more numbers or an operator to calculate

#### Using +, -, /, *, %

These operators may only be used in between two numbers 

```
$ 99
$ +
$ -.3943
```

#### Using factorials

This may only be used after a number

```
$ 9
$ fact
```

#### Using count and average

This may only be used after entering a non-empty sequence of numbers

```
$ 0.39
$ -23.8
$ .49
$ 34
$ 99
$ avg
```




### Using arguments with simple-calc

The operator must be the first argument

If using the +, -, *, /, or % operators, there must be two numbers following the operator

```
$ ./main.swift + 4 -2.39
$ ./main.swift % -49.8 -3.98
```

If using the factorial operator, there must be one number following the operator

```
$ ./main.swift fact 13
```

If using the count or average operator, there must be a non-empty sequence of numbers following the operator
 
```
$ ./main.swift avg 99 99 99 99 -99 49 3 3.49
$ ./main.swift count 99 99 99 99 -99 49 3 3.49
```
