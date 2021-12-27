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
    
}

func solution(_ row: Int, _ select: Int, _ operations: [String]) -> String {
    let tables: DoublyLinkedList<Int> = initTables(row)
    var removeStack: [DoublyNode<Int>?] = []
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
            if let removeIndex = selectIndex {
                selectIndex = (selectIndex === tables.tail) ? selectIndex?.prev : selectIndex?.next
                removeStack.append(removeIndex)
                tables.remove(removeIndex)
                
                answer[removeIndex.value] = "X"
            }
            
        case "Z":
            if let undoIndex = removeStack.removeLast() {
                tables.restore(undoIndex)
                answer[undoIndex.value] = "O"
            }
            
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
        linkedList.append(value)
    }
    
    return linkedList
}
