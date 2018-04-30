# Swift-Playground
##### by
#### Israel Manzo

*Apple Developer source*  [Swift 4](https://developer.apple.com/swift/)


![alt text](img/swift.png)

<p align="center">
<img width="195" height="195" src="img/swift.png">
</p>

This repository will review strings, integers, duobles, booleans, functions, classes and more swift properties and methods.
Este repository revisa propiedades, metodos, funciones y variables en el lenguage the programacion swift.

## Variables
> Variable is a value that can change, depending on conditions or on information passed to the program.
> > Variable is un valor que cambia, dependiendo de condiciones o informacion pasada al programa.

> Variables are mutable
> > Variables pueden ser alteradas

> Constants are not mutables
> > Constantes no pueden ser cambiadas, alteradas o mutadas

### String
> In computer programming, a string is traditionally a sequence of characters, either as a literal constant or as some kind of variable.
> > En lenguaje the programacion, un string es tradicionalmente una sequencia de caracteres, en una variable o en una constante.

#### Example:

```swift
var letra = "A" 
let palabra = "Me" 
var stringWord:String = "Buenos Dias"

var word = "a"
var sentence = "Hello, how are you today?"
var paragraph = "This is a test to create an paragraph to demostrate a string. Esta linea es para aprender que 
```

### Integers
> Int is a fundamental type built into the compiler and used to define numeric variables holding whole numbers.
> > Integer es un tipo fundamental construido en el compailer y usado para definir variables numericas, soportado por numeros.

#### Example:
```swift
var number = 2
var integer = 120
```

## Doubles
> Double is a fundamental type built into the compiler and used to define numeric variables holding numbers with decimal points, which accommodate fractions.
> > Dobles es un tipo fundamental construido en el compailer y usado para definir variables numericas que contienen decimales, la cual acomoda fracciones.

#### Example:
```swift
var double = 0.1123
var other = 0.5
```
## Boolean
> In computer science, the Boolean data type is a data type, having two values (usually denoted true and false), intended to represent the truth values of logic and Boolean algebra.
> > En ciencias de computacion, los tipo boolean es tipo de datos, tienen dos valores (usualmente denotados como verdadero o falso), intentando representar el verdadero valor de la logica algebraica.

#### Example:
```swift
var a = 2
var b = 3

// a is not equal to b
a == b <- False

let day = "Monday"
let firstDay = "Monday"

// day is equal to firstDay
day == firstDay <- True
```

## Arrays
> In computer science, array programming languages (also known as vector or multidimensional languages) generalize operations on scalars to apply transparently to vectors, matrices, and higher-dimensional arrays.
> > En ciencias de computacion, programa de lenguaje array (tambien conocido como vector o multidimensional lenguaje) generaliza operaciones para aplicar transparencia a vectores, matrices y altas dimensiones de colleccion.

#### Example:
```swift
// String array
var words = ["Hello", "World", "Hola"]

// Int Array
var numbers = [1, 2, 3, 4, 5]

// Double Array
var doubles = [0.1, 0.2, 0.3, 0.4, 0.5]

```

## Conditional "if" statement

> Use if to specify a block of code to be executed, if a specified condition is true. Use else to specify a block of code to be executed, if the same condition is false. Use else if to specify a new condition to test, if the first condition is false.
> > Se usa if especificamente en block de codigo a ser executado, si la condicion es verdadera. Se usa tambien para saber si la condicion es falsa. 

#### Example:
```swift
if "John" == "Johnny" {
    
    print("The are the same guy")
    
} else {
    
    print("The are not the same guy")
    
}
```

## For in loop
> You use the for-in loop to iterate over a sequence, such as items in an array, ranges of numbers, or characters in a string.
> > Se usa el for-in loop para iterar/numerar sobre una sequencia, una collection/array, rango de numeros, o caracteres de un string.

#### Example:
```swift
for number in [1,2,3,4,5] {
    print(number) // this will print each number in the array
}


// We give the array a container
// Ponemos el array de numeros in a container

let numbers = [4,3,5,12,67]

for i in numbers {
    print(i)
}

```
## Closures

> Closures are self-contained blocks of functionality that can be passed around and used in your code. Closures in Swift are similar to blocks in C and Objective-C and to lambdas in other programming languages.

> Closures can capture and store references to any constants and variables from the context in which they are defined. This is known as closing over those constants and variables. Swift handles all of the memory management of capturing for you.

[Closures documentation](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Closures.html)

```swift
// The way a function gets called
func helloWorld(word: String) -> String {
    return "Function call -> \(word)"
}


// Function with complition handler
func helloWorldWithCompletionHandler(word: String, completionHandler: (_ name: String)-> Void){
    let myName = word + " " + "World"
    completionHandler(myName)
}

helloWorldWithCompletionHandler(word: "Hello") { (e) in
    print("Function with completion handler call -> \(e)")
}


// Closure procedure
let closureHelloWorld = {(word: String) -> String in
    return "Closure call -> \(word)"
}


```

>> A trailing closure is written after the function call's parentheses, even though it is still an argument to the function. When you use the trailing closure syntax, you don't write the argument label for the closure as part of the function call.

[Closures documentation](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Closures.html)

```swift
// Trailing closure sample
func functionWithClosure(name: String, completionHandler:(_ data: String, _ response: String, _ error: String)->()){
    completionHandler("data", "response", "error")
}

// Trailing closure calls
functionWithClosure(name: "Hello World") { (data, response, error) in
    print(data, response, error)
}

// print should be: "data", "response", "error"

functionWithClosure(name: "Hello World", completionHandler: {
    print("$0: \($0), $1: \($1), $2: \($2)")
})

// print should be: "$0: data, $1: response, $2: error"

```
