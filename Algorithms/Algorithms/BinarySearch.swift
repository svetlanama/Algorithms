//
//  ИштфкнЫуфкср.swift
//  Algorithms
//
//  Created by Svitlana Moiseyenko on 7/26/17.
//  Copyright © 2017 Svitlana Moiseyenko. All rights reserved.
//

import Foundation


//O(log n)


func binarySearch(param: Int, sortedArr: [Int]) -> Bool {
    
    if sortedArr.count == 1 {
        if sortedArr[0] == param {
            print("Found  \(param) value in:\(sortedArr)")
            return true
        } else {
            print("Not found  \(param) value in:\(sortedArr)")
            return false
        }
   
    }

    let half = sortedArr[sortedArr.count / 2 ]
    let actual = param >= half ? Array(sortedArr[sortedArr.count/2...sortedArr.count - 1]) :   Array(sortedArr[0...sortedArr.count / 2 - 1])
    return binarySearch(param: param, sortedArr: actual)
}
