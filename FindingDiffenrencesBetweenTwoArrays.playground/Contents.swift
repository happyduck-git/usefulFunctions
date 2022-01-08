import UIKit

extension Array where Element:Hashable {
    func findDifference(from other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))
    }
}

var array1 = [1,2,3,4,5]
var array2 = [2,3,5,6,7]

array1.findDifference(from:array2)
