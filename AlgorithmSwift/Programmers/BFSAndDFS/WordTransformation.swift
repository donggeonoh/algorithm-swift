//
//  WordTransformation.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/11/28.
//

import Foundation

/// 프로그래머스 DFS와 BFS 단어변동 문제 솔루션
///
/// - Date: 2021/11/28
/// - Author: Oh Donggeon
///
func wordTransformation(_ begin: String, _ target:String, _ words:[String]) -> Int {
    typealias CountWord = (word: String, visited: [Bool], count: Int)
    
    var queue = DoubleStackQueue<CountWord>()
    var answer = Int.max
    
    queue.enqueue(CountWord(begin, Array(repeating: false, count: words.count), 0))
    
    while !queue.isEmpty {
        let curWord = queue.dequeue()
        guard curWord.word != target else {
            if answer > curWord.count {
                answer = curWord.count
            }
            continue
        }
        
        for (index, word) in words.enumerated() {
            guard curWord.visited[index] == false else { continue }
            
            if isWordDiffOnce(curWord.word, word) {
                var visited = curWord.visited
                visited[index] = true
                
                queue.enqueue(CountWord(word, visited, curWord.count + 1))
            }
        }
    }
    
    return answer == Int.max ? 0 : answer
}

private func isWordDiffOnce(_ word: String, _ comp: String) -> Bool {
    let wordArr = Array(word)
    let compArr = Array(comp)
    var count = 0
    
    for index in 0..<word.count {
        if wordArr[index] != compArr[index] {
            count += 1
        }
    }
    
    return count ==  1 ? true : false
}

/*
 private func isWordsDiffOnce(_ word: String, _ target: String, _ char: Character) -> Bool {
 let wordArr = Array(word)
 let targetArr = Array(target)
 
 guard word.count == target.count else { return false }
 
 for index in 0..<word.count {
 if wordArr[index] == char {
 if targetArr[index] == char {
 return true
 }
 }
 }
 
 return false
 }
 */
