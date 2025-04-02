import UIKit

var nums = [3,2,2,3]

// Removing duplicates from array and returning the number of ocurrences
func removeDuplicates(_ nums: inout [Int]) -> Int {
    var index = 0
    for i in 0..<nums.count {
        if nums[index] != nums[i] {
            index += 1
            nums[index] = nums[i]
        }
    }
    return index + 1
}

// Removing duplicates from array given a value to be removed
func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var index = 0
    for i in 0..<nums.count {
        if nums[i] != val {
            nums[index] = nums[i]
            index += 1
        }
    }
    return index
}

print(removeElement(&nums, 3))
