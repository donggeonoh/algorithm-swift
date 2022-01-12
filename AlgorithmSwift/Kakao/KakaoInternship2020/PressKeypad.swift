//
//  PressKeypad.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2022/01/12.
//

import Foundation

/// 카카오 인턴십 2020 코딩 테스트 키패드 누르기
///
/// - Date: 2022/01/12
/// - Author: Oh Donggeon
/// - Link: https://programmers.co.kr/learn/courses/30/lessons/67256
///
func solution(_ numbers: [Int], _ hand: String) -> String {
    typealias Position = (row: Int, col: Int)
    let keyDict = [1: Position(0, 0), 2: Position(0, 1), 3: Position(0, 2),
                   4: Position(1, 0), 5: Position(1, 1), 6: Position(1, 2),
                   7: Position(2, 0), 8: Position(2, 1), 9: Position(2, 2),
                  10: Position(3, 0), 0: Position(3, 1), 11: Position(3, 2)]
    let leftKeys = [1, 4, 7]
    let rightKeys = [3, 6, 9]
    var leftPos = Position(3, 0)
    var rightPos = Position(3, 2)
    var answer = ""
    
    for number in numbers {
        guard let pos = keyDict[number] else {
            break
        }
        
        if leftKeys.contains(number) {
            answer.append("L")
            leftPos = pos
            
        } else if rightKeys.contains(number) {
            answer.append("R")
            rightPos = pos
            
        } else {
            let leftDistance = abs(leftPos.row - pos.row) + abs(leftPos.col - pos.col)
            let rightDistance = abs(rightPos.row - pos.row) + abs(rightPos.col - pos.col)
            
            if leftDistance < rightDistance {
                answer.append("L")
                leftPos = pos
                
            } else if leftDistance > rightDistance {
                answer.append("R")
                rightPos = pos
                
            } else {
                if hand == "left" {
                    answer.append("L")
                    leftPos = pos
                    
                } else {
                    answer.append("R")
                    rightPos = pos
                }
            }
        }
    }
    
    return answer
}
