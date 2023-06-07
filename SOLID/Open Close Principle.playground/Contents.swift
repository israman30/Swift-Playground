import UIKit

// The Open Close Principle states that the design and writing of the code should be done in a way that new functionality should be added with minimum changes in the existing code.

protocol ShapeProtocol {
    func calculateArea() -> Double
}

class Rectangle: ShapeProtocol {
        
    let width: Double
    let height: Double
    
    init(_ width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    func calculateArea() -> Double {
        width * height
    }
}

class Triangle: ShapeProtocol {
    let base: Double
    let height: Double
    
    init(_ base: Double, height: Double) {
        self.base = base
        self.height = height
    }
    
    func calculateArea() -> Double {
        1/2 * base * height
    }
}

class Circle: ShapeProtocol {
    let radius: Double
    
    init(_ radius: Double) {
        self.radius = radius
    }
    
    func calculateArea() -> Double {
        Double.pi * radius * radius
    }
}

class AreaCalculator {
    /// Use protocol as parameter for using it functionality
    func area(of shape: ShapeProtocol) -> Double {
        shape.calculateArea()
    }
    
    /*
     // BRAKE THE OPEN CLOSE PRINCIPLE
    func area(of shape: AnyObject) -> Double {
        if shape is Rectangle {
            let rectangle = shape as! Rectangle
            return rectangle.calculateArea()
        } else if shape is Circle {
            let circle = shape as! Circle
            return circle.calculateArea()
        } else if ...
    }
     */
}

let figure = AreaCalculator()
let objc = Rectangle(2, height: 2)
let circle = Circle(6)
let triangle = Triangle(15, height: 8)
print("Area = \(figure.area(of: objc))")
print("Area = \(figure.area(of: circle))")
print("Area = \(figure.area(of: triangle))")
