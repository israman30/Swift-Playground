//: Playground - noun: a place where people can play

import UIKit

// Fizz Buzz
// Number divisible by 3 print Fizz
// Number divisible by 5 print Buzz
// Numbers divisibles by 3 & 5 print Fizz Buzz

func fizzBuzz(number: Int) -> Int {
    
    for i in 1...number {
        
        if i % 3 == 0 && i % 5 == 0 {
            print("Fizz Buzz")
        } else if i % 3 == 0 {
            print("Fizz")
        } else if i % 5 == 0 {
            print("Buzz")
        } else {
            print(i)
        }
    }
    return number
}
fizzBuzz(number: 10)





// Adding three arrays
// Entering three arrays and return as one sorted array
func threeArrays(a: [Int], b: [Int], c: [Int]) -> [Int] {
    
    let result = a + b + c
    
    return result.sorted()
}
threeArrays(a: [5,4,3], b: [0,1,-2], c: [19,4, -1])






// Factorial
// 1! = 1
// 2! = 1 * 2 = 2
// 3! = 1 * 2 * 3 = 6
// 4! = 1 * 2 * 3 * 4 = 24
// 5! = 1 * 2 * 3 * 4 * 5 = 120
func factorialValue(value: UInt) -> UInt {
    
    if value == 0 {
        return 1
    }
    
    var product: UInt = 1
    for i in 1...value {
        product = product * i
    }
    return product
}
factorialValue(value: 5)

// Recursive factorial
func recursiveFactorial(_ value: UInt) -> UInt{
    
    if value == 0 {
        return 1
    }
    return value * recursiveFactorial(value - 1)
}
recursiveFactorial(5)
