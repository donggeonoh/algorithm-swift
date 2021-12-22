//
//  Fibonacci.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/11/30.
//

import Foundation

func fibonacci(_ count: Int) -> [Int] {
    guard count > 1 else { return [] }
    guard count != 0 else { return [Int.zero] }
    guard count != 1 else { return [1] }
    
    var fiboNums: [Int] = [0, 1]
    
    for index in 1..<count {
        fiboNums.append(fiboNums[index] + fiboNums[index - 1])
    }
    
    return fiboNums
}
