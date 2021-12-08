//
//  MakingAnagrams.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/12/08.
//

import Foundation

/// Hacker rank Strings: Making Anagrams 문제 솔루션
///
/// - Date: 20221/12/08
/// - Author: Oh Donggeon
/// - Link: https://www.hackerrank.com/challenges/ctci-making-anagrams
///
func makeAnagram(a strA: String, b strB: String) -> Int {
    return findDeleteCharCount(strA, strB) + findDeleteCharCount(strB, strA)
}

func findDeleteCharCount(_ strA: String, _ strB: String) -> Int {
    var strB = strB
    var result = strB.count
    
    for charA in strA {
        guard let index = strB.firstIndex(of: charA) else {
            continue
        }
        let _ = strB.remove(at: index)
        result -= 1
    }
    
    return result
}
