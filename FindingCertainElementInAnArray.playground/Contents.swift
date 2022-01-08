import UIKit

//Find zeros and count how many zeros are in an array
let numbers = [0,0,0,1,2,3,5,0,2,6,0,70,0,8,0]
let zeros = numbers.filter{$0 == 0}.count

print(zeros)
