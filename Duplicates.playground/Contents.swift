import UIKit

/*

Remove duplicates while preserving order

Given [3, 1, 3, 2, 1, 4], return [3, 1, 2, 4].

*/

func removeDuplicates(_ array: [Int]) -> [Int] {
    var seen = Set<Int>() // Set keep insert non repeated elements
    return array.filter { seen.insert($0).inserted } // filter array, add element and check if it was inserted -> return inserted elements
}

/*

Find the first non-repeating character in a string

Given "swiss", return "w" (first char that appears exactly once).

*/
func firstNonRepeatedElement(_ string: String) -> Character? {
    var dict = [Character:Int]()
    // Build the count of the ocurrences
    for char in string {
        dict[char, default: 0] += 1
    }
    // Look for the first element that does not repeat count 1 -> return it
    for char in string {
        if dict[char] == 1 {
            return char
        }
    }
    return nil
}
if let nonRepeatedElement = firstNonRepeatedElement("swiss") {
    print(nonRepeatedElement)
} else {
    print("There is not non-repeated element in the string.")
}
