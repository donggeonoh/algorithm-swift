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
    
    for (index, element) in q.enumerated() {
        guard element <= index + 3 else {
            print("Too chaotic")
            return
        }
        
        if element - 2 < index {
            for targetIndex in max(0, element - 2)..<index {
                if element < q[targetIndex] {
                result += 1
                }
            }
        }
    }
    
    print(result)
}
