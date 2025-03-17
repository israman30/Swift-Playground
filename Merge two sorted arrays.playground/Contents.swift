import UIKit

func mergeTwoSortedArrays(_ firstArray: [Int], _ secondArray: [Int]) -> [Int] {
    return Array(Set(firstArray).union(Set(secondArray))).sorted()
}

func mergeTwoSortedArray(_ firstArray: [Int], _ secondArray: [Int]) -> [Int] {
    var meregedArray = [Int]()
    var firstIndex = 0
    var secondIndex = 0
    while firstIndex < firstArray.count && secondIndex < secondArray.count {
        if firstArray[firstIndex] < secondArray[secondIndex] {
            meregedArray.append(firstArray[firstIndex])
            firstIndex += 1
        } else {
            meregedArray.append(secondArray[secondIndex])
            secondIndex += 1
        }
    }
    
    while firstIndex < firstArray.count {
        meregedArray.append(firstArray[firstIndex])
        firstIndex += 1
    }
    
    while secondIndex < secondArray.count {
        meregedArray.append(secondArray[secondIndex])
        secondIndex += 1
    }
    
    return meregedArray
}
