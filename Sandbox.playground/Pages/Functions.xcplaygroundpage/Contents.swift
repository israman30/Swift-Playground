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
