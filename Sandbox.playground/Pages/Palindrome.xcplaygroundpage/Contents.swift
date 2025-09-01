//: [Previous](@previous)

import Foundation

var word = ["hannah"]

func palindromeChecker(_ word: String) -> Bool {
    var words = Array(word)
    for char in 0..<words.count/2 {
        if words[char] == words[words.count - char - 1] {
            return true
        }
    }
    return false
}
