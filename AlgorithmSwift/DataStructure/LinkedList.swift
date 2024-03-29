//
//  LinkedList.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/11/28.
//

import Foundation

/// LinkedList 구현
///
/// LinkedList 가 제대로 구현 되었는지 검증이 필요함
///
class SinglyNode<T> {
    
    var value: T
    var next: SinglyNode?

    init(_ value: T, _ next: SinglyNode? = nil) {
        self.value = value
        self.next = next
    }
    
}

class LinkedList<T> {
    private(set) var head: SinglyNode<T>?
    private(set) var tail: SinglyNode<T>?

    var count: Int {
        var result = 0
        var node = head

        while node != nil {
            result += 1
            node = node?.next
        }

        return result
    }

    var values: [T] {
        var node = head
        var result: [T] = []

        while node != nil {
            guard let unwrappedNode = node else { break }

            result.append(unwrappedNode.value)
            node = unwrappedNode.next
        }

        return result
    }

    func addFirst(_ value: T) {
        let node = SinglyNode(value)

        if tail == nil { tail = node }

        node.next = head
        head = node
    }

    func removeLast() -> T? {
        if head === tail { head = nil }

        defer { tail = nil }
        return tail?.value
    }
}
