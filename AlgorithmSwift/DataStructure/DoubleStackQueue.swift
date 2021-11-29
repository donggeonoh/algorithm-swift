//
//  DoubleStackQueue.swift.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/11/29.
//

import Foundation

struct DoubleStackQueue<T> {
    
    private(set) var new: [T] = []
    private(set) var old: [T] = []
    
    var isEmpty: Bool {
        new.isEmpty && old.isEmpty
    }
    
    var count: Int {
        new.count + old.count
    }
    
    var values: [T] {
        new.reversed() + old
    }
    
    mutating func enqueue(_ element: T) {
        new.append(element)
    }
    
    mutating func dequeue() -> T {
        if old.isEmpty {
            old = new.reversed()
            new.removeAll()
        }
        
        return old.removeLast()
    }
    
}
