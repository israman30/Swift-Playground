//: [Previous](@previous)

import Foundation

var numbers = [3, 1, 5, 7, 2, 9, 0, 4, 6, 8]

// Sorted
/**
 Sorted by could use the closure as
 ```
 .sorted { $0 < $1 }
 .sorted {
    return $0 < $1
 }
 .sorted { a, b in
    a < b
 }
 ```
 */
let sorteNumbers = numbers.sorted()
/**
 Sorted by could use the closure as
 ```
 .sorted(by: $0 < $1)
 .sorted(by: {
    return $0 < $1
 })
 ```
 */
let sortedByNumbers = numbers.sorted(by: <)
print(sorteNumbers)
print("Sorted by: \(sortedByNumbers)")

/**
 `Map
 Mapping is similar to sort in that it iterates through the array that is calling it, but instead of sorting it changes each element of the array based on the closure passed to the method.
 
 ```
 let element = numbers.map( transform: (Int) throws -> T)
 ```
 Notice that the return of the closure is a T. Since an array is a generic type and we are returning a new array, we can return an array with a type different than the starting array (if we so choose). Lets convert our numbers into strings.
 */
let numbersAsString = numbers.map { char in
    String(char)
}
/**
 Also can be wriiten as
 ```
 let numbersAsString = numbers.map { String($0) }
 ```
 */
print("Mapping to string: \(numbersAsString)")

/**
 `Filter
 the filter method will return an array that has only elements that pass your filter specified in your closure.
 
 ```
 let elements = numbers.filter( isIncluded: (Int) throws -> Bool)
 ```
 */
let numbersLessThanFive = numbers.filter { $0 < 5 }
print("Filtering less than five: \(numbersLessThanFive)")

/**
 `Reduce
 The reduce function allows you to combine all the elements in an array and return an object of any type (generics!!!!)
 ```
 let element = numbers.reduce(initialResult: Result, nextPartialResult: (Result, Int) throws -> Result)
 ```
 Notice that reduce has two parameters — initialResult and nextPartialResult. We need the initial result to tell us where to start, and the method then operates on that result based on the logic in the closure.

 */
let sumAllNumbers = numbers.reduce(0, +)
print("Sum all elements: \(sumAllNumbers)")

let sumAllNumberToString = numbers.reduce("") { result, number in
    result + String(number)
}
print("Sum all elements to string: \(sumAllNumberToString)")

/**
 `Flattening Nested Arrays
 Suppose you have an array of arrays, and you want to flatten them into a single array. Here’s how you can use flatMap to achieve this:
 ```
 twoDimensionalArray.flatMap(transform: ([Int]) throws -> Sequence)
 ```
 */
let twoDimensionalArray = [[1, 2], [3, 4], [5, 6]]

let flattedArray = twoDimensionalArray.flatMap { $0 }
print("Flatted array: \(flattedArray)")

/**
 `compactMap:
 Similar to map, but it transforms elements and automatically discards any nil results.
 ```
 optionalValues.compactMap(transform: (Int?) throws -> ElementOfResult?)
 ```
 */
let optionalValues: [Int?] = [1, 2, nil, 3, nil, 4]

let compactedValues: [Int] = optionalValues.compactMap { $0 }
print("Compacted values: \(compactedValues)")


/**
 `Sample of using nested functions
 */
let modifiedArray = twoDimensionalArray.flatMap { subArray in
    return subArray.compactMap { element in
        numbers.contains(element) ? element : nil
    }
}
/**
 In this case, flatMap applies the transformation and filtering operations to each element within the nested arrays, and the result is a single flattened array with the modified values.
 */
print("Modified array: \(modifiedArray)")

/// `Chaining functions`
let result = numbers
    .filter { $0 % 2 == 0 } // Keep only even numbers
    .map { $0 * $0 } // Square each remaining number
    
print("Chainning functions: \(result)")

// FizzBuzz
let fizzBuzz: [String] = (1...100).map { n in
    if n % 15 == 0 {
        return "Fizz Buzz"
    } else if n % 3 == 0 {
        return "Fizz"
    } else if n % 5 == 0 {
        return "Buzz"
    } else {
        return String(n)
    }
}
print(fizzBuzz)

// Reverse string
var word = "Hello World"

func reverseString(_ input: inout String) -> String {
    var input = Array(input)
    (0..<input.count / 2).forEach {
        input.swapAt($0, input.count - $0 - 1)
    }
    return input.map(String.init).joined()
}
reverseString(&word)
