//
//  Candies.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/12/05.
//

import Foundation

/// Hacker rank Candies DP 문제 솔루션
///
/// - Date: 2021/12/05
/// - Author: Oh Donggeon
/// - Link: https://www.hackerrank.com/challenges/candies
///
func candies(n: Int, arr: [Int]) -> Int {
    guard arr.count != 0 else { return 0 }
    
    var answer = 0
    
    let ascendCandies = minCandies(arr)
    let desendCandies = minCandies(arr.reversed()).reversed()
    
    for index in ascendCandies.indices {
        let desendIndex = desendCandies.index(desendCandies.startIndex, offsetBy: index)
        answer += ascendCandies[index] < desendCandies[desendIndex] ?
        desendCandies[desendIndex] : ascendCandies[index]
    }
    
    return answer
}

private func minCandies(_ arr: [Int]) -> [Int] {
    var candies: [Int] = [1]
    
    for index in 1..<arr.count {
        if arr[index - 1] < arr[index] {
            candies.append(candies[index - 1] + 1)
        } else {
            candies.append(1)
        }
    }
    
    return candies
}
