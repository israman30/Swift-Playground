//: Playground - noun: a place where people can play

import UIKit

/*
 A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol.
 source: https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html
 */

// Car dirving protocol
protocol CarDriving {
    func driving()
}

// Creatig a person struct, whose is going to be the driver and passenger
struct Person: CarDriving {
    var name: String
    // function decides who is drives the car
    func driving() {
        print("\(name) drives his car")
    }
}

// The passenger is the delegate
struct Passenger {
    var delegate: CarDriving?
}

// Creating car
struct Car {
    var car: String
    // Function that contains the person object
    func myCar(p1: String, p2: String){
        print("\(p1), and \(p2) are in a trip around CA!")
    }
}

// Creating a onject person 1 that drives a car
let steveJobs = Person(name: "Steve Jobs")
// The object created is going to drive the car
steveJobs.driving()

// Creating an object person 2 for passenger
let passenger1 = Person(name: "Lisa Ramos")
passenger1.name

// Passenger is going to be the delegate
var p = Passenger()
p.delegate = steveJobs

// Creating a car that is going to be driven
let newCar = Car(car: "Mustang")
newCar.myCar(p1: steveJobs.name, p2: passenger1.name)



