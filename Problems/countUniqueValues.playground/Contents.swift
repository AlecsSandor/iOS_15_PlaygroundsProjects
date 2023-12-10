import Cocoa
// Implement a function called countUniqueValues, which accepts a sorted array, and counts the unique values in the array. There can be negative numbers in the array, but it will always be sorted

//eg. countUniqueValues([-1 ,1 ,1, 1, 2]) --> 3

func countUniqueValues(_ arrr: [Int]) -> Int {
    if arrr.count == 0 { return 0 }
    var arr: [Int] = arrr
    var i = 0
    for j in 1..<arr.count {
        if arr[i] != arr[j] {
            i += 1
            arr[i] = arr[j]
        }
    }
    return i+1
}

print(countUniqueValues([1, 1, 2, 3, 3, 4, 5, 6, 6, 7, 3432, 232, 232]))
