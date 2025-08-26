//: [Previous](@previous)

import Foundation

let words = ["main", "moon", "mouse", "house", "map"]

func search(_ array: String) -> [String] {
    return words.filter { $0.hasPrefix("m") }
}
print(search("ma"))
