//: Playground - noun: a place where people can play

import UIKit


func middleOfArray(array: [Int]) -> [Int]
{
    let sampleArray = array.count
    let divided = 2
    let middle = sampleArray/divided
    let beginning = middle - 1
    let end = middle + 1
    
    return [array[beginning], array[middle], array[end]]
}

var demoArray = [5, 10, 15, 20, 25, 30, 35]

middleOfArray(demoArray)

