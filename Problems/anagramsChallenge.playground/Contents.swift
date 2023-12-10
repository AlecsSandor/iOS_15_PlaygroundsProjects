import Foundation

// Given two strings, write a func to determine if the second string is an anagaram of the first.
// anagram eg. cinema - iceman
// eg. validAnagram('anagram', 'nagaram') true

// Solving this using the Frequency Counter pattern

    // * Iterate through the first word and save in a dictionary every char and its recurency
    // * Iterate through the second word and check to see if every char has the same recurency and if there are no extra chars

func validAnagram(_ firstWord: String,_ secondWord: String) -> Void {
    
    var firstDic: [Character: Int] = [:]
    
    if firstWord.count != secondWord.count {
        print("Nope.")
        return
    }
    
    for char in firstWord {
        if firstDic[char] == nil {
            firstDic[char] = 1
        } else {
            firstDic[char] = firstDic[char]! + 1
        }
    }
    
    for char in secondWord {
        if firstDic[char] != nil && firstDic[char] != 0 {
            firstDic[char] = firstDic[char]! - 1
            if firstDic[char]! == 0 {
                firstDic.removeValue(forKey: char)
            }
        } else {
            print("Nope.")
            return
        }
    }
    
    print("The two words are an anagram.")
    
}

validAnagram("anagram", "nagaram")
