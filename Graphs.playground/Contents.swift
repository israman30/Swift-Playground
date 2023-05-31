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

class Graph<T> {
    var vertices: [Vertex<T>]?
    
    init() {
        self.vertices = []
    }
    
    func addVertex(_ value: T) -> Vertex<T> {
        let vertex = Vertex(value: value)
        vertices?.append(vertex)
        return vertex
    }
    
    func addEdge(_ source: Vertex<T>, neighbour: Vertex<T>) {
        let edge = Edge(neighbour: neighbour)
        source.neighbours?.append(edge)
    }
}

//let graph =
