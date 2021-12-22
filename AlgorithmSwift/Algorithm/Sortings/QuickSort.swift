//
//  QuickSort.swift
//  AlgorithmSwift
//
//  Created by Oh Donggeon on 2021/11/26.
//

import Foundation

func quickSort<T: Comparable>(_ arr: [T]) -> [T] {
    var arr = arr
    
    quickSort(&arr, arr.startIndex, arr.index(before: arr.endIndex))
    
    return arr
}

private func quickSort<T: Comparable>(_ arr: inout [T], _ lowIndex: Int, _ highIndex: Int) {
    guard arr.count > 1 else { return }
    
    let pivot = arr[lowIndex]
    
    var leftIndex = lowIndex + 1
    var rightIndex = highIndex
    
    repeat {
        for index in leftIndex... {
            guard index != rightIndex + 1 else { break }
            
            leftIndex = index
            
            if arr[index] > pivot {
                break
            }
        }
        
        for index in (rightIndex...).reversed() {
            guard index != leftIndex - 1 else { break }
            
            rightIndex = index
            
            if arr[index] < pivot {
                break
            }
        }
        
        if leftIndex == rightIndex + 1 {
            arr.insert(pivot, at: leftIndex)
        }
        
        arr.swapAt(leftIndex, rightIndex)
        
    } while leftIndex < rightIndex
    
    quickSort(&arr, lowIndex, leftIndex - 1)
    quickSort(&arr, leftIndex + 1, highIndex)
}
