import Cocoa

// Write a function called maxSubarraySum which accepts an array of integers and a number called n. The function should calculate the maximum sum of n consecutive elements in the array.
//eg. maxSubarraySum([1, 2, 4, 2, 8, 1, 5], 2) --> 10


func maxSubarraySum(_ array: [Int], _ sub: Int) -> Int {
    
    var maxSum = 0
    var tempSum = 0
    
    if (array.count < sub) { return 0 }
        
        for i in 0..<sub {
        maxSum += array[i]
    }
    tempSum = maxSum
    
    for i in sub..<array.count {
        tempSum = tempSum - array[i-sub] + array[i]
        maxSum = max(maxSum, tempSum)
    }
    return maxSum
}

print(maxSubarraySum([1, 2, 4, 2, 8, 1, 5], 2))
