//
//  CheckSocialDistance.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/12/22.
//

import Foundation

/// 카카오 채용연계형 인턴십 2021 코딩 테스트 거리두기 확인하기 솔루션
///
/// - Date: 2021/12/23
/// - Author: Oh Donggeon
/// - Link: https://programmers.co.kr/learn/courses/30/lessons/81302
///
func solution(_ places: [[String]]) -> [Int] {
    var answer: [Int] = []
    
    for place in places {
        let result = isKeepSocialDistance(place: place) ? 1 : 0
        answer.append(result)
    }
    
    return answer
}

private func isKeepSocialDistance(place: [String]) -> Bool {
    let personChar: Character = "P"
    
    for (row, seats) in place.enumerated() {
        for (col, seat) in seats.enumerated() {
            if seat == personChar {
                if !isValidDistance(place, row, col) {
                    return false
                }
            }
        }
    }
    
    return true
}

private func isValidDistance(_ place: [String], _ row: Int, _ col: Int) -> Bool {
    typealias SeatIndex = [Int]
    
    let maxRow = place.count
    let maxCol = place[0].count
    let distance = 2
    
    var stack: [SeatIndex] = [[row - 1, col], [row, col - 1], [row + 1, col], [row, col + 1]]
    var visited: Set<SeatIndex> = [SeatIndex([row, col])]
    
    while !stack.isEmpty {
        let curSeat = stack.removeLast()
        let curRow = curSeat[0]
        let curCol = curSeat[1]
        
        if isValidIndex(curRow, curCol, maxRow, maxCol) {
            if isValidDistance(distance, curRow, curCol, row, col) {
                let seats = Array(place[curRow])
                
                if seats[curCol] == "P" {
                    return false
                    
                } else if seats[curCol] == "O" {
                    visited.insert(SeatIndex([curRow, curCol]))
                    
                    stack.append(contentsOf: notVisitedIndices(visited, curRow, curCol))
                }
            }
        }
    }
    
    return true
}

private func notVisitedIndices(_ visited: Set<[Int]>, _ row: Int, _ col: Int) -> [[Int]] {
    var notVisitedIndices: [[Int]] = []
    
    for value in stride(from: -1, through: 1, by: 2) {
        let targetIndex1 = [row + value, col]
        let targetIndex2 = [row, col + value]
        
        if !visited.contains(targetIndex1) {
            notVisitedIndices.append(targetIndex1)
        }
        if !visited.contains(targetIndex2) {
            notVisitedIndices.append(targetIndex2)
        }
    }
    
    return notVisitedIndices
}

private func isValidDistance(_ distance: Int, _ leftRow: Int, _ leftCol: Int, _ rightRow: Int, _ rightCol: Int) -> Bool {
    return abs(leftRow - rightRow) + abs(leftCol - rightCol) <= distance
}

private func isValidIndex(_ row: Int, _ col: Int, _ maxRow: Int, _ maxCol: Int) -> Bool {
    return (0 <= row && row < maxRow) && (0 <= col && col < maxCol)
}
