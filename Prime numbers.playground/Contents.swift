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

// Simple solution
func isPrime(_ num: Int) -> Bool {
    guard num <= 2 else { return false }
    return !(0..<num).contains { $0 % num == 0 }
}

// input range -> lower and upper bound
func isPrime(from: Int, to: Int) -> Int {
    var sumOfPrimeNumbers = 0
    for num in from...to {
        if isPrime(num) {
            sumOfPrimeNumbers += num
        }
    }
    return sumOfPrimeNumbers
}

// input an array
func primeSum(_ nums: [Int]) -> Int {
    var sumOfPrimeNumbers = 0
    for num in nums {
        if isPrime(num) {
            sumOfPrimeNumbers += num
        }
    }
    return sumOfPrimeNumbers
}
