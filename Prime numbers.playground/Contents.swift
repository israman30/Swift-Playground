import UIKit

func findPrimeNumber(_ number: Int) -> [Int] {
    var primeNumbers = [Int]()
    if number < 2 {
        return primeNumbers
    }
    for num in 2...number {
        var isPrime = true
        for i in 2..<num {
            if num % i == 0 {
                isPrime = false
                break
            }
        }
        if isPrime {
            primeNumbers.append(num)
        }
    }
    return primeNumbers
}
