//: [Previous](@previous)

/*:
 Merge sort is a sorting algorithm that has lower order running time than the insertion sort algorithm. Conceptually it is a devide and conquer sorting algorithm.

The algorithm works by using recursion - it will divide an unsorted list into two parts - this is Divide part.

The next phaze is Conquer - it recursively sorts sublists and if they are small enough then solve their base case.

Base case is a situation when a list has a single item or it is empty.

The final phase is Conbine - it merges the sorted sublists into a sorted sequence and return the elements back.
*/

/*:
 The following implementation is based on Arrays and is significantly slower than alternative Linked-List implementation. The performance difference increases with the number of elements to be sorted.
 */

// MARK: - Array extension that adds support for Merge sort algorithm
extension Array where Element: Comparable {

    /// Sorts an array of Comparable elements using Merge sort algorithm
    ///
    /// - Parameter list: is an Array of Comparable elements
    /// - Returns: the same sorted Array
    public func mergeSort(_ list: [Element]) -> [Element] {

        if list.count < 2 { return list }
        let center = (list.count) / 2
        
        let leftMergeSort = mergeSort([Element](list[0..<center]))
        let rightMergeSort = mergeSort([Element](list[center..<list.count]))
        
        return merge(left: leftMergeSort, right: rightMergeSort)
    }

    /// Helper method that performs Conquer and Combine stages for the Merge sort algorithm
    ///
    /// - Parameters:
    ///   - lhalf: is an Array containing left half of the target array that needs to be sorted
    ///   - rhalf: is an Array containing right hald of the target array that needs to be sorted
    /// - Returns: a Combined array of Comparable elements
    private func merge(left lhalf: [Element], right rhalf: [Element]) -> [Element] {
        
        var leftIndex = 0
        var rightIndex = 0
        let totalCapacity = lhalf.count + rhalf.count
        
        var temp = [Element]()
        temp.reserveCapacity(totalCapacity)
        
        while leftIndex < lhalf.count && rightIndex < rhalf.count {
            let leftElement = lhalf[leftIndex]
            let rightElement = rhalf[rightIndex]
            
            if leftElement < rightElement {
                temp.append(leftElement)
                leftIndex += 1
            } else if leftElement > rightElement {
                temp.append(rightElement)
                rightIndex += 1
            } else {
                temp.append(leftElement)
                temp.append(rightElement)
                leftIndex += 1
                rightIndex += 1
            }
        }
        
        temp += [Element](lhalf[leftIndex..<lhalf.count])
        temp += [Element](rhalf[rightIndex..<rhalf.count])
        
        return temp
    }
    
}


//: [Next](@next)
