import Cocoa

// Check the requirements of the problem here: https://leetcode.com/problems/container-with-most-water/

// Find the heighest value
// Go down from that and check each area size with smaller values
// Store and sort each size
// return the biggest area size

let input: [Int] = [1, 8, 6, 2, 5, 4, 8, 3, 7]

func getTheLargestContainer (_ input: [Int]) -> Int {
    
    guard input.count > 1 else {
        return input[0]
    }
    
    var maxSizeArea = 0
        
    for i in 0..<input.count {
        for j in 0..<input.count {
            
            var area: Int = 0
            
            if input[i] > input[j] {
                area = input[j] * (i>j ? i-j : j-i)
            } else if input[i] < input[j] {
                area = input[i] * (i>j ? i-j : j-i)
            }
            
            if area > maxSizeArea {
                maxSizeArea = area
            }
        }
    }
    
    return maxSizeArea
}

let result = getTheLargestContainer(input)
print(result)
