//
//  JumpingOnTheCloud.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/11/21.
//

import Foundation

func jumpingOnClouds(c: [Int]) -> Int {
    // Write your code here
    var index = 0
    var result = 0
    while index < c.count - 1 {
        guard !(index == c.count - 2 || index == c.count - 3) else {
            return result + 1
        }
        if c[index + 2] == 0 {
            index += 2
        } else if c[index + 1] == 0 {
            index += 1
        }
        result += 1
    }
    return result
}
