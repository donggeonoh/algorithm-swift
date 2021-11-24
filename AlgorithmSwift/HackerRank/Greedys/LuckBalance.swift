//
//  LuckBalance.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/11/23.
//

import Foundation

/// Hacker rank - Luck balance 욕심쟁이 문제 솔루션
///
/// - Date: 2021/11/23
/// - Author:  Oh Donggeon
/// - Link: https://www.hackerrank.com/challenges/luck-balance
///
func luckBalance(k: Int, contests: [[Int]]) -> Int {
    // Write your code here
    let unimportantContest = contests.filter { $0[1] == 0 }
    let importantContests = contests.filter { $0[1] == 1 }.sorted { $0[0] > $1[0] }
    
    var count = 0
    var answer = 0
    
    for contest in importantContests {
        if count == k { answer -= contest[0] }
        else {
            answer += contest[0]
            count += 1
        }
    }
    
    return answer + unimportantContest.compactMap { $0[0] }.reduce(0, +)
}
