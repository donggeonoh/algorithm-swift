//
//  Permutation.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/11/25.
//

import Foundation

/// 순열 알고리즘 코드 작성
///
/// - Date: 2021/11/25
/// - Author: Oh Donggeon
///
func permutation<T>(_ arr: [T], _ select: Int) -> [[T]] {
    permutation(arr, [], Array(repeating: false, count: arr.count), select)
}

func permutation<T>(_ arr: [T], _ cur: [T], _ visited: [Bool], _ select: Int) -> [[T]] {
    var result: [[T]] = []
    
    guard cur.count != select else { return [cur] }
    
    for (index, element) in arr.enumerated() {
        guard visited[index] == false else { continue }
        
        var nextCur = cur
        var nextVisited = visited
        
        nextCur.append(element)
        nextVisited[index] = true
        
        result.append(contentsOf: permutation(arr, nextCur, nextVisited, select))
        
        let _ = nextCur.popLast()
    }
    
    return result
}
