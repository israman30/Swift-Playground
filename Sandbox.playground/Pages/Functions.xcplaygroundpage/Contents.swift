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
print("Mapping to string: \(numbersAsString)")
