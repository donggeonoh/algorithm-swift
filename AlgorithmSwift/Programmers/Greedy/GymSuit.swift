//
//  GymSuit.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/12/25.
//

import Foundation

/// 프로그래머스 체육복 솔루션
///
/// - Date: 2021/12/25
/// - Author: Oh Donggeon
/// - Link: https://programmers.co.kr/learn/courses/30/lessons/42862
///
func gymSuit(_ students: Int, _ losts:[Int], _ reserves:[Int]) -> Int {
    var reserveDict = initDict(elements: reserves, defaultValue: false)
    var answer = students
    
    for lostStudent in losts {
        reserveDict[lostStudent]? = true
    }
    
    for lost in losts.sorted() {
        if reserveDict[lost] != nil {
            continue
        }
        
        if let reserveStudent = reserveDict[lost - 1] {
            if !reserveStudent {
                reserveDict[lost - 1]? = true
                continue
            }
        }
        
        if let reserveStudent = reserveDict[lost + 1] {
            if !reserveStudent {
                reserveDict[lost + 1]? = true
                continue
            }
        }
        
        answer -= 1
    }
    
    return answer
}

private func initDict(elements: [Int], defaultValue: Bool) -> Dictionary<Int, Bool> {
    var dict: [Int: Bool] = [:]
    
    for element in elements {
        dict[element] = defaultValue
    }
    
    return dict
}
