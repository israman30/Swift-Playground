import UIKit

/*
 Input: s = "()"
 Output: true
 
 Input: s = "()[]{}"
 Output: true
 
 Input: s = "(]"
 Output: false
 */

// Checkin parentheses using dictionary, looking for a match bracket
func parenthesesValid(_ word: String) -> Bool {
    var count = [Character]()
    var dict: [Character:Character] = ["(" : ")", "[" : "]", "{" : "}"]
    for char in word {
        if let match = dict[char] {
            count.append(match)
        } else if count.last == char {
            count.popLast()
        } else {
            return false
        }
    }
    return count.isEmpty
}

parenthesesValid("()")

// Checking parentheses using replacingOcurrences, checking is the parentheses pair exist
func validateParentheses(_ word: String) -> Bool {
    var word = word
    let count = Int(word.count / 2)
    (0..<count).forEach { _ in
        word = word
            .replacingOccurrences(of: "()", with: "")
            .replacingOccurrences(of: "[]", with: "")
            .replacingOccurrences(of: "{}", with: "")
    }
    return word.isEmpty
}


extension String {
    func balanced() -> Bool {
        switch self.filter( "()[]{}".contains )
            .replacingOccurrences(of: "()", with: "")
            .replacingOccurrences(of: "[]", with: "")
            .replacingOccurrences(of: "{}", with: "") {
        case "":
            return true
        case self:
            return false
        case let next:
            return next.balanced()
        }
    }
}
"[]".balanced()
validateParentheses("{]")

/*
 Second case
 "()" true
 "())" false
 "(())" true
 "())" false
 */

func checkForBalance(_ word: String) -> Bool {
    var count = 0
    word.forEach { char in
        if char == "(" {
            count += 1
        } else {
            count -= 1
        }
    }
    print(count)
    
    return count == 0 ? true : false
}

func balanced(word: String) -> Bool {
    var chars = [Character]()
    for i in word {
        if i == "(" {
            chars.append(i)
        } else if i == ")" {
            chars.append(i)
        }
    }
    print(chars)
    return chars.contains("(") && chars.contains(")") ? true : false
}

func checkValidString(_ s: String) -> Bool {
    var low = 0   // min open
    var high = 0  // max open
    
    for char in s {
        if char == "(" {
            low += 1
            high += 1
        } else if char == ")" {
            low -= 1
            high -= 1
        } else if char == "*" {
            low -= 1      // treat as ")"
            high += 1     // treat as "("
        }
        
        if high < 0 {
            return false // too many closing
        }
        
        if low < 0 {
            low = 0 // can't have negative min
        }
    }
    
    return low == 0
}
