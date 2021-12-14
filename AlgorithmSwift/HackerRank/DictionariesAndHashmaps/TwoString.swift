//
//  TwoString.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/12/14.
//

import Foundation

func twoStrings(s1: String, s2: String) -> String {
    return Set(s1).isDisjoint(with: Set(s2)) ? "NO" : "YES"
}
