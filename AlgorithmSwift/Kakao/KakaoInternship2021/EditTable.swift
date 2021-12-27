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
    
    private(set) var head: DoublyNode<T>? = nil
    private(set) var tail: DoublyNode<T>? = nil
    
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
        if head === tail {
            head = nil
            tail = nil
            
        } else if node === head {
            head?.next?.prev = nil
            head = head?.next
            
        } else if node === tail {
            tail?.prev?.next = nil
            tail = tail?.prev
            
        } else {
            node?.prev?.next = node?.next
            node?.next?.prev = node?.prev
        }
    }
    
    func restore(_ node: DoublyNode<T>?) {
            node?.prev?.next = node
            node?.next?.prev = node
    }
    
    func peek(_ value: T) -> DoublyNode<T>? {
        var target = head
        
        while target != nil {
            if value == target?.value {
                return target
            }
            target = target?.next
        }
        
        return target
    }
    
    var values: [T] {
        var values: [T] = []
        var node = head
        
        while node != nil {
            if let node = node {
                values.append(node.value)
            }
            node = node?.next
        }
        
        return values
    }
    
    func insert(_ data: T) {
        let node = DoublyNode(data)
        
        guard let head = head, let tail = tail else {
            self.head = node
            self.tail = node
            return
        }
        
        if data < head.value {
            head.prev = node
            node.next = head
            
            self.head = node
            
        } else if data > tail.value {
            tail.next = node
            node.prev = tail
            
            self.tail = node
            
        } else {
            var next = self.head
            
            while next != nil {
                guard let target = next else { return }
                
                if data < target.value {
                    node.prev = target.prev
                    node.next = target
                    
                    target.prev?.next = node
                    target.prev = node
                    
                    break
                }
                
                next = target.next
            }
        }
    }
    
    func remove(_ data: T) -> DoublyNode<T>? {
        var target = head
        
        if head === tail && data == head?.value {
            head = nil
            tail = nil
            
        } else if data == head?.value {
            head?.next?.prev = nil
            head = head?.next
            
        } else if data == tail?.value {
            target = tail
            tail?.prev?.next = nil
            tail = tail?.prev
            
        } else {
            while target != nil {
                if data == target?.value {
                    target?.prev?.next = target?.next
                    target?.next?.prev = target?.prev
                    
                    break
                }
                
                target = target?.next
            }
        }
        return target
    }
    
}

func solution(_ row: Int, _ select: Int, _ operations: [String]) -> String {
    let tables: DoublyLinkedList<Int> = initTables(row)
    var removeStack: [Int] = []
    var selectIndex: DoublyNode<Int>? = tables.peek(select)
    var answer: [Character] = Array(repeating: "O", count: row)
    
    for operation in operations {
        let ops = operation.split(separator: " ")
        
        switch ops.first! {
        case "U":
            selectIndex = move(index: selectIndex, -Int(ops.last!)!, tables)
        case "D":
            selectIndex = move(index: selectIndex, Int(ops.last!)!, tables)
        case "C":
            guard let targetIndex = selectIndex else {
                continue
            }
            selectIndex = (targetIndex === tables.tail) ? targetIndex.prev : targetIndex.next
            removeStack.append(targetIndex.value)
            tables.remove(targetIndex.value)
            answer[targetIndex.value] = "X"
            
        case "Z":
            let undoIndex = removeStack.removeLast()
            tables.insert(undoIndex)
            answer[undoIndex] = "O"
        default:
            break
        }
    }
    
    return String(answer)
}

func move(index select: DoublyNode<Int>?, _ count: Int, _ tables: DoublyLinkedList<Int>) -> DoublyNode<Int>? {
    var curIndex = select
    
    if count < 0 {
        for _ in 0..<abs(count) {
            curIndex = curIndex?.prev
        }
    } else {
        for _ in 0..<count {
            curIndex = curIndex?.next
        }
    }
    
    return curIndex
}

func initTables(_ count: Int) -> DoublyLinkedList<Int> {
    let linkedList = DoublyLinkedList<Int>()
    
    for value in 0..<count {
        linkedList.insert(value)
    }
    
    return linkedList
}
