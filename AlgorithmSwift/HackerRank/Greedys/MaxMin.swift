//
//  MasMin.swift.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/11/24.
//

import Foundation

/// Hacker rank Max Min 욕심쟁이 문제 솔루션
///
/// - Date: 2021/11/24
/// - Author: Oh Donggeon
/// - Link: https://www.hackerrank.com/challenges/angry-children
///
func maxMin(k: Int, arr: [Int]) -> Int {
    let nums = arr.sorted()
    var unpairness = Int.max
    
    for index in 0..<(nums.count - k + 1) {
        let partNums = nums[index..<(index + k)]
        let target = (partNums.last ?? 0) - (partNums.first ?? 0)
        
        guard target != 0 else { return 0 }
        if target < unpairness { unpairness = target }
    }
    
    return unpairness
}
