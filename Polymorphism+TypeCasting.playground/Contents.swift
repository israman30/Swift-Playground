//: Playground - noun: a place where people can play

import UIKit

// Constructor class to build programming language objects
class Coding {
    var language: String
    init(language: String) {
        self.language = language
    }
    
    func performance(){
        print("It's cool to program in \(language)")
    }
    
}


// Creating a programming language object
class CodingIDE: Coding {
    var name: String
    init(language: String, name: String) {
        self.name = name
        super.init(language: language)
    }
    override func performance() {
        print("The right IDE to program in \(language), is \(name)")
    }
}

class CPP: Coding {
    var usage: String
    init(language: String, usage: String) {
        self.usage = usage
        super.init(language: language)
    }
    
    override func performance() {
        print("\(language) is a great language to build \(usage)")
    }
}

class Programmer: Coding {
    var name: String
    init(language: String, name: String) {
        self.name = name
        super.init(language: language)
    }
    
    override func performance() {
        print("\(name) is a programmer and uses \(language)")
    }
}



// Creating Swift as programming language
let swift = CodingIDE(language: "Swift", name: "Xcode")
swift.name
swift.language
// Ho is the performance
swift.performance()

// Creating C++ as programming language
let cpp = CPP(language: "C++", usage: "Back End")
cpp.usage
cpp.language
cpp.performance()

let tom = Programmer(language: swift.language, name: "Tom")
tom.performance()

let jonhDoe = Programmer(language: cpp.language, name: "John Doe")
jonhDoe.performance()


