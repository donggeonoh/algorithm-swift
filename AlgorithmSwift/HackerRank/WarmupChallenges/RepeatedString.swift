//
//  RepeatedString.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/11/21.
//

import Foundation

func repeatedString(s: String, n: Int) -> Int {
    // Write your code here
    let cntSet = NSCountedSet()
    s.forEach { cntSet.add(String($0)) }
    
    var count = n / s.count * cntSet.count(for: "a")
    let remain = n % s.count
    
    for char in s[..<s.index(s.startIndex, offsetBy: remain)] {
        if char == "a" { count += 1 }
    }
    
    return count
}
