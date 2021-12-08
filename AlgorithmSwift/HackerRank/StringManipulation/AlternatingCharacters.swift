//
//  AlternatingCharacters.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/12/08.
//

import Foundation

/// Hacker rank Alternating characters 솔루션
///
/// - Date: 2021/12/08
/// - Author: Oh Donggeon
/// - Link: https://www.hackerrank.com/challenges/alternating-characters
///
func alternatingCharacters(s: String) -> Int {
    let sCharArr = Array(s)
    var answer = 0
    
    for index in 0..<sCharArr.count - 1 {
        guard sCharArr[index] != sCharArr[index + 1] else {
            answer += 1
            continue
        }
    }
    
    return answer
}
