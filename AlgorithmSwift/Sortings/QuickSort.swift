//
//  QuickSort.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/11/26.
//

import Foundation

func quickSort<T: Comparable>(_ arr: [T]) -> [T] {
    guard arr.count > 1 else { return arr }
    
    var leftSubArr: [T] = []
    var rightSubArr: [T] = []
    
    let pivotIndex = arr.count / 2
    
    for index in 0..<pivotIndex {
        if arr[index] > arr[pivotIndex] { rightSubArr.append(arr[index]) }
        else { leftSubArr.append(arr[index]) }
    }
    
    for index in (pivotIndex + 1)..<arr.count {
        if arr[index] < arr[pivotIndex] { leftSubArr.append(arr[index]) }
        else { rightSubArr.append(arr[index]) }
    }
    
    return quickSort(leftSubArr) + [arr[pivotIndex]] + quickSort(rightSubArr)
}
