//
//  Vertex.swift
//  UndirectedGraph
//
//  Created by Pan on 20/5/2020.
//  Copyright © 2020 Pan. All rights reserved.
//

import Foundation

public struct Vertex<T: Hashable>: CustomStringConvertible {
    var data: T
    public var description: String { "\(data)" }
}

extension Vertex: Hashable {
    // whether two vertices are equal - based on the data they hold
    public static func ==(a: Vertex, b: Vertex) -> Bool {
        a.data == b.data
    }
}
