//: [Previous](@previous)

import Foundation

struct Point: Hashable {
    let x: Int
    let y: Int
}

func asciiChart(data: [[Int]]) {
    guard !data.isEmpty else {
        return
    }
    
    let maxX = data.map { $0[0] }.max() ?? 0
    let maxY = data.map { $0[1] }.max() ?? 0
    
    let points: Set<Point> = Set(data.map { Point(x: $0[0], y: $0[1]) })
    
    print("\nASCII Chart")
    print("x axis = time")
    print("y axis = price\n")
    
    for y in stride(from: maxY, through: 0, by: -1) {
        var row = ""
        for x in 0...maxX {
            if x == 0 {
                row += y == 0 ? " +" : " +"
            } else {
                if points.contains(Point(x: x, y: y)) {
                    row += " * "
                } else {
                    row += "   "
                }
            }
        }
        row += "+"
        print(row)
    }
    var axis = " +"
    for _ in 1...maxX {
        axis += "---"
    }
    axis += "+"
    print(axis)
    
    var labels = "   |"
    for x in 0...maxX {
        labels += " \(x)"
    }
    labels += " |"
    print(labels)
}


let data = [[1,2], [2,3], [3,1], [4,6], [5,8]]
asciiChart(data: data)
