import UIKit
//
//Given a non-negative number "num", return true if num is within 2 of a multiple of 10. Note: (a % b) is the remainder of dividing a by b, so (7 % 5) is 2


func numberOfTen(num:Int) -> Bool
{
    if num % 10 == 8 {
        return true
    } else if num % 10 == 9 {
        return true
    } else if num % 10 == 0 {
        return true
    } else if num % 10 == 1 {
        return true
    } else if num % 10 == 2 {
        return true
    } else {
        return false
    }
}

numberOfTen(7)
numberOfTen(45)
numberOfTen(9)
numberOfTen(10)
numberOfTen(11)
numberOfTen(22)
numberOfTen(24)
