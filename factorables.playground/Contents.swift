import UIKit

// factorial
func factorial(_ n: Int) -> Int {
    return (1...n).reduce(1, *)
}

// Recursive factorial
func factorialRecursive(_ n: Int) -> Int {
    if n == 0 { return 0 }
    return n * factorialRecursive(n - 1)
}

// factorable numbers
/*
 1 -> 1
 3 -> 1, 2
 4 -> 1, 2, 4
 5 -> 1, 5
 6 -> 1, 2, 3, 6
 */
func factorable(_ n: Int) -> [Int] {
    guard n > 0 else { return [] }
    var factors: [Int] = []
    for i in 1...n {
        if n % i == 0 {
            factors.append(i)
        }
    }
    return factors
}

// isFactorable: Check if a number is factorable
/*
 4 -> true  (factorable)
 3 -> false (factorable by it self)
 */
func isFactorable(_ n: Int) -> Bool {
    guard n > 1 else { return false }
    return factorable(n).count > 2
}
