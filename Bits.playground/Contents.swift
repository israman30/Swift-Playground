import UIKit

func bits(_ s: String) -> Int {
    let bits = s.drop(while: { $0 == "0" }) // drop leading zeros
    // if the string was all zeros, value is 0, operation = 0
    if bits.isEmpty {
        return 0
    }
    
    var operations = 0
    for bit in bits {
        if bit == "1" {
            operations += 2 // substract 1 (1 op) and divide by 2 (1 op
        } else {
            operations += 1 // divide by 2 (1 op)
        }
    }
    // the last '1' bit only needs to be substracted, not divided
    return operations - 1
}

print(bits("011100"))
