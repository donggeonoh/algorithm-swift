//
//  GreedyFlorist.swift
//  Algori thmSwift
//
//  Created by Oh Donggeon on 2021/11/24.
//

import Foundation

// Complete the getMinimumCost function below.
func getMinimumCost(k: Int, c: [Int]) -> Int {
    var count = 0
    return c.sorted(by: >).reduce(0) {
        defer { count += 1 }
        return $0 + ((count / k) + 1) * $1
    }
}
