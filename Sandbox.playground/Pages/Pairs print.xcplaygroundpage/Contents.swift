//: [Previous](@previous)

import Foundation

let alphabet = ["A", "B", "C", "D", "E"]

@MainActor
func createPairs(array: [String]) {
    array.forEach {
        print(char: $0)
    }
}

@MainActor
func print(char: String) {
    var result = ""
    alphabet.forEach {
        result = char + $0
        print(result)
    }
}
createPairs(array: alphabet)

