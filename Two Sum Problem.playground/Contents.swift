import UIKit

/*
 Having a number "x" find the tow number that adding each other gives "x"
 */

func sumOfTwo(arr: [Int], target: Int) -> (Int, Int) {
    var dict = [Int:Int]()
    for (index, number) in arr.enumerated() {
        let complement = target - number
        print(complement)
        // check if complemet exist in dictionary
        if let complementIndex = dict[complement] {
            return (complementIndex, index)
        }
        // store number and its index into dictionary
        dict[number] = index
    }
    return (0,0)
}

//sumOfTwo(arr: [1, 2, 3], target: 5)

func sumOfTwoWithPointers(arr: [Int], target: Int) -> (Int, Int) {
    var first = 0
    var last = arr.count - 1
    while first < last {
        let sum = arr[first] + arr[last]
        if target == sum {
            return (first, last)
        } else if sum < target {
            first += 1
        } else {
            last -= 1
        }
    }
    return (0, 0)
}
sumOfTwoWithPointers(arr: [1, 2, 3], target: 5)
