//
//  SalesByMatch.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/11/21.
//

import Foundation

func sockMerchant(n: Int, ar: [Int]) -> Int {
    // Write your code here
    var sortedSocks = ar.sorted()
    var result = 0
    
    while !sortedSocks.isEmpty {
        guard let sock = sortedSocks.popLast() else {
            break
        }
        for compareSock in sortedSocks.reversed() {
            if sock == compareSock {
                result += 1
                sortedSocks.popLast()
                break
            }
        }
    }
    
    return result
}
