//
//  Combination.swift.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/11/25.
//

import Foundation

/// 조합 알고리즘 코드 작성
///
/// - Date: 2021/11/25
/// - Author: Oh Donggeon
/// 
func combination<T>(_ arr: [T], _ select: Int) -> [[T]] {
    combination(arr, [], Array(repeating: false, count: arr.count), 0, select)
}

private func combination<T>(_ arr: [T], _ cur: [T], _ visited: [Bool], _ index: Int, _ select: Int) -> [[T]] {
    guard select != cur.count else { return [cur] }
    
    var result: [[T]] = []
    
    for index in index..<arr.count {
        guard visited[index] == false else { continue }
        
        var nextCur = cur
        var nextVisited = visited
        
        nextCur.append(arr[index])
        nextVisited[index] = true
        
        result.append(contentsOf: combination(arr, nextCur, nextVisited, index + 1, select))
        
        let _ = nextCur.popLast()
    }
    
    return result
}

/// 중복 조합 알고리즘 작성
///
/// - Date: 2021/11/26
/// - Author: Oh Donggeon
///
func combination<T>(withRepetition arr: [T], _ select: Int) -> [[T]] {
    combination(withRepetition: arr, [], 0, select)
}

private func combination<T>(withRepetition arr: [T], _ cur: [T], _ index: Int, _ select: Int) -> [[T]] {
    guard select != cur.count else { return [cur] }
    
    var result: [[T]] = []
    
    for index in index..<arr.count {
        var nextCur = cur
        
        nextCur.append(arr[index])
        result.append(contentsOf: combination(withRepetition: arr, nextCur, index, select))
        
        let _ = nextCur.popLast()
    }
    
    return result
}

