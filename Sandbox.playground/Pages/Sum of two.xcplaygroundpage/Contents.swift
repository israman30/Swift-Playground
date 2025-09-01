//: [Previous](@previous)

import Foundation

var arrray = [1, 2, 3, 4, 5]

func sumOfTwo(_ array: [Int], target: Int) -> Bool {
    var dict = [Int:Int]()
    for (index, number) in array.enumerated() {
        let complement = target - number
        if let complementIndex = dict[complement] {
            return true
        }
        dict[number] = index
    }
    return false
}

sumOfTwo(arrray, target: 7)
