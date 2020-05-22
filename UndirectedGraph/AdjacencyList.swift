//
//  AdjacencyList.swift
//  UndirectedGraph
//
//  Created by Pan on 22/5/2020.
//  Copyright © 2020 Pan. All rights reserved.
//

import Foundation

/* Adjacency List */
public class AdjacencyList<T: Hashable>: CustomStringConvertible {
    public var adj: [Vertex<T>: [Vertex<T>]] = [:] // using dictionary
    public typealias Item = T
    
    // create a new vertex with data and return the new vertex
    public func createVertex(data: Item) -> Vertex<Item> {
        let vertex = Vertex(data: data)
        if adj[vertex] == nil { adj[vertex] = [] }
        return vertex
    }
    
    /* =============== Helper functions =============== */
    // [helper] given 2 nodes, create links between the two
    public func link(from src: Vertex<Item>, to dst: Vertex<Item>) { addLink(from: src, to: dst) }
    
    // [helper] given an entry point and a exit point, find the shortest path
    public func paths(from src: Vertex<Item>, to dst: Vertex<Item>) -> [[Vertex<Item>]]? {
        var startingPath = [src]
        var visited = Set(arrayLiteral: src)
        var paths: [[Vertex<Item>]] = []
        return searchPaths(dst: dst, currentPath: &startingPath, visited: &visited, paths: &paths)
    }
    
    /* =============== Private functions =============== */
    // adds the link (two-way)
    private func addLink(from src: Vertex<Item>, to dst: Vertex<Item>) {
        adj[src]?.append(dst)
        adj[dst]?.append(src)
    }
    
    // given two points, search for all (simple) paths)
    // based on dfs
    private func searchPaths(dst: Vertex<Item>,
                             currentPath: inout [Vertex<Item>], // continuing from here
        visited: inout Set<Vertex<Item>>, // these nodes will be skipped
        paths: inout [[Vertex<Item>]]) -> [[Vertex<Item>]]? {
        
        let lastVisited = currentPath[currentPath.count - 1]
        if lastVisited == dst {
            paths.append(currentPath) // found a path, add it to our list
        } else {
            guard let neighbours = adj[lastVisited] else { return nil }
            for neighbour in neighbours {
                let v = neighbour // extract dst part only
                //print(v)
                if !visited.contains(v) {
                    currentPath.append(v)
                    visited.insert(v)
                    _ = searchPaths(dst: dst, currentPath: &currentPath, visited: &visited, paths: &paths)
                    visited.remove(v)
                    _ = currentPath.popLast()
                }
            }
        }
        return paths
    }
    
    // print the paths list
    private func printPaths(from src: Vertex<Item>, to dst: Vertex<Item>, showShortest: Bool) {
        if let exists = adj[src]?.contains(dst) {
            if(!exists) {
                print("No path found!")
                return
            } else if let pathsList = paths(from: src, to: dst) {
                let paths = pathsList.sorted { $0.count < $1.count } // sort by length
                
                switch showShortest {
                case true: // only select the shortest path(s)
                    let minSteps = paths[0].count
                    print("The Least Number of Hop(s): \n\t\(minSteps - 1)")
                    print("The Shortest Path(s):")
                    for path in paths {
                        if path.count == minSteps { print("\t\(path)") }
                    }
                default: // show all paths
                    print("All Simple Paths:")
                    var i = 1
                    for path in paths {
                        print("#\(i)\t\(path)")
                        i += 1
                    }
                }
            }
        }
    }
    
    /* =============== Printing =============== */
    // print the adj list
    public func printAdjacencyList() {
        print("Adjacency List:")
        print("\(description)")
    }
    
    // print all the possible paths
    public func printAllPaths(from src: Vertex<Item>, to dst: Vertex<Item>) {
        printPaths(from: src, to: dst, showShortest: false)
    }
    
    // print info about the shortest path and the edges
    public func printShortestPath(from src: Vertex<Item>, to dst: Vertex<Item>) {
        printPaths(from: src, to: dst, showShortest: true)
    }
    
    public var description: String {
        var results: [String] = []
        for (vertex, neighbours) in adj {
            results.append("\(vertex): \t\(neighbours)")
        }
        results.sort()
        let formatted = results.joined(separator: "\n")
        return formatted
    }
}
