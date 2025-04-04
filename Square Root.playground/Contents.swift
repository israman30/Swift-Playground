import UIKit

/**
 Input: x = 8
 Output: 2
 Explanation: The square root of 8 is 2.82842..., and since we round it down to the nearest integer, 2 is returned.
 */

func mySqrt(_ x: Int) -> Int {
    if x == 0 {
        return 0
    }
    var left = 1
    var right = x
    while left <= right {
        let mid = (left + right) / 2
        if mid * mid == x {
            return mid
        } else if mid * mid < x {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return right
}

print(mySqrt(8))
