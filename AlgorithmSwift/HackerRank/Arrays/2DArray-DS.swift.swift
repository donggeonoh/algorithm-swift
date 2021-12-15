//
//  2DArray-DS.swift.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/12/15.
//

import Foundation

/// 해커랭크 2D Array - DS 솔루션
///
/// - Date: 2021/12/15
/// - Author: Oh Donggeon
/// - Link: https://www.hackerrank.com/challenges/2d-array
///
func hourglassSum(arr matrix: [[Int]]) -> Int {
    var answer = Int.min
    
    for row in matrix.indices {
        for col in matrix[row].indices {
            guard isVaildHourglass(row, col, matrix.count, matrix[row].count) else { continue }
            
            let target = sumHourglass(matrix, row, col)
            
            answer = (target == max(answer, target)) ? target : answer
        }
    }
    
    return answer
}

private func sumHourglass(_ matrix: [[Int]], _ row: Int, _ col: Int) -> Int {
    return matrix[row][col...(col + 2)].reduce(0, +) +
    matrix[row + 1][col + 1] +
    matrix[row + 2][col...(col + 2)].reduce(0, +)
}

private func isVaildHourglass(_ row: Int, _ col: Int, _ maxRow: Int, _ maxCol: Int) -> Bool {
    return row + 2 < maxRow && col + 2 < maxCol
}
