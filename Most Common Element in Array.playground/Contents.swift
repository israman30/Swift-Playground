import UIKit

var array = [1, 2, 2, 3, 2, 4]

func mostCommonElement(of array: [Int]) -> Int {
    var dict = [Int:Int]()
    array.forEach {
        if let count = dict[$0] {
            dict[$0] = count + 1
        } else {
            dict[$0] = 1
        }
    }
    print(dict) /// dictionary [keys : values]
    for (_ , value) in dict where value == dict.values.max() { /// iterate in the dict where value is max()
        return value
    }
    return -1
}

mostCommonElement(of: array)

/// Most Common found looping in the array and checking in the dictionary for max() value
func mostCommonElement2(of array: [Int]) -> (value: Int, count: Int) {
    var dict = [Int:Int]()
    array.forEach { dict[$0] = (dict[$0] ?? 0) + 1 }
    
    if let (value, count) = dict.max(by: {$0.1 < $1.1}) {
        print("\(value) occurs \(count) times")
        return (count, value)
    }
    return (0, 0)
}
mostCommonElement2(of: array)

/// Most Common usinge reduce in the dictionary and checking for the max() value
func mosCommon3(of array: [Int]) -> (value: Int, count: Int) {
    let dict = array.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    if let (value, count) = dict.max(by: {$0.1 < $1.1}) {
        print("\(value) occurs \(count) times")
        return (count, value)
    }
    return (0, 0)
}

mosCommon3(of: array)
