//
//  MergeSort.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/11/26.
//

import Foundation

func mergeSort<T: Comparable>(_ arr: [T]) -> [T] {
    guard arr.count > 1 else { return arr }
    
    let leftSubArr = mergeSort(Array(arr[..<(arr.count / 2)]))
    let rightSubArr = mergeSort(Array(arr[(arr.count / 2)...]))
    var mergeArr: [T] = []
    
    var leftSubArrIndex = 0
    var rightSubArrIndex = 0
    
    while (leftSubArrIndex != leftSubArr.count) &&
            (rightSubArrIndex != rightSubArr.count) {
        if leftSubArrIndex == leftSubArr.count {
            mergeArr.append(contentsOf: rightSubArr)
            break
        } else if rightSubArrIndex == rightSubArr.count {
            mergeArr.append(contentsOf: leftSubArr)
            break
        }
        
        if leftSubArr[leftSubArrIndex] < rightSubArr[rightSubArrIndex] {
            mergeArr.append(leftSubArr[leftSubArrIndex])
            leftSubArrIndex += 1
        } else {
            mergeArr.append(rightSubArr[rightSubArrIndex])
            rightSubArrIndex += 1
        }
    }
    
    return mergeArr
}
