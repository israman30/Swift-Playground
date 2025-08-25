//: [Previous](@previous)

import Foundation

let alphabet = ["A", "B", "C", "D", "E"]

var result = ""

@MainActor
func createPairs(array: [String]) {
  var char = array.first!
  array.forEach {
    print(char: $0)
  }
}

@MainActor
func print(char: String) {
  alphabet.forEach {
    result = char + $0

    
    print(result)
  }
}
createPairs(array: alphabet)
