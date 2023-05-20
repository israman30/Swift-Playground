import UIKit


var array = [2, 3, 41, 0, 20, 4, 5, -1]

func insertSort(on array: [Int]) -> [Int] {
    var arr = array
    for i in 0..<arr.count {
        var j = i
        while j > 0 && arr[j] < arr[j - 1] {
            arr.swapAt(j - 1, j)
            j -= 1
        }
    }
    return arr
}

//insertSort(on: array)

func insertionSort(on array: [Int]) -> [Int] {
    var arr = array
    for i in 0..<arr.count {
        var j = i
        let temp = arr[j]
        while j > 0 && temp < arr[j - 1] {
            arr[j] = arr[j - 1]
            j -= 1
        }
        arr[j] = temp
    }
    return arr
}
//insertionSort(on: array)


// Quick Sort
func quickSort(on array: inout [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    
    let pivot = array[array.count / 2]
    print(pivot)
    var less = array.filter { $0 < pivot }
    let equal = array.filter { $0 == pivot }
    var greater = array.filter { $0 > pivot }
    
    return quickSort(on: &less) + equal + quickSort(on: &greater)
}
//quickSort(on: &array)


/*
 Merge Sort
 Source by Thomas Hanning
 https://www.thomashanning.com/merge-sort-in-swift/
 */

func merge(left: [Int], right: [Int]) -> [Int] {
    var mergedList: [Int] = []
    var left = left
    var right = right
    while left.count > 0 && right.count > 0 {
        if left.first! < right.first! {
            mergedList.append(left.removeFirst())
        } else {
            mergedList.append(right.removeFirst())
        }
    }
    return mergedList + left + right
}

func mergeSort(on array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    let leftList = Array(array[0..<array.count / 2])
    let rightList = Array(array[array.count / 2..<array.count])
    return merge(left: mergeSort(on: leftList), right: mergeSort(on: rightList))
}
mergeSort(on: array)
