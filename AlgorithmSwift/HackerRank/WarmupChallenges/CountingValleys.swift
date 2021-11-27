//
//  CountingValleys.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/11/27.
//

import Foundation

/// Hacker rank Counting valleys 문제 알고리즘 솔루션
///
/// - Date: 2021/11/27
/// - Author: Oh Donggeon
///
enum Step { // 타입 구체화
    case Up
    case Down
}

func countingValleys(steps: Int, path: String) -> Int {
    let steps: [Step] = path.map { $0 == "U" ? Step.Up : Step.Down }
    var seaLevel = 0
    var answer = 0
    
    for step in steps {
        if step == .Up {
            seaLevel += 1
            if seaLevel == 0 { answer += 1 }
        } else { seaLevel -= 1 }
    }
    
    return answer
}
