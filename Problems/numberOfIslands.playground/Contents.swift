import Foundation

// Given an m x n 2D binary grid which represents a map of '1's (land) and '0's (water), return the number of islands.

// An Island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all
// four edges of the grid are all surrounded by water

//eg.
//1 1 1 1 0 0
//1 1 0 0 0 0
//0 0 0 1 1 0
//0 0 1 1 1 0 ---> 2 islands

// start going through the grid
// find all the 1s and store their coordinates
// iterated through the new 'land' array and save the first clump of land
// remove the already found islands from the land coordinates array and start over until the coordinates array is empty

// the best solution for this one would have to use the DFS traversal algorithm

let grid: [[Int]] = [
    [1, 0, 0, 0, 0, 1],
    [1, 1, 1, 0, 0, 1],
    [0, 0, 1, 0, 0, 0],
    [0, 0, 1, 0, 0, 0],
    [1, 0, 0, 0, 0, 1],
    [1, 1, 1, 0, 0, 1],
    [0, 0, 1, 0, 1, 0],
    [0, 0, 1, 0, 0, 0]
]

var numberOfIslands = 0

func goThroughGrid() {
    
    // get the dimensions of the grid
    var numRows = grid.count
    var numColumns = 0
    if let firstRow = grid.first {
        numColumns = firstRow.count
    }
    
    var land: [[Int]] = []
    
    for i in 0..<numRows {
        for j in 0..<numColumns {
            if grid[i][j] == 1 {
                land.append([i, j])
            }
        }
    }
    
    if land.count > 0 {
        numberOfIslands += 1
        checkNeighbors(land)
    } else {
        print("There are \(numberOfIslands) islands!")
    }
    
}

func checkNeighbors(_ land: [[Int]]) {
    
    var firstLand: [[Int]] = []
    
    for coordinate in 0..<land.count {
        
        if coordinate == 0 {
            firstLand.append(land[coordinate])
        } else if firstLand.contains( [land[coordinate][0] + 1, land[coordinate][1]] ) {
            firstLand.append(land[coordinate])
//            print("down")
        } else if firstLand.contains( [land[coordinate][0], land[coordinate][1] + 1] ) {
            firstLand.append(land[coordinate])
//            print("right")
        } else if firstLand.contains( [land[coordinate][0] - 1, land[coordinate][1]] ) {
            firstLand.append(land[coordinate])
//            print("up")
        } else if firstLand.contains( [land[coordinate][0], land[coordinate][1] - 1] ) {
            firstLand.append(land[coordinate])
//            print("left")
        } else {
//            print("break")
        }
    }
    
    var nextLand: [[Int]] = []
    
    for k in 0..<land.count {
        if !(firstLand.contains(land[k])) {
            nextLand.append(land[k])
        }
    }
    
    if nextLand.count > 0 {
        numberOfIslands += 1
        checkNeighbors(nextLand)
    } else {
        print("There are \(numberOfIslands) islands!")
    }
    
}

goThroughGrid()
