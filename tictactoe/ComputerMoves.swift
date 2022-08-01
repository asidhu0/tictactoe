//
//  ComputerMoves.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 7/30/22.
//

import SwiftUI

func computerMove(in move: [Move?]) {
    if computerCanWin(in: move) {
        return
    }
    if computerCanBlock(in: move) {
        return
    }
    if computerTakeMiddleSquare() {
        return
    }
    randomComputerMove(in: move)
}

func computerCanWin(in move: [Move?]) -> Bool {
    let winPatterns: [[Int]] = [[0,1,2], [0,3,6], [0,4,8], [1,4,7], [2,4,6], [2,5,8], [3,4,5], [2,5,8], [6,7,8]]
    var win: Bool = false
    for i in 0...8 {
        win = computerCanWinHelper(in: winPatterns[i])
        if win {
            return true //break
        }
    }
    return false // return
}

func computerCanWinHelper(in combo: [Int]) -> Bool {
    if moves[combo[0]]?.indicator == "circle" && moves[combo[1]]?.indicator == "circle" && moves[combo[2]] == nil {
        moves[combo[2]] = Move(player: .computer, boardIndex: combo[2], checkIfOccupied: true)
        return true
    }
    else if moves[combo[1]]?.indicator == "circle" && moves[combo[2]]?.indicator == "circle" && moves[combo[0]] == nil {
        moves[combo[0]] = Move(player: .computer, boardIndex: combo[0], checkIfOccupied: true)
        return true
    }
    else if moves[combo[0]]?.indicator == "circle" && moves[combo[2]]?.indicator == "circle" && moves[combo[1]] == nil {
        moves[combo[1]] = Move(player: .computer, boardIndex: combo[1], checkIfOccupied: true)
        return true
    }
    return false
}

func computerCanBlock(in move: [Move?]) -> Bool {
    let winPatterns: [[Int]] = [[0,1,2], [0,3,6], [0,4,8], [1,4,7], [2,4,6], [2,5,8], [3,4,5], [2,5,8], [6,7,8]]
    var win: Bool = false
    for i in 0...8 {
        win = computerCanBlockHelper(in: winPatterns[i])
        if win {
            return true //break
        }
    }
    return false // return
}

func computerCanBlockHelper(in combo: [Int]) -> Bool {
    if moves[combo[0]]?.indicator == "xmark" && moves[combo[1]]?.indicator == "xmark" && moves[combo[2]] == nil {
        moves[combo[2]] = Move(player: .computer, boardIndex: combo[2], checkIfOccupied: true)
        return true
    }
    else if moves[combo[1]]?.indicator == "xmark" && moves[combo[2]]?.indicator == "xmark" && moves[combo[0]] == nil {
        moves[combo[0]] = Move(player: .computer, boardIndex: combo[0], checkIfOccupied: true)
        return true
    }
    else if moves[combo[0]]?.indicator == "xmark" && moves[combo[2]]?.indicator == "xmark" && moves[combo[1]] == nil {
        moves[combo[1]] = Move(player: .computer, boardIndex: combo[1], checkIfOccupied: true)
        return true
    }
    return false
}

func computerTakeMiddleSquare() -> Bool {
    if moves[4] == nil {
        moves[4] = Move(player: .computer, boardIndex: 4, checkIfOccupied: true)
        return true
    }
    return false
}

func randomComputerMove(in move: [Move?]) {
    var computerPosition = Int.random(in: 0..<9)
    var positionCheckComputer: Bool = true
    while positionCheckComputer {
        if moves[computerPosition]?.checkIfOccupied == true{
            computerPosition = Int.random(in: 0..<9)
        }
        else {
        moves[computerPosition] = Move(player: .computer,
                                       boardIndex: computerPosition,
                                       checkIfOccupied: true)
            positionCheckComputer = false
        }
    }
}
