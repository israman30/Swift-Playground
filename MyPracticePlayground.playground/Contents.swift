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


// Operators
// Unary, Binary, Ternary
// Unary operates in one targer
// Binary operates in two targets




// ============== Integers ================

// Integers are represented by numbers
// Integers son representados por numeros
let numbers = 10

var number:Int = 5

// Ineteger array
var numbersArray = [1, 2, 3, 4, 5, 6]

// Appenging or Adding a new element to the array
// Aderiendo un nuevo elemento en el array
numbersArray.append(7)

// or could be
let y = 8 // y contains 7 (y contiene el valor de 7)

numbersArray.append(y) // now we append y = 7 to the array(Ahora aderimos y al array)

// Now we remove the value of the last index position [7] = 8
// Ahora removemos el valor de el index en la ultima posicion [7] = 8

// array    [1, 2, 3, 4]
// position [0, 1, 2, 3] or [0] = 1, [1] = 2, [2] = 3, [3] = 4


let index = numbersArray.remove(at: 7)

// The constant index contains now the value of the last index [7] = 8
// La constante index contiene el valor del ultimo index del array [7] = 8
index

// The array is now [1,2,3,4,5,6,7]
numbersArray

// Now we insert the index at the same position
// Ahora insertamos el index en la misma posicion
numbersArray.insert(index, at: 7)

// Now the array is complete
// Ahora el array esta completo
numbersArray






// ============== Doubles ================

// Doubles contain fractions and decimal numbers
// Double contienen fracciones y numeros decimales

let double = 1.234
var numbeDouble:Double = 0.5





// ============== Boolean ================

// Boolean denotes values true or false
// Boolean denota valores verdaderos o falsos

var isTrue = true
var isFalse = false

// Comparing both values is always false
// Comparando los valores es siempre falso
isTrue == isFalse

// Same value is always true
// Valores similares es siempre verdadero
isTrue == isTrue
isFalse == isFalse





