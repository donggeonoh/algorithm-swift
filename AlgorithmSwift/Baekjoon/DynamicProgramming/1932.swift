//
//  1932.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2020/12/26.
//

/*
 https://www.acmicpc.net/problem/1932
 
 정수 삼각형
 
 문제
 7
 3   8
 8   1   0
 2   7   4   4
 4   5   2   6   5
 위 그림은 크기가 5인 정수 삼각형의 한 모습이다.
 
 맨 위층 7부터 시작해서 아래에 있는 수 중 하나를 선택하여 아래층으로 내려올 때, 이제까지 선택된 수의 합이 최대가 되는 경로를 구하는 프로그램을 작성하라.
 아래층에 있는 수는 현재 층에서 선택된 수의 대각선 왼쪽 또는 대각선 오른쪽에 있는 것 중에서만 선택할 수 있다.
 
 삼각형의 크기는 1 이상 500 이하이다. 삼각형을 이루고 있는 각 수는 모두 정수이며, 범위는 0 이상 9999 이하이다.
 
 입력
 첫째 줄에 삼각형의 크기 n(1 ≤ n ≤ 500)이 주어지고, 둘째 줄부터 n+1번째 줄까지 정수 삼각형이 주어진다.
 
 출력
 첫째 줄에 합이 최대가 되는 경로에 있는 수의 합을 출력한다.
 */

import Foundation

class Baekjoon1932 {
    
    typealias Memo = [Int]
    
    var buf: [[Int]] = []
    
    func execute() {
        let count: Int = Int(readLine()!)!
        var input: [[Int]] = []
        
        (0..<count).forEach { _ in
            let temp: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
            input.append(temp)
        }
        
        solution(count, input)
    }
    
    func test() {
        let count = 5
        let input = [[7], [3, 8], [8, 1, 0], [2, 7, 4, 4], [4, 5, 2, 6, 5]]
        
        solution(count, input)
    }
    
    func solution(_ count: Int, _ input: [[Int]]) {
        buf.append([])
        buf[0].append(input[0][0])
        
        for outer in 0..<count - 1 {
            buf.append(.init(repeating: .min, count: input[outer + 1].count))
            
            for inner in 0..<input[outer].count {
                let leftSum = buf[outer][inner] + input[outer + 1][inner]
                let rightSum = buf[outer][inner] + input[outer + 1][inner + 1]
                
                if buf[outer + 1][inner] < leftSum {
                    buf[outer + 1][inner] = leftSum
                }
                if buf[outer + 1][inner + 1] < rightSum {
                    buf[outer + 1][inner + 1] = rightSum
                }
            }
        }
        print(buf.last!.compactMap({ $0 }).max()!)
    }
    
}
