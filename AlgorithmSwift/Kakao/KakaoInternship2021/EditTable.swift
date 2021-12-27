//
//  EditTable.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/12/26.
//

import Foundation

/// 카카오 채용연계형 인턴십 2021 코딩 테스트 표 편집 솔루션
///
/// 코딩 테스트 해설 링크
/// https://tech.kakao.com/2021/07/08/2021-%EC%B9%B4%EC%B9%B4%EC%98%A4-%EC%9D%B8%ED%84%B4%EC%8B%AD-for-tech-developers-%EC%BD%94%EB%94%A9-%ED%85%8C%EC%8A%A4%ED%8A%B8-%ED%95%B4%EC%84%A4
///
/// - Date: 2021/12/26
/// - Author: Oh Donggeon
/// - Link: https://programmers.co.kr/learn/courses/30/lessons/81303
///
class DoublyNode<T: Comparable> {
    
    let value: T
    
    var prev: DoublyNode?
    var next: DoublyNode?
    
    init(_ value: T) {
        self.value = value
    }
    
}

class DoublyLinkedList<T: Comparable> {
    
    private(set) var head: DoublyNode<T>?
    private(set) var tail: DoublyNode<T>?
    
    func append(_ data: T) {
        let node = DoublyNode(data)
        
        if head == nil {
            head = node
            tail = node
            
        } else {
            node.prev = tail
            tail?.next = node
            
            tail = node
        }
    }
    
    func remove(_ node: DoublyNode<T>?) {
        if node === head {
            head = head?.next
        }
        if node === tail {
            tail = tail?.prev
        }
        node?.prev?.next = node?.next
        node?.next?.prev = node?.prev
    }
    
    func restore(_ node: DoublyNode<T>?) {
        if node?.next === head {
            head = node
        } else if node?.prev === tail {
            tail = node
        }
        node?.prev?.next = node
        node?.next?.prev = node
    }
    
    func peek(_ index: Int) -> DoublyNode<T>? {
        var node = head
        
        for _ in 0..<index {
            node = node?.next
        }
        return node
    }
    
    func node(_ node: DoublyNode<T>?, offset: Int) -> DoublyNode<T>? {
        var curNode = node
        
        if offset < 0 {
            for _ in 0..<abs(offset) {
                curNode = curNode?.prev
            }
        } else {
            for _ in 0..<offset {
                curNode = curNode?.next
            }
        }
        
        return curNode
    }
    
}

func editTable(_ row: Int, _ select: Int, _ operations: [String]) -> String {
    let tables: DoublyLinkedList<Int> = initTables(row)
    var removeStack: [DoublyNode<Int>] = []
    var selectNode: DoublyNode<Int>? = tables.peek(select)
    var answer: [Character] = Array(repeating: "O", count: row)
    
    for operation in operations {
        let ops = operation.split(separator: " ")
        
        switch ops.first! {
        case "U":
            selectNode = tables.node(selectNode, offset: -Int(ops.last!)!)
        case "D":
            selectNode = tables.node(selectNode, offset: Int(ops.last!)!)
        case "C":
            if let removeNode = selectNode {
                selectNode = (selectNode === tables.tail) ? selectNode?.prev : selectNode?.next
                removeStack.append(removeNode)
                tables.remove(removeNode)
                
                answer[removeNode.value] = "X"
            }
            
        case "Z":
            let undoNode = removeStack.removeLast()
            
            tables.restore(undoNode)
            answer[undoNode.value] = "O"
            
        default:
            break
        }
    }
    
    return String(answer)
}

func initTables(_ count: Int) -> DoublyLinkedList<Int> {
    let linkedList = DoublyLinkedList<Int>()
    
    for value in 0..<count {
        linkedList.append(value)
    }
    
    return linkedList
}
