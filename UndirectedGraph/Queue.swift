//
//  Queue.swift
//  UndirectedGraph
//
//  Queue, implemented using linked list
//
//  Created by Pan on 19/5/2020.
//  Copyright © 2020 Pan. All rights reserved.
//

import Foundation

/* =============== Queue =============== */
public class Queue<T>: CustomStringConvertible {
    private var list = LinkedList<T>()
    
    var isEmpty: Bool { list.isEmpty }
    var first: Node<T>? { list.first }
    var last: Node<T>? { list.last }
    
    func enqueue(item: T) -> Void {
        list.append(data: item)
    }
    
    func dequeue() -> T? {
        guard !isEmpty, let item = first else { return nil }
        _ = list.remove(node: item)
        return item.data
    }

    public var description: String { list.description }
}
