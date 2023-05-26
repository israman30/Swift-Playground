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
