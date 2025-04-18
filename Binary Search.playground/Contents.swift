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


// Search in an unsorted array
func search(_ nums: [Int], _ target: Int) -> Int {
    if nums.contains(target) {
        guard let index = nums.index(of: target) else { return 0 }
        return index
    }
    return -1
}

// Search for first and last index of a given number
func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    var first = -1
    var last = -1
    var result = [Int]()
    for i in 0..<nums.count {
        if nums[i] == target && first == -1 {
            first = i
        }
        if nums[nums.count - 1 - i] == target && last == -1 {
            last = nums.count - 1 - i
        }
    }
    return [first, last]
}

// Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var first = 0
    var last = nums.count - 1
    while first <= last {
        let mid = (first + last) / 2
        if nums[mid] == target {
            return mid
        }
        if nums[mid] < target {
            first = mid + 1
        } else {
            last = mid - 1
        }
    }
    return first
}
