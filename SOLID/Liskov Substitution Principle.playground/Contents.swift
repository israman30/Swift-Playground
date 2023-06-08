import UIKit

/*
 Programs that references an object from a base class must be able to use an object of a derived class without behavior differences and without knowing about its existence.
 Every subclass or derived class should be substitutable for their base or parent class.
 */

protocol ShapeProtocol {
    var area: Double { get }
}

class Rectangle: ShapeProtocol {
    
    var width: Double = 0
    var length: Double = 0
    
    var area: Double {
        width * length
    }
}

class Square: ShapeProtocol {

    var width: Double = 0
    
    var area: Double {
        pow(width, 2)
    }
}

let rectangle = Rectangle()
rectangle.length = 5
rectangle.width = 3

let square = Square()
square.width = 5

print("Area of a square: \(rectangle.area)")
print("Area of a square: \(square.area)")
