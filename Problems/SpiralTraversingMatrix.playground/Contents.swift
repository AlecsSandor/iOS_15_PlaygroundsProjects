import Foundation

// Spiral Travers
// Given an m-n matrix, return all elements of the matrix in spiral order
//eg.

// 1 2 3
// 4 5 6
// 7 8 9 -> 1 2 3 6 9 8 7 4 5

//1  2  3  4  5
//6  7  8  9  10
//11 12 13 14 15
//16 17 18 19 20

//1  2  3  4  5  6
//7  8  9  10 11 12
//13 14 15 16 17 18
//19 20 21 22 23 24
//25 26 27 28 29 30

//--> 1 2 3 6 9 8 7 4 5



// Set the number of rows and cols of the matrix
let ROWS: Int = 7
let COLS: Int = 10
var resultArray: [Int] = []

/// generate the matrix - this part might not be neccesary but it helped me with the thinking process
func generateMatrix(_ ROWS: Int, _ COLS: Int) -> [[Int]] {
    var myMatrix: [[Int]] = []
    
    var counter = 1
    
    for _ in 0..<ROWS {
        var row: [Int] = []
        for _ in 0..<COLS {
            row.append(counter)
            counter += 1
        }
        myMatrix.append(row)
    }
    
    return myMatrix
}

func spiralTraversing() {
    traversBorders(myMatrix)
}

/// iterating throw the matrix and saving the borders in an array
func traversBorders(_ mainMatrix: [[Int]]) -> Void {
    
    var numRows = mainMatrix.count
    var numColumns = 0
    if let firstRow = mainMatrix.first {
        numColumns = firstRow.count
    }

    var leftBorder: [Int] = []
    var bottomBorder: [Int] = []
    var remaingMatrix: [[Int]] = []
    
    for i in 0..<numRows {
        var row: [Int] = []
        for j in 0..<numColumns {
            if i == 0 {
                /// saving the top border
                resultArray.append(mainMatrix[i][j])
            } else if i > 0 && j == numColumns - 1 {
                /// saving the right border
                resultArray.append(mainMatrix[i][j])
            } else if i == numRows - 1 {
                /// saving the bottom border
                bottomBorder.append(mainMatrix[i][j])
            } else if i != 0 && i != numRows - 1 && j == 0 {
                /// saving the left border
                leftBorder.append(mainMatrix[i][j])
            } else {
                /// saving the remaing matrix
                row.append(mainMatrix[i][j])
            }
        }
        remaingMatrix.append(row)
    }
    
    /// the left and bottom border need to be reversed since the traversing was from left to right and up to down
    resultArray += bottomBorder.reversed()
    resultArray += leftBorder.reversed()

    let filteredMatrix = remaingMatrix.filter { !$0.isEmpty }
    print(filteredMatrix)
    
    if filteredMatrix.count == 1 {
        
        resultArray += filteredMatrix[0]
        print(resultArray)
        
    } else if filteredMatrix.count > 1  {
    
        traversBorders(filteredMatrix)
        
    } else if filteredMatrix.isEmpty {
        
        print(resultArray)
        
    }
}

var myMatrix = generateMatrix(ROWS, COLS)
spiralTraversing()

