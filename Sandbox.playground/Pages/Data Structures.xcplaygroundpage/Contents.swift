//: [Previous](@previous)

import Foundation

// String
var stringWord = "This is an string"

// Integer
var integerNumber: Int = 10

// Float
var floatNumber: Float = 10.5

// Double
var doubleNumber: Double = 10.55

// Boolean
var booleanValue: Bool = true

// Collections

// Set
var setVariable: Set<String> = ["apple", "banana", "orange"]

// Array
var arrayVariable: [String] = ["apple", "banana", "orange"]

// Dictionary
var dictionaryVariable: [String: Int] = ["apple": 2, "banana": 5, "orange": 4]

// Dimensional array
var dimesinalArray: [[Int]] = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

// Stack
/**
-> A last
-> B
-> C first
 */
struct Stack<T> {
    var stack: [T] = []
    
    mutating func push(_ element: T) {
        stack.append(element)
    }
    
    mutating func pop() -> T? {
        stack.popLast()
    }
    
     var isEmpty: Bool {
        stack.isEmpty
    }
    
    var count: Int {
        stack.count
    }
}
// Queue
/**
 -> C -> B -> A
 */
struct Queue<T> {
    var queue: [T] = []
    
    mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    mutating func dequeue() -> T? {
        queue.removeFirst()
    }
    
    var isEmpty: Bool {
        queue.isEmpty
    }
    
    var count: Int {
        queue.count
    }
}
