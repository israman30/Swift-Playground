import UIKit

var numbers = [0, 1, 2, 3]

// Reversing a list using two pointers in each end of the list
func reversing(arr: inout [Int]) -> [Int] {
    var first = 0
    var last = arr.count - 1
    while first < last {
        arr.swapAt(first, last)
        first += 1
        last -= 1
    }
    return arr
}

//reversing(arr: &numbers)

// Reversing a list diving the array 
func reversingDividing(arr: inout [Int]) -> [Int] {
    for i in 0..<arr.count / 2 {
        arr.swapAt(i, arr.count - 1 - i)
    }
    return arr
}

reversingDividing(arr: &numbers)
