import UIKit

var array = [1, 2, 2, 3, 2,4]

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

