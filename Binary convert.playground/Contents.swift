import UIKit

/**
 Given two binary strings a and b, return their sum as a binary string.

 Input: a = "11", b = "1"
 Output: "100"

 Input: a = "1010", b = "1011"
 Output: "10101"
 */

func addBinary(_ a: String, _ b: String) -> String {
    guard let aInt = Int(a, radix: 2), let bInt = Int(b, radix: 2) else {
        return "0"
    }
    let sum = aInt + bInt
    return String(sum, radix: 2)
}
addBinary("11", "1")
