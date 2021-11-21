//
//  LeftRotation.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/11/21.
//

import Foundation

func rotLeft(a: [Int], d: Int) -> [Int] {
    // Write your code here
    var result: [Int] = []
    
    for value in a[a.index(after: d - 1)..<a.endIndex] {
        result.append(value)
    }
    for value in a[a.startIndex..<a.index(after: d - 1)] {
        result.append(value)
    }
    return result
}
