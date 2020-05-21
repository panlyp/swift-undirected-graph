//
//  Edge.swift
//  UndirectedGraph
//
//  Created by Pan on 20/5/2020.
//  Copyright © 2020 Pan. All rights reserved.
//

import Foundation

public struct Edge<T: Hashable>: CustomStringConvertible {
    var src: Vertex<T> // source
    var dst: Vertex<T> // destination
    public var description: String { "\(src) -> \(dst)" }
}

extension Edge: Hashable {
    // whether two edges are equal - based on the two ends
    public static func ==(a: Edge<T>, b: Edge<T>) -> Bool {
        a.src == b.src && a.dst == b.dst
    }
}



