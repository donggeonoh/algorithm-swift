//
//  SpecialStringAgain.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/12/08.
//

import Foundation

func substrCount(n: Int, s: String) -> Int {
    let sArr = Array(s)
    var result = 0
    
    for curIndex in sArr.indices {
        var repeatCount = 1
        result += 1
        
        for nextIndex in (curIndex + 1)..<sArr.count {
            if sArr[curIndex] == sArr[nextIndex] {
                repeatCount += 1
                result += 1
            } else {
                for index in (nextIndex + 1)..<sArr.count {
                    guard sArr[curIndex] == sArr[index] else {
                        break
                    }
                    repeatCount -= 1
                    
                    if repeatCount <= 0 {
                        result += 1
                        break
                    }
                }
                break
            }
        }
    }
    return result
}
