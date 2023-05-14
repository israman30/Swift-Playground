import UIKit

// Sum all Elements in an Array
extension Array where Element: AdditiveArithmetic {
    func sum() -> Element {
        reduce(.zero, +)
    }
}

// Remove duplicate elments in an Array of Int
extension Array where Element == Int {
    func removeDuplicateElements() -> [Element] {
        var newArray = [Element]()
        for element in self where !newArray.contains(element) {
            newArray.append(element)
        }
        return newArray
    }
}

// Remove duplicate characters in an Array Generic
extension Array where Element: Equatable {
    mutating func removeDuplicateCharacters() {
        var newArray = [Element]()
        for element in self where !newArray.contains(element) {
            newArray.append(element)
        }
        self = newArray
    }
}

var numbers = [1, 2, 3]
var commonsElements = [1, 2, 3, 2, 2]
var commonsCharacters = ["a", "b", "a", "c", "b"]

commonsElements.removeDuplicateElements()
commonsCharacters.removeDuplicateCharacters()

numbers.sum()
