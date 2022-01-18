//
//  ClawCraneGame.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2022/01/19.
//

import Foundation

func solution(_ board: [[Int]], _ moves: [Int]) -> Int {
    typealias Position = (row: Int, col: Int)
    var board = board
    var basket: [Int] = []
    var answer = 0
    
    for move in moves {
        let index = move - 1
        let pos: Position = pickDollIndex(board, index)
        let doll = board[pos.row][pos.col]
        
        if doll != Int.zero {
            board[pos.row][pos.col] = 0
            
            if let basketDoll = basket.last {
                if basketDoll == doll {
                    let _ = basket.popLast()
                    answer += 2
                    continue
                }
            }
            basket.append(doll)
        }
    }
    
    return answer
}

func pickDollIndex(_ board: [[Int]], _ index: Int) -> (Int, Int) {
    var row = board.count - 1
    
    for (targetIndex, dolls) in board.enumerated() {
        if dolls[index] != Int.zero {
            row = targetIndex
            break
        }
    }
    
    return (row, index)
}
