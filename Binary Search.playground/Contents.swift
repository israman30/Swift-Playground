import UIKit

let numbers = [11, 59, 3, 2, 53, 17, 31, 7, 19, 67, 47, 13, 37, 61, 29, 43, 5, 41, 23]

// Linear Search
func linearSearch<T: Equatable>(on array: [T], key: T) -> Bool {
    for i in array {
        if i == key {
            return true
        }
    }
    return false
}
//linearSearch(on: numbers, key: 3)

func binarySearchDividing<T: Comparable>(on array: [T], key: T) -> Bool {
    guard !array.isEmpty else { return false }
    
    var left = 0
    var right = array.count - 1
    
    while left <= right {
        var midIndex = (left + right) / 2
        let mid = array[midIndex]
        if mid == key {
            return true
        } else if mid < key {
            left = midIndex + 1
        } else if mid > key {
            right = midIndex - 1
        }
    }
    return false
}

// [2, 3, 4, 5, 6]
func binarySearchRecursive(on array: [Int], key: Int) -> Bool {
    guard !array.isEmpty else { return false }
    var left = 0
    var right = array.count - 1
    let mid = (left + right) / 2
    
    if key < array[left] || key > array[right] {
        return false
    }
    if key == array[mid] {
        return true
    }
    if key > array[mid] {
        let slice = Array(array[mid + 1...right])
        return binarySearchRecursive(on: slice, key: key)
    } else {
        let slice = Array(array[left]...array[mid] - 1)
        return binarySearchRecursive(on: slice, key: key)
    }
}


//binarySearchDividing(on: [2, 3, 4, 5, 6, 10, 12, 21, 30, 40], key: 30)
binarySearchRecursive(on: [2, 3, 4, 5, 6, 10, 12, 21, 30, 40], key: 3)

func binarySearchWithRange(on array: [Int], key: Int, range: Range<Int>) -> Bool {
    if range.lowerBound >= range.upperBound {
        return false
    }
    let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
    if array[midIndex]  > key {
        return binarySearchWithRange(on: array, key: key, range: range.lowerBound..<midIndex)
    } else {
        return binarySearchWithRange(on: array, key: key, range: midIndex + 1..<range.upperBound)
    }
}

binarySearchWithRange(on: numbers, key: 3, range: 0..<numbers.count)
