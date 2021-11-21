//
//  NewYearChaos.swift.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/11/21.
//

import Foundation

func minimumBribes(q: [Int]) -> Void {
    // Write your code here
    var result = 0
    
    for element in q {
        guard let qIdx = q.firstIndex(of: element) else { return }
        let originIdx = element - 1
        let moveCount = originIdx - qIdx
        
        guard moveCount < 3 else {
            print("Too chaotic")
            return
        }
        
        if qIdx < originIdx { result += moveCount }
    }
    
    print(result)
}
