//
//  DoubleStackQueue.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/11/29.
//

import Foundation

/// DoubleStackQueue 구현
///
/// - Date: 2021/11/29
/// - Author: Oh Donggeon
///
struct DoubleStackQueue<T> {
    
    private var new: [T] = []
    private var old: [T] = []
    
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
