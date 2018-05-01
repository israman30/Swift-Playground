//: Playground - noun: a place where people can play

import UIKit

/*
 Classes and structures are general-purpose, flexible constructs that become the building blocks of your program’s code. You define properties and methods to add functionality to your classes and structures by using exactly the same syntax as for constants, variables, and functions.
 source: https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ClassesAndStructures.html
 */

// CLASS
class Car {
    var year: Int
    var color: String
    init(year: Int, color: String) {
        self.year = year
        self.color = color
    }
}

let mustang = Car(year: 2018, color: "Red")
mustang.year
mustang.color

let oldCar = mustang
oldCar.year = 2011
oldCar.year // Reference types can be changed


// STRUCT
struct Pet {
    var name: String
    var age: Int
}

var murphy = Pet(name: "Murphy", age: 11)
var newPet = murphy
newPet.name = "Bull"
murphy.name // Value type can be re-assigned with another value but it keeps hi original


