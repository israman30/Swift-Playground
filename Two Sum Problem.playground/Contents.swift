import UIKit

/*
 Having a number "x" find the tow number that adding each other gives "x"
 */

func sumOfTwo(arr: [Int], target: Int) -> (Int, Int) {
    var dict = [Int:Int]()
    for (index, number) in arr.enumerated() {
        let complement = target - number
        print(complement)
        print("checking:", dict)
        // check if complemet exist in dictionary
        if let complementIndex = dict[complement] {
            print("found:", complementIndex)
            return (complementIndex, index)
        }
        // store number and its index into dictionary
        dict[number] = index
        print("-->", dict)
    }
    return (0,0)
}

sumOfTwo(arr: [1, 2, 3], target: 5)
/*
 1st loop ...........
 5 - 1 = 4
 4 exist -> dict [:] pass
 dict [1:0]
 2nd loop ...........
 5 - 2 = 3
 3exist -> dict [1:0] pass
 dict [1:0, 2:1]
 3rd loop ...........
 5 - 3 = 2
 2 exits -> dict [1:0, 2:1] return
 */

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
//sumOfTwoWithPointers(arr: [1, 2, 3], target: 5)

/*
 1st loop ...........
 1 + 3 = 4
 5 != 4 pass && 4 < 5
 1 += 1
 2nd loop ...........
 2 + 3 = 5
 5 == 5 return
 */

func twoSum(_ nums: [Int], _ target: Int) -> Bool {
    var seen = Set<Int>()
    for num in nums {
        if seen.contains(target - num) {
            return true
        }
        seen.insert(num)
    }
    return false
}
/*
 [1, 2, 3]
 target: 5
 
 1st loop .......
 seen contain = 5 - 1 = 4 <= false
 seen.insert(1)
 
 2nd loop .......
 seen [1]
 seen contain 5 - 2 = 3 <= false
 seen.insert(2)
 
 3rd loop .......
 seen [1, 2]
 seen contain 5 - 3 = 2 <= true
 */
