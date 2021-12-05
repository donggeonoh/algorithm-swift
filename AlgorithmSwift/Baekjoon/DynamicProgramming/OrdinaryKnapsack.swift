//
//  OrdinaryKnapsack.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/12/01.
//

import Foundation

/// 백준 평범한 배낭 문제 솔루션
///
/// - Date: 2021/12/04
/// - Author: Oh Donggeon
/// - Link: https://www.acmicpc.net/problem/12865
///
typealias Stuff = (weight: Int, value: Int)

func ordinaryKnapsack(_ values: [[Int]], _ maxWeight: Int) -> Int {
    var stuffs: [Stuff] = [Stuff(0, 0)]
    var profits: [[Int]] = []
    var answer = 0
    
    for value in values {
        stuffs.append(Stuff(value[0], value[1]))
    }
    
    profits.append(Array(repeating: 0, count: maxWeight + 1))
    
    for outerIndex in 1..<stuffs.count {
        profits.append([])
        for innerIndex in 0...maxWeight {
            guard stuffs[outerIndex].weight <= innerIndex else {
                profits[outerIndex].append(profits[outerIndex - 1][innerIndex])
                continue
            }
            profits[outerIndex].append(max(profits[outerIndex - 1][innerIndex],
                                           profits[outerIndex - 1][innerIndex - stuffs[outerIndex].weight] +
                                           stuffs[outerIndex].value))
        }
    }
    
    if let result = profits.last?.last { answer = result }
    
    return answer
}
