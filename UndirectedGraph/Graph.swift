//
//  Graph.swift
//  UndirectedGraph
//
//  Created by Pan on 22/5/2020.
//  Copyright © 2020 Pan. All rights reserved.
//

import Foundation

/* Adjacency List */
public class AdjacencyList<T: Hashable>: CustomStringConvertible {
    public var adj: [Vertex<T>: [Edge<T>]] = [:] // using dictionary
    public typealias Item = T
    
    // create a new vertex with data and return the new vertex
    public func createVertex(data: Item) -> Vertex<Item> {
        let vertex = Vertex(data: data)
        if adj[vertex] == nil { adj[vertex] = [] }
        return vertex
    }
    
    /* =============== Helper functions =============== */
    // [helper] given 2 nodes, create an edge linking the two
    public func link(from src: Vertex<Item>, to dst: Vertex<Item>) { addEdge(from: src, to: dst) }
    
    // [helper] given a node, return the edges that it connects to
    public func edges(from src: Vertex<Item>) -> [Edge<Item>]? { adj[src] }
    
    // [helper] given an entry point and a exit point, find the shortest path
    public func paths(from src: Vertex<Item>, to dst: Vertex<Item>) -> [[Vertex<Item>]]? {
        var startingPath = [src]
        var visited = Set(arrayLiteral: src)
        var paths: [[Vertex<Item>]] = []
        return getPaths(dst: dst, currentPath: &startingPath, visited: &visited, paths: &paths)
    }
    
    /* =============== Private functions =============== */
    // adds the edge (two-way)
    private func addEdge(from src: Vertex<Item>, to dst: Vertex<Item>) {
        let srcEdge = Edge(src: src, dst: dst)
        adj[src]?.append(srcEdge)
        let dstEdge = Edge(src: dst, dst: src)
        adj[dst]?.append(dstEdge)
    }
    
    // given two points, search for all (simple) paths)
    private func getPaths(dst: Vertex<Item>,
                          currentPath: inout [Vertex<Item>], // continuing from here
        visited: inout Set<Vertex<Item>>, // these nodes will be skipped
        paths: inout [[Vertex<Item>]]) -> [[Vertex<Item>]]? {
        
        let lastVisited = currentPath[currentPath.count - 1]
        if lastVisited == dst {
            paths.append(currentPath) // found a path, add it to our list
        } else {
            guard let neighbours = adj[lastVisited] else { return nil }
            for neighbour in neighbours {
                let v = neighbour.dst // extract dst part only
                //print(v)
                if !visited.contains(v) {
                    currentPath.append(v)
                    visited.insert(v)
                    _ = getPaths(dst: dst, currentPath: &currentPath, visited: &visited, paths: &paths)
                    visited.remove(v)
                    _ = currentPath.popLast()
                }
            }
        }
        return paths
    }
    
    /* =============== Printing =============== */
    // print the adj list
    public func printAdjacencyList() {
        print("Adjacency List:")
        print("\(description)")
    }
    
    // print the paths list
    public func printAllPaths(from src: Vertex<Item>, to dst: Vertex<Item>) {
        if let pathsList = paths(from: src, to: dst) {
            let paths = pathsList.sorted { $0.count < $1.count } // sort by length
            print("All Simple Paths:")
            var i = 1
            for path in paths {
                print("#\(i)\t\(path)")
                i += 1
            }
        } else {
            print("No path found!")
        }
    }
    
    // print info about the shortest path and the edges
    public func printShortestPath(from src: Vertex<Item>, to dst: Vertex<Item>) {
        if let pathsList = paths(from: src, to: dst) {
            print("The Shortest Path(s):")
            let paths = pathsList.sorted { $0.count < $1.count } // sort by length
            let minSteps = paths[0].count
            for path in paths {
                if path.count == minSteps { print("\t\(path)") }
            }
        } else {
            print("No path found!")
        }
    }
    
    public var description: String {
        var result: [String] = []
        for (vertex, edges) in adj {
            var edgeString = ""
            for (index, edge) in edges.enumerated() {
                edgeString.append(index != edges.count - 1 ? "\(edge.dst), " : "\(edge.dst)")
            }
            result.append("\(vertex):\t[\(edgeString)]")
        }
        result.sort()
        let flatten = result.joined(separator: "\n")
        return flatten
    }
}
