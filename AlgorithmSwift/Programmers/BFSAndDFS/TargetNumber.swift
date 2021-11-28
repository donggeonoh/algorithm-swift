//
//  TargetNumber.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2020/12/24.
//

/*
 https://programmers.co.kr/learn/courses/30/lessons/43165
 
 문제 설명
 
 n개의 음이 아닌 정수가 있습니다. 이 수를 적절히 더하거나 빼서 타겟 넘버를 만들려고 합니다. 예를 들어 [1, 1, 1, 1, 1]로 숫자 3을 만들려면 다음 다섯 방법을 쓸 수 있습니다.
 -1+1+1+1+1 = 3
 +1-1+1+1+1 = 3
 +1+1-1+1+1 = 3
 +1+1+1-1+1 = 3
 +1+1+1+1-1 = 3
 사용할 수 있는 숫자가 담긴 배열 numbers, 타겟 넘버 target이 매개변수로 주어질 때 숫자를 적절히 더하고 빼서 타겟 넘버를 만드는 방법의 수를 return 하도록 solution 함수를 작성해주세요.
 
 제한사항
 주어지는 숫자의 개수는 2개 이상 20개 이하입니다.
 각 숫자는 1 이상 50 이하인 자연수입니다.
 타겟 넘버는 1 이상 1000 이하인 자연수입니다.
 
 입출력 예
 numbers    target    return
 [1, 1, 1, 1, 1]    3    5
 
 입출력 예 설명
 문제에 나온 예와 같습니다.
 */

import Foundation

class TargetNumber {
    
    var count = 0
    
    func solution(_ numbers: [Int], _ target: Int) -> Int {
        solution(numbers, 0, target)
        return count
    }
    
    func solution(_ numbers: [Int], _ index: Int, _ target: Int) {
        for index in index..<numbers.count {
            var temp = numbers
            temp[index] = -temp[index]
            
            solution(temp, index + 1, target)
        }
        
        if numbers.reduce(0, +) == target {
            count += 1
        }
    }
    
}

func targetNumber(_ numbers: [Int], _ target: Int) -> Int {
    targetNumber(numbers, [], target, 0)
}

/// Programmers 타겟넘버 알고리즘 솔루션 DFS로 구현
///
/// - Date: 2021/11/27
/// - Author: Oh Donggeon
///
private func targetNumber(_ numbers: [Int], _ current: [Int], _ target: Int, _ index: Int) -> Int {
    guard index != numbers.count else {
        if current.reduce(0, +) == target { return 1 }
        else { return 0 }
    }
    var answer = 0
    var current = current
    
    current.append(numbers[index])
    answer += targetNumber(numbers, current, target, index + 1)
    
    let _ = current.popLast()
    
    current.append(-numbers[index])
    answer += targetNumber(numbers, current, target, index + 1)
    
    return answer
}

/// Programmers 타겟넘버 알고리즘 솔루션
///
/// BFS로 구현하였으나 현재 queue를 배열을 queue 처럼 사용하여 효율성이 좋지 않음.
/// LinkedList를 구현하면 해결
///
/// - Date: 2021/11/27
/// - Author: Oh Donggeon
///
func targetNumberBFS(_ numbers: [Int], _ target: Int) -> Int {
    guard let firstNumber = numbers.first else { return 0 }
    
    typealias Node = (number: Int, index: Int)
    var queue: [Node] = [(firstNumber, 0), (-firstNumber, 0)]
    
    for index in 1..<numbers.count {
        for _ in 0..<queue.count {
            let node = queue.removeLast()
            queue.insert((node.number + numbers[index], index), at: 0)
            queue.insert((node.number - numbers[index], index), at: 0)
        }
    }
    
    return queue.filter { $0.number == target }.count
}
