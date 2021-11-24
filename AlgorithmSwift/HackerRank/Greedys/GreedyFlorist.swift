//
//  GreedyFlorist.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/11/24.
//

import Foundation

/// Hacker rank - Greedy florist 욕심쟁이 문제 솔루션
///
/// - Date: 2021/11/24
/// - Author:  Oh Donggeon
/// - Link: https://www.hackerrank.com/challenges/greedy-florist
///
func getMinimumCost(k: Int, c: [Int]) -> Int {
    var count = 0
    return c.sorted(by: >).reduce(0) {
        defer { count += 1 }
        return $0 + ((count / k) + 1) * $1
    }
}
