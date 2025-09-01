//: [Previous](@previous)

import Foundation

var words = ["a", "b", "c", "b", "d"]

func removeDuplicates(_ words: inout [String]) -> [String] {
    var uniqueWords: Set<String> = []
    var result: [String] = []
    
    for word in words {
        if !uniqueWords.contains(word) {
            uniqueWords.insert(word)
            result.append(word)
        }
    }
    return result
}

func duplicates(_ words: [String]) -> [String] {
    var uniqueWords: Set<String> = []
    var result: [String] = []
    
    for word in words {
        if uniqueWords.contains(word) {
            result.append(word)
        } else {
            uniqueWords.insert(word)
        }
    }
    return result
}

func hasDuplicates(_ words: [String]) -> Bool {
    var uniqueWords: Set<String> = []

    for word in words {
        if uniqueWords.contains(word) {
            return true
        } else {
            uniqueWords.insert(word)
        }
    }
    return false
}

func duplicateDictionary(_ words: [String]) -> Bool {
    var dict = [String: Int]()
    for word in words {
        if dict[word] != nil {
            return true
        }
        dict[word] = 1
    }
    return false
}
print(duplicateDictionary(words))
