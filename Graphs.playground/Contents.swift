import UIKit

struct Vertex<T>: Equatable where T: Equatable, T: Hashable {
    var data: T
    let index: Int
}

struct Edge<T>: Equatable where T: Equatable, T: Hashable {
    let from: Vertex<T>
    let to: Vertex<T>
    
    let weight: Double?
}

class EdgeList<T> where T: Equatable, T:Hashable {
    var vertex: Vertex<T>
    var edges: [Edge<T>]? = nil
    
    init(vertex: Vertex<T>) {
        self.vertex = vertex
    }
    
    func addEdge(edge: Edge<T>) {
        edges?.append(edge)
    }
}
