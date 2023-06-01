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

struct Queue<T> {
    private var array: [T]
    
    init() {
        self.array = []
    }
    
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    mutating func dequeue() -> T? {
        if array.isEmpty {
            return nil
        }
        return array.removeLast()
    }
}

struct Stack<T> {
    private var array: [T]
    
    init() {
        self.array = []
    }
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    mutating func isEmpty() -> Bool {
        array.isEmpty
    }
    
    mutating func pop() -> T? {
        guard !isEmpty() else { return nil }
        return array.removeFirst()
    }
    
}

let graph = Graph<Int>()

// Let's add vertex for the graph
let node1 = graph.addVertex(1)
let node2 = graph.addVertex(2)
let node3 = graph.addVertex(3)
let node4 = graph.addVertex(4)
let node5 = graph.addVertex(5)
let node6 = graph.addVertex(6)
let node7 = graph.addVertex(7)
let node8 = graph.addVertex(8)
let node9 = graph.addVertex(9)
let node10 = graph.addVertex(10)

// Let's add edges
graph.addEdge(node1, neighbour: node2)
graph.addEdge(node1, neighbour: node3)
graph.addEdge(node1, neighbour: node4)
graph.addEdge(node1, neighbour: node5)
graph.addEdge(node2, neighbour: node6)
graph.addEdge(node3, neighbour: node6)
graph.addEdge(node3, neighbour: node7)
graph.addEdge(node4, neighbour: node7)
graph.addEdge(node5, neighbour: node8)
