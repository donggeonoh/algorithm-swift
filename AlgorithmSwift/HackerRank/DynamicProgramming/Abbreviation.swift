//
//  Abbreviation.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/12/06.
//

import Foundation

/// Hacker rank Abbreviation DP 솔루션
///
/// LCS(Longest Common Subsequence) 알고리즘을 응용한 알고리즘 문제이다.
/// LCS 알고리즘 이란? https://twinw.tistory.com/126 정리가 잘 되어있다.
///
/// 이번 문제는 링크 2개를 보고 풀어보았다. 확실하게 LCS에 대해 이해하고 넘어가야겠다.
/// https://sungjun221.github.io/algorithm/Abbreviation/#어떻게-풀까
/// https://iawale.medium.com/abbreviation-hackerrank-medium-4601219c07d1
///
/// - Date: 2021/12/06
/// - Author: Oh Donggeon
/// - Link: https://www.hackerrank.com/challenges/abbr/
///
func abbreviation(a compStr: String, b targetStr: String) -> String {
    let YES = "YES"
    let NO = "NO"
    var sameCharCount: [[Bool]] = []
    
    sameCharCount.append(Array(repeating: false, count: compStr.count))
    sameCharCount[0][0] = true
    
    for _ in compStr.indices {
        if compStr.first!.isUppercase {
            sameCharCount.append([false])
        } else {
            sameCharCount.append([true])
        }
    }
    
    for (outerIndex, compChar) in compStr.enumerated() {
        for (innerIndex, targetChar) in targetStr.enumerated() {
            if compChar == targetChar {
                sameCharCount[outerIndex + 1].append(sameCharCount[outerIndex][innerIndex])
            } else if Character(compChar.uppercased()) == targetChar {
                sameCharCount[outerIndex + 1].append(sameCharCount[outerIndex][innerIndex] || sameCharCount[outerIndex][innerIndex + 1])
            } else if compChar.isUppercase {
                sameCharCount[outerIndex + 1].append(false)
            } else {
                sameCharCount[outerIndex + 1].append(sameCharCount[outerIndex][innerIndex + 1])
            }
        }
    }
    
    return sameCharCount.last!.last! ? YES : NO
}
