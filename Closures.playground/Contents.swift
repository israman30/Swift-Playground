//: Playground - noun: a place where people can play

import UIKit

/*
 Closures are self-contained blocks of functionality that can be passed around and used in your code. Closures in Swift are similar to blocks in C and Objective-C and to lambdas in other programming languages.
 
 Closures can capture and store references to any constants and variables from the context in which they are defined. This is known as closing over those constants and variables. Swift handles all of the memory management of capturing for you.
 
 source: https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Closures.html
 */

/* Closure Expression Syntax
    Closure expression syntax has the following general form:

    { (parameters) -> return type in
        statements
    }
*/

// The way a function gets called
func helloWorld(word: String) -> String {
    return "Function call -> \(word)"
}

print(helloWorld(word: "Hello World"))

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

print(closureHelloWorld("Hello World"))

// Trailing closure
/*
 A trailing closure is written after the function call's parentheses, even though it is still an argument to the function. When you use the trailing closure syntax, you don't write the argument label for the closure as part of the function call.
 source: https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Closures.html
 */
func functionWithClosure(name: String, completionHandler:(_ data: String, _ response: String, _ error: String)->()){
    completionHandler("data", "response", "error")
}

functionWithClosure(name: "Hello World") { (data, response, error) in
    print(data, response, error)
}

functionWithClosure(name: "Hello World", completionHandler: {
    print("$0: \($0), $1: \($1), $2: \($2)")
})

// Calculator closure

func calculator(a: Int, b: Int, operation: (Int, Int)-> Int)->Int {
    return operation(a, b)
}

calculator(a: 3, b: 2) { (a, b) -> Int in
    a * b
}

// We can pass a function into the closure
func add(a: Int, b: Int)-> Int {
    return a * b
}

calculator(a: 3, b: 2, operation: add)

// Anonimus parameters $0, $1
// we take the sample from line 61
let result = calculator(a: 2, b: 3 ){ $0 * $1 }

let array = [1,2,3,4,5]

// Closure map allows to transform teh array
// We add one to each value of the array
array.map { (a) in
    a + 1
}

// Using anonimus parameters
array.map { $0 + 1 }

// Converting the values of type integer into type string
let stringArray = array.map {"\($0)"}
print(stringArray) // Output -> ["1", "2", "3", "4", "5"]





