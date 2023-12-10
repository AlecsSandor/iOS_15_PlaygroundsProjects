import Cocoa

// Merge Intervals
// Given an array of intervals where intervals[i] = [start, end], merge all overlaping intervals, and return an array
// of the non=overlapping intervals that cover all the intervals in the input
// --  I will assume that every interval is in ascending order

// input: [[1,3], [2,6], [8,10], [15,18]]
// output: [[1,6], [8.10], [15,18]]

var input: [[Int]] = [[1, 9], [4, 5], [12, 23], [20, 25], [21, 45], [5, 11]]
var newIntervals: [[Int]] = []
var count = 0

func mergeIntervals(_ input: [[Int]]) -> [[Int]] {
    guard input.count > 1 else {
        return input
    }
    
    // nlogn
    let sortedInput = input.sorted(by: { item1, item2 in
        return item1[0] < item2[0]
    })
    
    var result = [[Int]]()
    result.reserveCapacity(input.count)
    
    result.append(sortedInput[0])
    
    for i in 1..<sortedInput.count {
        let current = sortedInput[i]
        let lastInterval = result.last!
        
        if current[0] >= lastInterval[0] && current[0] <= lastInterval[1] {
            //Change last interval
            _ = result.removeLast()
            result.append([
                min(current[0], lastInterval[0]),
                min(current[1], lastInterval[1])
            ])
        } else {
            result.append(current)
        }
    }
    
    return result
}

let result = mergeIntervals(input)
print("\n\n\(result)\n")
