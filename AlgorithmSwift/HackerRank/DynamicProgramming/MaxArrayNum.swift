//
//  MaxArrayNum.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/12/02.
//

import Foundation

/// Hacker rank max array sum 문제 솔루션
///
/// 현재 이유불문으로 채점이 안되고 있음
///
/// 솔루션 설명
///
/// Sub problem을 생각해 본다면 일단 인접한 배열은 계산 할 수 없으므로 처음부터 한 칸 떨어진 인덱스 까지 계산이 가능하다.
/// ex) index가 5 라고 한다면 0부터 3(포함)까지
/// 이 때, 결국 그 전의 계산들에 대한 경우의 수를 따져보자.
/// 4의 경우 4(자기 자신), 0-4, 1-4, 2-4, 0-2-4의 경우의 수를 가진다.
/// 이 모든 경우의 수를 어딘가에 저장해 놓고 계산하게 된다면 계산해야 할 경우의 수가 기하급수적으로 커질 것이다.
/// (6의 경우의 수에서 4의 경우의 수도 쓰일 것이고, 1, 2, 3의 경우의 수가 쓰일 것인데 모든 경우의 수를 따지긴 힘들 것이다.)
/// 따라서 최댓 값을 가지는 수만 배열에 저장한다. (4, 1-4, 2-4, 0-2-4 중에서 최댓값)
/// 여기서, 0-2-4의 경우, 일단 다시 2인 경우의 수를 생각해보자면 2, 0-2 의 경우의 수를 가진다.
/// 둘 중 가장 큰 값을 자신의 인덱스 배열에 저장한다. 따라서 0-2-4는 앞에서 2와 0-2를 비교하여 자기 자신의 인덱스에 큰 값을
/// 넣었으므로, 따라서 2-4만 비교하면 된다. (2의 경우 앞에서 설명했다 시피 2와 0-2중 큰 값을 자기 자신의 인덱스에
/// 다시 넣었다는 것을 기억하자.)
/// 비교 후 4의 경우의 수 중 가장 큰 값을 자신의 인덱스 배열로 바꿔준다.
/// 따라서, 다시 요약하자면 4의 경우의 수를 따질 때 이미 2와 3은 max 값이 들어 가 있을 것이다.
/// (2 - 2, 0-2 중 큰 값) (3 - 3, 0-3, 1-3 중 가장 큰 값)
/// 해당 인덱스의 max 값을 구했다면 return 할 변수와 값을 비교하여 더 큰 경우 max 값을 갱신 시켜준다.
/// https://iawale.medium.com/max-array-sum-hackerrank-medium-using-inplace-dynamic-programming-215a620d7705
/// 위의 링크를 참조하여 재해석해서 구현하였다. (시간은 링크에 나와있는 경우의 수가 훨씬 더 빠르다)
/// 
/// - Date: 2021/12/02
/// - Author: Oh Dongeeon
/// - Link: https://www.hackerrank.com/challenges/max-array-sum
///
func maxSubsetSum(arr: [Int]) -> Int {
    guard !arr.isEmpty else { return 0 }
    guard arr.count != 1 else { return arr[0] }
    
    var arr = arr
    var answer = max(arr[0], arr[1])
    
    for outerIndex in 2..<arr.count {
        var maxValue = arr[outerIndex]
        for innerIndex in 0...outerIndex - 2 {
            let expectedMax = arr[outerIndex] + arr[innerIndex]
            maxValue = maxValue < expectedMax ? expectedMax : maxValue
        }
        
        arr[outerIndex] = maxValue
        answer = answer < maxValue ? maxValue : answer
    }
    
    return answer > 0 ? answer : 0
}

/// medium 링크를 통해 재구현한 코드
///
/// - Date: 2021/12/02
/// - Author: Oh Donggeon
/// - Link: https://iawale.medium.com/max-array-sum-hackerrank-medium-using-inplace-dynamic-programming-215a620d7705
///
func maxSubsetSum2(arr: [Int]) -> Int {
    guard !arr.isEmpty else { return 0 }
    guard arr.count != 1 else { return arr[0] }
    
    var arr = arr
    var answer = max(arr[0], arr[1])
    
    arr[1] = answer
    
    for index in 2..<arr.count {
        answer = max(arr[index - 2] + arr[index], answer)
        answer = max(arr[index], answer)
        arr[index] = answer
    }
    
    return answer > 0 ? answer : 0
}
