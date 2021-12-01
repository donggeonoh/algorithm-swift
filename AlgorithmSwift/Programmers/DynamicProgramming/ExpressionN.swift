//
//  ExpressionN.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2020/12/26.
//

import Foundation

/// Programmers N으로 표현 DP 알고리즘 솔루션
///
/// 설명
/// number 에 대한 사칙연산을 통한 값이 target인 경우의 number를 사용한 최소 경우의 수를 구해야 한다.
/// N번 반복, N+N, N-N, N*N, N/N (ex- 55, 5+5, 5-5, 5*5, 5/5) 의 경우의 수가 나오는 데
/// N을 3번 쓴 경우의 수는 N을 1번을 쓴 경우의 수와 N을 2번을 쓴 경우의 수를 가지고 N을 3번 쓴 경우의 수를 구할 수 있다.
/// ex) N[1] = 2 , N[2] = 22, 2+2, 2-2, 2*2, 2/2 , N[3] = 222, N[1] + N[2] 의 모든 경우의 수 (이 경우 2 + 22, 2 + (2 + 2)...)
/// -, *, / 모두 모든 경우의 수를 계산한다.
/// 따라서, N이 4일 경우 N[1] N[3], N[2] N[2] 의 경우의 수를 사칙연산을 통해 N을 4번 쓴 경우의 수를 구할 수 있다.
/// 여기서 같은 값이 중복으로 나올 수 있으므로, Set을 활용하였다.
/// 그리고 나눗셈에서 나눠야 하는 수가 0인 경우 런타임 오류가 발생하므로 0인 경우 제외시킨다.
/// 계산의 중복을 막기 위해 N / 2 번만 for 문을 돈다. (N[1] N[3]과 N[3] N[1]의 경우 - 값과 / 값만 다르기 때문에
/// 이 둘의 값만 N[4]에 넣는다.)
///
/// 풀이 과정
/// 0. number와 target이 같을 경우 바로 1을 return 한다.
/// 1. 8번 이상의 경우 -1을 return 하므로 8번 만 for문을 돈다.
/// 2. N만큼 반복한 숫자를 넣는다. (4의경우 2222)
/// 3. N / 2 번 만큼 반복문을 돈다. (2의 경우 1번, 3의 경우 1번, 4의 경우 2번, 5의 경우 2번...)
/// 4. N의 경우의 수를 찾기 위해 1 + M, N - M - 1 의 경우의 수를 가지고 N의 경우의 수를 구한다.
/// ex) 5의 경우 1(1 + 0)과 4(5 - 0 - 1), 2(1 + 1)와 3(5 - 1 - 1) 의 경우의 수를 가지고 계산한다.
/// N / 2 번 만큼 반복하므로 5의 경우 2번 반복한다.
/// 5. 각각의 경우의 수를 모두 계산한다. 단, + 와 * 는 좌우가 바뀌어도 값이 똑같기 때문에 -, / 만 반대로 하여 계산한다.
/// 5-1. / 의 경우 나눌 값이 0이 아닌 경우에만 나누도록 한다.
/// 6. 해당 N에서 target과 같은 값의 경우의 수가 나오면 N을 return 한다.
///
/// - Date: 2021/12/01
/// - Author: Oh Donggeon
/// - Link: https://programmers.co.kr/learn/courses/30/lessons/42895
///
func expressionN(_ number: Int, _ target: Int) -> Int {
    guard number != target else { return 1 }
    
    var calcSet: [Set<Int>] = Array(repeating: Set<Int>(), count: 8)
    
    calcSet[0].insert(number)
    
    for outerIndex in 1..<calcSet.count {
        calcSet[outerIndex].insert(createNs(number, count: outerIndex + 1))
        
        for innerIndex in 0..<(outerIndex + 1) / 2 {
            for leftOp in calcSet[innerIndex] {
                for rightOp in calcSet[outerIndex - innerIndex - 1] {
                    calcSet[outerIndex].insert(leftOp + rightOp)
                    calcSet[outerIndex].insert(leftOp - rightOp)
                    calcSet[outerIndex].insert(rightOp - leftOp)
                    calcSet[outerIndex].insert(leftOp * rightOp)
                    if leftOp != Int.zero {
                        calcSet[outerIndex].insert(rightOp / leftOp)
                    }
                    if rightOp != Int.zero {
                        calcSet[outerIndex].insert(leftOp / rightOp)
                    }
                }
            }
        }
        if calcSet[outerIndex].contains(target) {
            return outerIndex + 1
        }
    }
    
    return -1
}

func createNs(_ number: Int, count: Int) -> Int {
    var result = number
    for _ in 1..<count {
        result = result * 10 + number
    }
    return result
}
