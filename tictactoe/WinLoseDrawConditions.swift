//
//  Win:Lose:Draw Conditions.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 7/30/22.
//

import SwiftUI

func checkForDraw(move: [Move?]) -> Bool{
    return move.allSatisfy { $0 != nil }
}

func checkForWin(move: [Move?], piece: String) -> Bool {
    var win: Bool = false
    let winPatterns: [[Int]] = [[0,1,2], [0,3,6], [0,4,8], [1,4,7], [2,4,6], [2,5,8], [3,4,5], [2,5,8], [6,7,8]]
    for i in 0...8 {
            win = winCombinations(combos: winPatterns[i], moves: move, piece: piece)
            if win {
                return true
            }
    }
    return false
}

func winCombinations(combos: [Int], moves: [Move?], piece: String) -> Bool {
    return (moves[combos[0]]?.indicator == piece && moves[combos[1]]?.indicator == piece && moves[combos[2]]?.indicator == piece)
}


func resetGame(moves: inout [Move?]) {
    moves = Array(repeating: nil, count: 9)
}
