//
//  EditTable.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/12/26.
//

import Foundation

/// 카카오 채용연계형 인턴십 2021 코딩 테스트 표 편집 솔루션
///
/// - Date: 2021/12/26
/// - Author: Oh Donggeon
/// - Link: https://programmers.co.kr/learn/courses/30/lessons/81303
///
func editTable(_ row: Int, _ select: Int, _ operations: [String]) -> String {
    var tables: [String] = Array(repeating: "O", count: row)
    var removeStack: [Int] = []
    var selectIndex = select
    
    for operation in operations {
        let ops = operation.split(separator: " ")
        
        switch ops.first! {
        case "U":
            selectIndex = move(index: selectIndex, -Int(ops.last!)!, tables)
        case "D":
            selectIndex = move(index: selectIndex, Int(ops.last!)!, tables)
        case "C":
            tables[selectIndex] = "X"
            removeStack.append(selectIndex)
            selectIndex = (selectIndex == row - 1) ? selectIndex - 1 : selectIndex + 1
        case "Z":
            let undoIndex = removeStack.removeLast()
            tables[undoIndex] = "O"
        default:
            print("Wrong input")
        }
    }
    
    return tables.joined()
}

func move(index select: Int, _ count: Int, _ tables: [String]) -> Int {
    let increase = count > 0 ? 1 : -1
    var curIndex = select
    var curCount = 0
    
    while curCount != count {
        curIndex += increase
        
        if tables[curIndex] == "O" {
            curCount += increase
        }
    }
    
    return curIndex
}
