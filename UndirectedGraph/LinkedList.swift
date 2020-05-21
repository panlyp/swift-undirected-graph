//
//  LinkedList.swift
//  UndirectedGraph
//
//  Linked list, adapted from my prev work
//
//  Created by Pan on 19/5/2020.
//  Copyright © 2020 Pan. All rights reserved.
//

import Foundation

/* =============== Linked List Node =============== */
public class Node<T> {
    var data: T
    var prev: Node<T>?
    var next: Node<T>?
    
    init(data: T) { self.data = data }
}

/* =============== Linked List =============== */
public class LinkedList<T>: CustomStringConvertible {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool { head == nil }
    var first: Node<T>? { head }
    var last: Node<T>? { tail }
    var count: Int {
        if var node = head {
            var i = 1
            while let next = node.next {
                i += 1
                node = next
            }
            return i
        } else { return 0 }
    }
    
    func append(data: T) {
        let new = Node(data: data) // create a new node
        
        if let currentTail = tail { // exists tail
            new.prev = currentTail
            currentTail.next = new
        } else {
            head = new
        }
        tail = new // now the last node
    }
    
    func remove(node: Node<T>) -> T {
        let prev = node.prev
        let next = node.next
        
        if let prev = prev { // node is not the first
            prev.next = next
        } else {
            head = next
        }
        
        next?.prev = prev
        if next == nil { tail = prev }

        node.prev = nil
        node.next = nil
        return node.data
    }
    
    public var description: String {
        var node = head
        var text = "["
        while node != nil {
            text += "\(node!.data)"
            node = node!.next
            if node != nil { text += ", " }
        }
        text += "]"
        return text
    }
}

