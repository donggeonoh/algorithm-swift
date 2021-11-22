//
//  MinimumSwaps2.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/11/21.
//

import Foundation

func minimumSwaps(arr: [Int]) -> Int {
    var swapArr = arr
    var result = 0
    
    for element in 1...arr.count {
        guard let currentIndex = swapArr.firstIndex(of: element) else { continue }
        
        guard element != swapArr[element - 1] else { continue }
        
        swapArr.swapAt(currentIndex, element - 1)
        result += 1
    }
    
    return result
}
