//
//  TwoString.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/12/14.
//

import Foundation

/// 해커랭크 Two string 솔루션
///
/// - Date: 2021/12/14
/// - Author: Oh Donggeon
/// - Link: https://www.hackerrank.com/challenges/two-strings
///
func twoStrings(s1: String, s2: String) -> String {
    return Set(s1).isDisjoint(with: Set(s2)) ? "NO" : "YES"
}
