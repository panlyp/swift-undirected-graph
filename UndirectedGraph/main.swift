//
//  main.swift
//  UndirectedGraph
//
//  Created by Pan on 19/5/2020.
//  Copyright © 2020 Pan. All rights reserved.
//

import Foundation

let graph = AdjacencyList<String>()

/* Add vertiecs */
let vA = graph.createVertex(data: "A")
let vB = graph.createVertex(data: "B")
let vC = graph.createVertex(data: "C")
let vD = graph.createVertex(data: "D")
let vE = graph.createVertex(data: "E")
let vF = graph.createVertex(data: "F")
let vG = graph.createVertex(data: "G")
let vH = graph.createVertex(data: "H")

/* Set the two vertices for path searching */
let src = vA
let dst = vH

/* Add edges */
graph.link(from: vA, to: vB)
graph.link(from: vA, to: vD)
graph.link(from: vA, to: vH)
graph.link(from: vB, to: vC)
graph.link(from: vB, to: vD)
graph.link(from: vC, to: vD)
graph.link(from: vC, to: vF)
graph.link(from: vD, to: vE)
graph.link(from: vE, to: vF)
graph.link(from: vE, to: vH)
graph.link(from: vF, to: vG)
graph.link(from: vG, to: vH)

/* Print adjancency list and path info */
let divider = "==================================="

print(divider)
graph.printAdjacencyList()
print(divider)
graph.printAllPaths(from: src, to: dst)
print(divider)
graph.printShortestPath(from: src, to: dst)
print(divider)
