//
//  InsertionSort.swift
//  Algorithms
//
//  Created by Svitlana Moiseyenko on 7/26/17.
//  Copyright © 2017 Svitlana Moiseyenko. All rights reserved.
//

import Foundation


// use increment approach 
// O(n^2)

func insertionSort(array: [Int]) {
    
    var arr = array
    
    for i in 2..<arr.count {
        let tmp = arr[i]
        var j = i - 1
        print("i:\(i)")
        print("j:\(j)")
        print("arr[j]:\(arr[j]), tmp:\(tmp)")
        while j > 0 && arr[j] > tmp {
            print("while arr[j + 1]:\(arr[j+1]),  arr[j]:\(arr[j])")
            arr[j + 1] = arr[j]
            
            j -= 1
            print("while arr[-1]:\(arr[j])")
        }
        arr[j + 1] = tmp 
    }
    
    if arr[0] > arr[1] {
        let tmp = arr[1]
        arr[1] = arr[0]
        arr[0] = tmp
    }
    
    print("result", arr)
}

// can do with recursion page  62 ex 2.3.4
// insertion sort row 5-7 instead linear search use binary
