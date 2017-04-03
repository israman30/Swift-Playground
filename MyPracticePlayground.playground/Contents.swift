//: Playground - noun: a place where people can play


// Playground practice in English and Spanish
// Adding each session a new algorithm
// Adiriendo en cada sesion un nuevo algoristmo

import UIKit

// Variables

// Variable start with var, constants start with let
// Examples
var letra = "A" // Are mutable
let palabra = "Me" // Are not mutable


// ============= STRING ===============
var stringWord:String = "Buenos Dias"

// A string can be a single word or sentence or a paragraph
// Example:
var word = "a"
var sentence = "Hello, how are you today?"
var paragraph = "This is a test to create an paragraph to demostrate a string. Esta linea es para aprender que un string puede contener un parrafo."

// String array
var string = ["Hello", "World", "Hola"]

// Adding a element to the array string
// Adiriendo un elemento in el array de string
string.append("Mundo")

// Counting elements in the array
// Contando los elementos del array
string.count

// Inserting an element in the array position
// Insertando un elemento in the array por posicion
string.insert("Si", at: 0)

// Extracting the last element in the array with a swift property
// Extrayendo el ultimo elemento del array con una propiedad de swift
string.popLast()

// Removing an element on array position
// REmoviendo un elemento del array por posicion
let zero = string.remove(at: 0)
// now zero contain the value of position [0]= "Si"
// Ahora zero contien el valor de la posicion [0]= "Si"

// Adding zero to the array string
// Adiriendo zero al array de string
string.append(zero)

// Reversing a String word with Swift properties
// Revirtiendo una palabra string con una propiedad de swift
var z = "Word"
let characters = z.characters
let reverseChar = characters.reversed()
let reverseStr = String(reverseChar)

// Function reversing string 
// Funcion revirtiendo un string
func reverse(word: String)-> String {
    
    let rev = word.characters
    let reversed = String(rev.reversed())
    
    return reversed
}
reverse(word: "Hello world everyone")
