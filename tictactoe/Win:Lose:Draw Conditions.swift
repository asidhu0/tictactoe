//
//  Win:Lose:Draw Conditions.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 7/30/22.
//

import SwiftUI

func checkForDraw(in move: [Move?]) -> Bool{
    var count: Int = 0
    for i in 0...8 {
        if ((move[i]?.checkIfOccupied) != nil) {
            count = count + 1
        }
    }
    if count == 9 {
        return true
    }
    return false
}

func checkForWinHuman(in move: [Move?]) -> Bool {
    var win: Bool = false
    let winPatterns: [[Int]] = [[0,1,2], [0,3,6], [0,4,8], [1,4,7], [2,4,6], [2,5,8], [3,4,5], [2,5,8], [6,7,8]]
    for i in 0...8 {
        win = winCombinationsHuman(in: winPatterns[i], in: move)
        if win {
            break
        }
    }
    return win
}

func checkForWinComputer(in move: [Move?]) -> Bool {
    var win: Bool = false
    let winPatterns: [[Int]] = [[0,1,2], [0,3,6], [0,4,8], [1,4,7], [2,4,6], [2,5,8], [3,4,5], [2,5,8], [6,7,8]]
    for i in 0...8 {
        win = winCombinationsComputer(in: winPatterns[i], in: move)
        if win {
            break
        }
    }
    return win
}

func winCombinationsHuman(in combos: [Int], in moves: [Move?]) -> Bool {
    if (moves[combos[0]]?.indicator == "xmark" && moves[combos[1]]?.indicator == "xmark" && moves[combos[2]]?.indicator == "xmark")  {
        return true
    }
    return false
}

func winCombinationsComputer(in combos: [Int], in moves: [Move?]) -> Bool {
    if (moves[combos[0]]?.indicator == "circle" && moves[combos[1]]?.indicator == "circle" && moves[combos[2]]?.indicator == "circle") {
        return true
    }
    return false
}

func resetGame() {
    moves =  Array(repeating: nil, count: 9)
}
