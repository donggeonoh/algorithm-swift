//
//  MinimumSwaps2.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/11/21.
//

import Foundation

/// 해커랭크 minimum swaps 2 솔루현
///
/// - Date: 2021/12/15
/// - Author: Oh Donggeon
/// - Link: https://www.hackerrank.com/challenges/minimum-swaps-2
///
func minimumSwaps(arr: [Int]) -> Int {
    let sortedArr = arr.sorted()
    var arr = arr
    var result = 0
    
    while arr != sortedArr {
        for index in 0..<arr.count {
            guard arr[index] != index + 1 else { continue }
            arr.swapAt(index, arr[index] - 1)
            
            result += 1
        }
    }
    
    return result
}
