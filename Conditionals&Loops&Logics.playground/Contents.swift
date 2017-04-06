//: Playground - noun: a place where people can play

import UIKit

// Conditionals are logic statements
// Condicionales son estatutos logicos

// ============ if statements ==============

// Example: This simple statement
if "John" == "Johnny" {
    
    print("The are the same guy")
    
} else {
    
    print("The are not the same guy")
    
}


// We have this statement checking if Tom is allow to drink
// Tenemos este estatuto si Tom tiene permitido beber
var age = "21"
var name = "Tom"

if name == age {
    
    print("Her is allow to drink")
    
} else if name < age {
    
    print("He is not allow to drink yet")
    
} else {
    
    print("He is ready for his beer.")
    
}



// ============ For loop ==============

for number in [1,2,3,4,5] {
    print(number)
}


// We are given the array in a container
// Ponemos el array de numeros in a container
let numbers = [4,3,5,12,67]
// then
for i in numbers {
    print(i)
}

// We are looping in an string array
let words = ["Juan", "Carlos", "Tommy", "Sarah"]
for person in words {
    print(person)
}



// We Have an array of countries
// Tenemos un array de paises
let countries = ["US", "Ecuador", "Brasil", "Canada", "Argentina", "Mexico", "Colombia", "Chile", "Bolivia", "Peru", "Panama", "Venezuela"]
// We will loop in this array an put the countries in the correct continent container

var america = [String]() // Empty array - array vacia

// We loop

for country in countries {
    // We append each country in the array america
    // Aderimos cada pais en el array america
    america.append(country)
}

// Now america contains the countries
// Ahora america contiene los paises
america


// Using a loop and a conditional, we are going to separate the countries by North and South
// Usando un loop y un condicinal, vamos a separar los paises por Norte y Sur
var northAmerica = [String]()
var southAmerica = [String]()

for place in america {
    
    if place != "US" && place != "Canada" && place != "Mexico" {
        
        southAmerica.append(place)
        
    } else {
        
        northAmerica.append(place)
        
    }
    
}
// Now we have the countries by North and South america
southAmerica
northAmerica






