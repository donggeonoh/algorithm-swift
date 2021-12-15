//
//  MarkAndToys.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/12/15.
//

import Foundation

/// 해커랭크 Mark and toys 솔루션
///
/// - Date: 2021/12/15
/// - Author: Oh Donggeon
/// - Link: https://www.hackerrank.com/challenges/mark-and-toys
///
func maximumToys(prices: [Int], k money: Int) -> Int {
    var money = money
    return prices.sorted().reduce(0) { if $1 < money { money -= $1; return $0 + 1 }; return $0 }
}
