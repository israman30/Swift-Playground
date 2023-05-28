import UIKit

var zeros = [0, 2, 3, 0, 4]
var emtpy: [Int] = []

// Give the the count of how many zero in the list
func zeroCount(arr: [Int]) -> Int {
    var count = 0
    arr.forEach {
        if $0 == 0 {
            count += 1
        }
    }
    return count
}
zeroCount(arr: zeros)

// Moving zeros to the end of the list using containers
func moveZeroToEnd(arr: [Int]) -> [Int] {
    var front = [Int]()
    var end = [Int]()
    arr.forEach {
        $0 != 0 ? (front.append($0)) : (end.append($0))
    }
    return front + end
}

//moveZeroToEnd(arr: zeros)

// Move the zero to the from or end of the list
func moveZeroToFront(arr: inout [Int]) -> [Int] {
    return arr.filter { $0 == 0 } + arr.filter { $0 != 0}
}
moveZeroToFront(arr: &emtpy)

// Move the zeros using for loop
func moveZeros(arr: inout [Int]) -> [Int] {
    var zero = 0
    for i in 0..<arr.count {
        if arr[i] == 0 {
            arr.swapAt(i, zero)
            zero += 1
        }
    }
    return arr
}
moveZeros(arr: &emtpy)

func keepOnZero(arr: inout [Int]) -> [Int] {
    var newArr: [Int] = []
    for i in arr {
        if i != i + 1 {
            newArr.append(i)
        }
    }
    return newArr
}
keepOnZero(arr: &zeros)

func viewToSubview(node: UIView, target: UIView) -> Bool {
    if node.subviews.count == 0 {
        return node == target
    }
    for view in 0..<node.subviews.count {
        let subView = node.subviews[view]
        if subView == target {
            return true
        }
        if subView.contains(target) {
            return true
        }
    }
    return false
}


