//
//  Vertex.swift
//  UndirectedGraph
//
//  Created by Pan on 20/5/2020.
//  Copyright © 2020 Pan. All rights reserved.
//

import Foundation

/* Vertex */
public struct Vertex<T: Hashable>: Hashable, CustomStringConvertible {
    var data: T
    public var description: String { "\(data)" }
    public static func ==(a: Vertex<T>, b: Vertex<T>) -> Bool {
        a.data == b.data
    }
}
