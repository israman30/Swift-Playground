import UIKit


// Convert roman number from Int to String and String to Int
func romanToInt(_ s: String) -> Int {
    let romanValues: [Character: Int] = [
        "I": 1, "V": 5, "X": 10, "L": 50,
        "C": 100, "D": 500, "M": 1000
    ]
    
    var result = 0
    var previousValue = 0
    
    for char in s.reversed() {
        if let currentValue = romanValues[char] {
            if currentValue < previousValue {
                result -= currentValue
            } else {
                result += currentValue
            }
            previousValue = currentValue
        } else {
            // Invalid character found; handle error appropriately
            return 0
        }
    }
    
    return result
}

func intToRoman(_ num: Int) -> String {
    var ten = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
    var cen = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
    var hun = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
    var ths = ["", "M", "MM", "MMM"]
    return ths[num / 1000] + hun[(num % 1000) / 100] + cen[(num % 100) / 10] + ten[num % 10]
}
