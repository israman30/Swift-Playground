//: Playground - noun: a place where people can play

import UIKit

/*
 An enumeration defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code.
 source: https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Enumerations.html
 */

enum Cooking {
    case Breakfast
    case Lunch
    case Dinner
    case Snack
}

let beforeWork = Cooking.Breakfast

switch beforeWork {
case Cooking.Breakfast:
    print("French toast please!")
case Cooking.Lunch:
    print("Breast chicken please!")
case Cooking.Dinner:
    print("Lobster please!")
case Cooking.Snack:
    print("Porcorn and soda!")
}


// Raw values enumeration
enum Driving: String {
    case North = "Go forward"
    case South = "Turn around"
    case East = "Turn left"
    case West = "Turn right"
}

let goingHome = Driving.North
goingHome.rawValue




