import UIKit

/**
 Input: J = "aA", S = "aAAbbbb"
 Output = 3
 
 Input: J = "z", S = "ZZ"
 Output = 0
 */

func jewels(_ jewels: String, _ stones: String) -> Int {
    guard !stones.isEmpty else { return 0 } // stones are empty is nothing to check
    var count = 0 // counter keep track of jewels in stones
    stones.forEach {
        let char = String($0)
        if jewels.contains(char) {
            count += 1
        }
    }
    return count
}
jewels("aA", "aAAbbbb")
