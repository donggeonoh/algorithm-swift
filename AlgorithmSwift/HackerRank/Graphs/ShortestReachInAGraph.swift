//
//  ShortestReachInAGraph.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/12/10.
//

import Foundation

class Vertex {
    typealias AdjVertex = (vertex: Vertex, edge: Int)
    
    let data: Int
    private(set) var adjVertices: [AdjVertex]
    
    init(data: Int) {
        self.data = data
        self.adjVertices = []
    }
    
    func add(edge: Int, with adjVertex: Vertex) {
        adjVertices.append((adjVertex, edge))
    }
}

struct Graph {
    private(set) var vertices: [Vertex]
    
    init() {
        self.vertices = []
    }
    
    mutating func add(vertex value: Int) {
        vertices.append(Vertex(data: value))
    }
    
    mutating func add(edge: Int, between leftVertex: Int, and rightVertex: Int) {
        vertices[leftVertex - 1].add(edge: edge, with: vertices[rightVertex - 1])
        vertices[rightVertex - 1].add(edge: edge, with: vertices[leftVertex - 1])
    }
    
    func distance(from lVertex: Int, to rVertex: Int) -> Int {
        typealias VertexWithDistance = (vertex: Vertex, distance: Int)
        
        var queue: DSQueue<VertexWithDistance> = DSQueue<VertexWithDistance>()
        var visited: [Bool] = Array(repeating: false, count: vertices.count)
        
        let notLinked = -1
        
        visited[lVertex - 1] = false
        
        for adjVertex in vertices[lVertex - 1].adjVertices {
            queue.enqueue((adjVertex.vertex, adjVertex.edge))
        }
        
        while !queue.isEmpty {
            let adjVertex = queue.dequeue()
            let adjVertexIndex = adjVertex.vertex.data - 1
            
            visited[adjVertexIndex] = true
            
            if adjVertex.vertex.data == rVertex {
                return adjVertex.distance
            }
            
            for childAdjVertex in adjVertex.vertex.adjVertices {
                let childAdjVertexIndex = childAdjVertex.vertex.data - 1
                
                if !visited[childAdjVertexIndex] {
                    queue.enqueue((childAdjVertex.vertex,
                    adjVertex.distance + childAdjVertex.edge))
                }
            }
        }
        
        return notLinked
    }
}
