//
//  NumberStringAndWord.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/12/22.
//

import Foundation

/// 카카오 채용연계형 인턴십 2021 코딩 테스트
///
/// - Date: 2021/12/22
/// - Author: Oh Donggeon
/// - Link: https://programmers.co.kr/learn/courses/30/lessons/81301
///
func solution(_ numEngStr: String) -> Int {
    let numDict = ["zero": "0", "one": "1", "two": "2", "three": "3", "four": "4",
                   "five": "5", "six": "6", "seven": "7", "eight": "8", "nine": "9"]
    var numStr = ""
    var engStr = ""
    
    for numEngChar in numEngStr {
        if numEngChar.isNumber {
            numStr.append(numEngChar)
            
        } else {
            engStr.append(numEngChar)
            
            if let targetNumChar = numDict[engStr] {
                numStr.append(targetNumChar)
                engStr = ""
            }
        }
    }
    
    return Int(numStr)!
}
