import UIKit

/*
 Find the palindrome of words and integers
 */

// Palindrome using two pointer at the start and at the end of the list
func palindromeWithPointers(_ word: String) -> Bool {
    var word = Array(word)
    var first = 0
    var last = word.count - 1
    while first < last {
        if word[first] == word[last] {
            return true
        }
        first += 1
        last -= 1
    }
    return false
}

// Palindrome dividing the list and comparing the elements
func palindrome(_ word: String) -> Bool {
    var word = Array(word)
    for char in 0..<word.count / 2 {
        if word[char] == word[word.count - 1 - char] {
            return true
        }
    }
    return false
}

// Palindrome of Ingeter
func palindromeInt(_ number: Int) -> Bool {
    var str = String(number)
    var word = Array(str)
    if str.count == 1 {
        return true
    }
    for char in 0..<word.count / 2 {
        if word[char] == word[str.count - 1 - char] {
            return true
        }
    }
    return false
}

palindrome("anna")
palindromeWithPointers("anna")
palindromeInt(121)

/*
Second case:
 Find the palindrome in the sentence
 */

func hasPalindrome(for sentence: String) -> Bool {
    var words = sentence.components(separatedBy: " ")
    for char in words {
        if palindrome(char) {
            return true
        }
    }
    return false
}

hasPalindrome(for: "It's a really nice day and anna goes for a run")

/// Palindrome of a number
func isPalindrome(_ x: Int) -> Bool {
    if x < 0 {
        return false
    }
    
    var original = x
    var reversed = 0
    
    while original != 0 {
        let digit = original % 10
        reversed = reversed * 10 + digit
        original /= 10
    }
    
    return x == reversed
}


func isPalindrome(_ input: String) -> Bool {
    /// Cleaning the input
    let cleanedString = input.lowercased().filter { $0.isLetter || $0.isNumber }
    
    /// Reversing  the cleaned string
    let reversedString = String(cleanedString.reversed())
    
    /// Comparing
    return cleanedString == reversedString
}

