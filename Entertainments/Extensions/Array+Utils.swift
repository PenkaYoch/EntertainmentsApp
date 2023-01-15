//
//  Array+Utils.swift
//  Entertainments
//
//  Created by Penka Yochkova on 27.12.22.
//

import Foundation

extension Array where Element: Comparable {
    
    /*
     * Bubble Sort algorithm
     */
    func bubbleSort(by areInIncreasingOrder: ((Element, Element) -> Bool) = (<)) -> [Element] {
        var data = self
        
        for i in 0..<(data.count - 1) { // 1
            for j in 0..<(data.count - i - 1) where areInIncreasingOrder(data[j+1], data[j]) { // 2
                data.swapAt(j, j + 1)
            }
        }
        
        return data
    }
    
    func swap<T: Comparable>(left: inout T, right: inout T) {
        // swap left and right element
        let temp = right
        right = left
        left = temp
    }
}
