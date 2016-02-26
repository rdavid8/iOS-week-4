//: Playground - noun: a place where people can play

import UIKit

//Given a string, return a string where for every char in the original, there are two chars. * Example: doubleChar("The") → "TThhee"

func twoCharacters(string: String)->String
{
    var twoString = ""
    for character in string.characters{
        twoString.append(character)
        twoString.append(character)
    }
    
    return twoString
}


twoCharacters("test")
twoCharacters("codefellows")