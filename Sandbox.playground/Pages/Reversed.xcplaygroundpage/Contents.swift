import UIKit

var array: [Int] = [1, 2, 3, 4, 5]
var words = ["a", "b", "c", "d"]

func reverse<T: Comparable>(_ array: inout [T]) -> [T] {
    for element in 0..<array.count / 2 {
        array.swapAt(element, array.count - 1 - element)
    }
    return array
}

reverse(&array)
reverse(&words)


