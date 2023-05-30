import UIKit

/*
        A <-- Vertex
       /  \<-- Edge
      /    \ 10 <- Weight
    B ------ C
 */

class Vertex<T> {
    var value: T
    var visited: Bool?
    var neighbours: [Edge<T>]?
    
    init(value: T) {
        self.value = value
        self.visited = false
        self.neighbours = []
    }
}

class Edge<T> {
    var neighbour: Vertex<T>?
    
    init(neighbour: Vertex<T>) {
        self.neighbour = neighbour
    }
}
