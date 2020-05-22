//
//  UndirectedGraphTests.swift
//  UndirectedGraphTests
//
//  Created by Pan on 22/5/2020.
//  Copyright © 2020 Pan. All rights reserved.
//

import XCTest
@testable import UndirectedGraph

class UndirectedGraphTests: XCTestCase {

    func testVertex() throws {
        let vStr = Vertex(data: "Test")
        XCTAssertEqual(vStr.description, "Test")
        let vFloat = Vertex(data: 1.14)
        XCTAssertEqual(vFloat.description, "1.14")
        let vInt = Vertex(data: -33)
        XCTAssertEqual(vInt.description, "-33")
        let vChar = Vertex(data: "C")
        XCTAssertEqual(vChar.description, "C")
        let vBool = Vertex(data: true)
        XCTAssertEqual(vBool.description, "true")
    }
    
    func testVertexEqual() throws {
        let v1 = Vertex(data: "Test")
        let v2 = Vertex(data: "Test")
        let v3 = Vertex(data: 6.13)
        let v4 = Vertex(data: 6.13)
        let v5 = Vertex(data: "tseT")
        let v6 = Vertex(data: 6.12)
        XCTAssertTrue(v1 == v2)
        XCTAssertTrue(v3 == v4)
        XCTAssertFalse(v1 == v5)
        XCTAssertFalse(v3 == v6)
    }
    
    func testGraphVertex() throws {
        let strGraph = AdjacencyList<String>()
        let vA = strGraph.createVertex(data: "Aloha")
        let vB = strGraph.createVertex(data: "Bear")
        
        XCTAssertEqual(strGraph.adj.count, 2)
        XCTAssertNotNil(strGraph.adj[vA])
        XCTAssertNotNil(strGraph.adj[vB])
        
        let expectedDesc = "\(vA): \t[]\n\(vB): \t[]"
        XCTAssertEqual(strGraph.description, expectedDesc)
        
        let intGraph = AdjacencyList<Int>()
        let v1 = intGraph.createVertex(data: 0)
        let v2 = intGraph.createVertex(data: 5)
        let v3 = intGraph.createVertex(data: 2)
        
        XCTAssertEqual(intGraph.adj.count, 3)
        XCTAssertNotNil(intGraph.adj[v1])
        XCTAssertNotNil(intGraph.adj[v2])
        XCTAssertNotNil(intGraph.adj[v3])
    }
    
    func testGraphLink() throws {
        let g = AdjacencyList<String>()
        let vA = g.createVertex(data: "Michael")
        let vB = g.createVertex(data: "Geroge")
        let vC = g.createVertex(data: "Sally")
        
        g.link(from: vA, to: vB)
        g.link(from: vB, to: vC)
        
        guard let a = g.adj[vA],
              let b = g.adj[vB],
              let c = g.adj[vC] else { return XCTFail() }
        XCTAssertTrue(a.contains(vB))
        XCTAssertTrue(b.contains(vA))
        
        XCTAssertTrue(b.contains(vC))
        XCTAssertTrue(c.contains(vB))
        
        XCTAssertFalse(a.contains(vC))
        XCTAssertFalse(c.contains(vA))
    }
    
    func testGraphPath() throws {
        let g = AdjacencyList<String>()
        let vA = g.createVertex(data: "Michael")
        let vB = g.createVertex(data: "Geroge")
        let vC = g.createVertex(data: "Sally")
        
        g.link(from: vA, to: vB)
        g.link(from: vB, to: vC)
        g.link(from: vA, to: vC)
        
        guard let paths = g.paths(from: vA, to: vC) else { return XCTFail() }
        let sut = paths.sorted { $0.count < $1.count }
        let expected: [[Vertex<String>]] = [[vA, vC], [vA, vB, vC]]
        
        XCTAssertEqual(sut, expected)
    }
    
    func testPrint() throws {
        let g = AdjacencyList<String>()
        let vA = g.createVertex(data: "Michael")
        let vB = g.createVertex(data: "Geroge")
        let vC = g.createVertex(data: "Sally")
        
        g.link(from: vA, to: vB)
        
        XCTAssertNotNil(g.printAdjacencyList())
        XCTAssertNotNil(g.printAllPaths(from: vA, to: vB))
        XCTAssertNotNil(g.printShortestPath(from: vA, to: vB))
        
        XCTAssertNotNil(g.printAllPaths(from: vA, to: vC))
        XCTAssertNotNil(g.printShortestPath(from: vA, to: vC))
    }
}
