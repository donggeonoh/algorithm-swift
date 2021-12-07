//
//  MinimumAbsoluteDifferenceInAnArray.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/12/07.
//

import Foundation

/// Hacker rank Minimum Absolute Difference in an Array 솔루션
///
/// - Date: 2021/12/07
/// - Author: Oh Donggeon
/// - Link: https://www.hackerrank.com/challenges/minimum-absolute-difference-in-an-array
///
func minimumAbsoluteDifference(arr: [Int]) -> Int {
    let sortedAbsoluteArr = arr.sorted()
    var result = Int.max
    
    for index in 1..<sortedAbsoluteArr.count {
        let expected = sortedAbsoluteArr[index] - sortedAbsoluteArr[index - 1]
        if expected < result {
            result = expected
        }
    }
    
    return result == Int.max ? 0 : result
}
