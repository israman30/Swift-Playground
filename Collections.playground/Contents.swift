//: Playground - noun: a place where people can play

import UIKit

/*
 Swift provides three primary collection types, known as arrays, sets, and dictionaries, for storing collections of values. Arrays are ordered collections of values. Sets are unordered collections of unique values. Dictionaries are unordered collections of key-value associations.
 
 source: https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/CollectionTypes.html
 */

var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

var evenNumbers = [Int]()

for num in numbers {
    let squr = num * num
    if squr % 2 == 0 {
        evenNumbers.append(squr)
    }
}

let sqrNumbers = numbers.map({$0 * $0}).filter({$0 % 2 == 0})
// print the square of multiples of all pairs numbers


// Pairing elements of two array in one array
let suit = ["♡", "♢", "♤", "♧"]
let rank = ["J", "K", "Q", "A"]

var pairs = [(String, String)]()

for s in suit {
    for r in rank {
        let p = (s, r)
        pairs.append(p)
    }
}

let cards = suit.flatMap { s in
    rank.map { r in (s, r)}
}
// print [("♡", "J"), ("♡", "K"), ("♡", "Q"), ("♡", "A"), ("♢", "J"), ("♢", "K"), ("♢", "Q"), ("♢", "A"), ("♤", "J"), ("♤", "K"), ("♤", "Q"), ("♤", "A"), ("♧", "J"), ("♧", "K"), ("♧", "Q"), ("♧", "A")]

/*
 DICTIONARY
 A dictionary is a type of hash table, providing fast access to the entries it contains. Each entry in the table is identified using its key, which is a hashable type such as a string or number. You use that key to retrieve the corresponding value, which can be any object. In other languages, similar data types are known as hashes or associated arrays.
 source: https://developer.apple.com/documentation/swift/dictionary
 */
/*
 SET
 You use a set instead of an array when you need to test efficiently for membership and you aren’t concerned with the order of the elements in the collection, or when you need to ensure that each element appears only once in a collection.
 source: https://developer.apple.com/documentation/swift/set
 */
let barca: Set = ["Messi", "Suarez", "Iniesta", "Xavi", "Rivaldo", "Kluiver", "Eto"]
let sudamericans: Set = ["Messi", "Suarez", "Rivaldo"]

// Substraction the matching elements
let matchingPlayers = barca.subtracting(sudamericans)
// print the substraction remainded of matching elements

// Intersecting matching elements
let intersectingPlayers = barca.intersection(sudamericans)
// print the elements intersected

// Union - will not duplicate elements but return one
let allPlayers = barca.union(sudamericans)
// print the union of all elements without repeat it





