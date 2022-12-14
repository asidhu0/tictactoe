//
//  ComputerMoves.swift
//  tictactoe
//
//  Created by Avnoor Singh Sidhu on 7/30/22.
//
import SwiftUI

/*
Board Indices:
    0 1 2
    3 4 5
    6 7 8
 */

func easyComputerMove(move: inout [Move?], turn: Bool, computerPiece: String, playerPiece: String) {
    randomComputerMove(moves: &move, turn: turn) 
}

func mediumComputerMove(move: inout [Move?], turn: Bool, computerPiece: String, playerPiece: String) {
    if computerCanWin(move: &move, turn: turn, computerPiece: computerPiece) {
        return
    }
    else if computerCanBlock(move: &move, turn: turn, playerPiece: playerPiece) {
        return
    }
    else {
        randomComputerMove(moves: &move, turn: turn)
    }
}

func hardComputerMove(move: inout [Move?], turn: Bool, computerPiece: String, playerPiece: String) {
    if computerCanWin(move: &move, turn: turn, computerPiece: computerPiece) {
        return
    }
    else if computerCanBlock(move: &move, turn: turn, playerPiece: playerPiece) {
        return
    }
    else if computerTakeMiddleSquare(moves: &move, turn: turn) {
        return
    }
    else {
        randomComputerMove(moves: &move, turn: turn)
    }
}

func impossibleComputerMove(move: inout [Move?], turn: Bool, computerPiece: String, playerPiece: String) {
    if computerCanWin(move: &move, turn: turn, computerPiece: computerPiece) {
        return
    }
    else if computerCanBlock(move: &move, turn: turn, playerPiece: playerPiece) {
        return
    }
    else if computerTakeMiddleSquare(moves: &move, turn: turn) {
        return
    }
    else if playerTakesIndex0First(moves: &move, turn: turn, computerPiece: computerPiece, playerPiece: playerPiece) {  // upper left hand corner
        return
    }
    else if playerTakesIndex1First(moves: &move, turn: turn, computerPiece: computerPiece, playerPiece: playerPiece) {
        return
    }
    else if playerTakesIndex2First(moves: &move, turn: turn, computerPiece: computerPiece, playerPiece: playerPiece) {  // upper right hand corner
        return
    }
    else if playerTakesIndex3First(moves: &move, turn: turn, computerPiece: computerPiece, playerPiece: playerPiece) {
        return
    }
    else if playerTakesIndex4First(moves: &move, turn: turn, computerPiece: computerPiece, playerPiece: playerPiece) {  // center
        return
    }
    else if playerTakesIndex5First(moves: &move, turn: turn, computerPiece: computerPiece, playerPiece: playerPiece) {
        return
    }
    else if playerTakesIndex6First(moves: &move, turn: turn, computerPiece: computerPiece, playerPiece: playerPiece) {  // lower left hand corner
        return
    }
    else if playerTakesIndex7First(moves: &move, turn: turn, computerPiece: computerPiece, playerPiece: playerPiece) {
        return
    }
    else if playerTakesIndex8First(moves: &move, turn: turn, computerPiece: computerPiece, playerPiece: playerPiece) {  // lower right hand corner
        return
    }
    else {
        randomComputerMove(moves: &move, turn: turn)
    }
}

func computerCanWin(move: inout [Move?], turn: Bool, computerPiece: String) -> Bool {
    let winPatterns: [[Int]] = [[0,1,2], [0,3,6], [0,4,8], [1,4,7], [2,4,6], [2,5,8], [3,4,5], [2,5,8], [6,7,8]]
    var win: Bool = false
    for i in 0...8 {
        win = computerCanWinHelper(moves: &move, combo: winPatterns[i], turn: turn, computerPiece: computerPiece)
        if win {
            return true
        }
    }
    return false
}

func computerCanWinHelper(moves: inout [Move?], combo: [Int], turn: Bool, computerPiece: String) -> Bool {
    if moves[combo[0]]?.indicator == computerPiece && moves[combo[1]]?.indicator == computerPiece && moves[combo[2]] == nil {
        moves[combo[2]] = Move(player: !turn ? .human : .computer, boardIndex: combo[2])
        return true
    }
    else if moves[combo[1]]?.indicator == computerPiece && moves[combo[2]]?.indicator == computerPiece && moves[combo[0]] == nil {
        moves[combo[0]] = Move(player: !turn ? .human : .computer, boardIndex: combo[0])
        return true
    }
    else if moves[combo[0]]?.indicator == computerPiece && moves[combo[2]]?.indicator == computerPiece && moves[combo[1]] == nil {
        moves[combo[1]] = Move(player: !turn ? .human : .computer, boardIndex: combo[1])
        return true
    }
    return false
}

func computerCanBlock(move: inout [Move?], turn: Bool, playerPiece: String) -> Bool {
    let winPatterns: [[Int]] = [[0,1,2], [0,3,6], [0,4,8], [1,4,7], [2,4,6], [2,5,8], [3,4,5], [2,5,8], [6,7,8]]
    var win: Bool = false
    for i in 0...8 {
        win = computerCanBlockHelper(moves: &move, combo: winPatterns[i], turn: turn, playerPiece: playerPiece)
        if win {
            return true
        }
    }
    return false
}

func computerCanBlockHelper(moves: inout [Move?], combo: [Int], turn: Bool, playerPiece: String) -> Bool {
    if moves[combo[0]]?.indicator == playerPiece && moves[combo[1]]?.indicator == playerPiece && moves[combo[2]] == nil {
        moves[combo[2]] = Move(player: !turn ? .human : .computer, boardIndex: combo[2])
        return true
    }
    else if moves[combo[1]]?.indicator == playerPiece && moves[combo[2]]?.indicator == playerPiece && moves[combo[0]] == nil {
        moves[combo[0]] = Move(player: !turn ? .human : .computer, boardIndex: combo[0])
        return true
    }
    else if moves[combo[0]]?.indicator == playerPiece && moves[combo[2]]?.indicator == playerPiece && moves[combo[1]] == nil {
        moves[combo[1]] = Move(player: !turn ? .human : .computer, boardIndex: combo[1])
        return true
    }
    return false
}

func computerTakeMiddleSquare(moves: inout [Move?], turn: Bool) -> Bool {
    if moves[4] == nil {
        moves[4] = Move(player: !turn ? .human : .computer, boardIndex: 4)
        return true
    }
    return false
}

func randomComputerMove(moves: inout [Move?], turn: Bool) {
    var computerPosition = Int.random(in: 0..<9)
    var positionCheckComputer: Bool = true
    while positionCheckComputer {
        if moves[computerPosition] != nil {
            computerPosition = Int.random(in: 0..<9)
        }
        else {
//        moves[computerPosition] = Move(player: !turn ? .human : .computer, boardIndex: computerPosition)
            moves[computerPosition] = Move(player: !turn ? .human : .computer, boardIndex: computerPosition)
            positionCheckComputer = false
        }
    }
}

// playerTakesIndex0First: player takes index 0, AI takes index 4
// playerTakesIndex0First #1: Player takes index 8
// playerTakesIndex0First #2: Player takes index 5
// playerTakesIndex0First #3: Player takes index 7

func playerTakesIndex0First(moves: inout [Move?], turn: Bool, computerPiece: String, playerPiece: String) -> Bool{
    // index 0 is taken by player and index 4 is taken by AI
        if moves[0]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[8]?.indicator == playerPiece && moves[1] == nil && moves[2] == nil && moves[3] == nil &&
            moves[5] == nil && moves[6] == nil && moves[7] == nil {  // playerTakesIndex0First #1
            makeMove(moves: &moves, availableIndices: [1, 3, 5, 7], turn: turn)
            return true
        }
        else if moves[0]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[5]?.indicator == playerPiece &&
            moves[1] == nil && moves[2] == nil && moves[3] == nil &&
            moves[6] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex0First #2
            moves[8] = Move(player: !turn ? .human : .computer, boardIndex: 8)
            return true
        }
        else if moves[0]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[7]?.indicator == playerPiece &&
            moves[1] == nil && moves[2] == nil && moves[3] == nil &&
            moves[5] == nil && moves[6] == nil && moves[8] == nil {  // playerTakesIndex0First #3
            moves[8] = Move(player: !turn ? .human : .computer, boardIndex: 8)
            return true
        }
    return false
}

// playerTakesIndex2First: player takes index 2, AI takes index 4
// playerTakesIndex2First #1: Player takes index 6
// playerTakesIndex2First #2: Player takes index 3
// playerTakesIndex2First #3: Player takes index 7

func playerTakesIndex2First(moves: inout [Move?], turn: Bool, computerPiece: String, playerPiece: String) -> Bool {
    // index 2 is taken by player and index 4 is taken by AI
        if moves[2]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[6]?.indicator == playerPiece &&
            moves[0] == nil && moves[1] == nil && moves[3] == nil &&
            moves[5] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex2First #1
            makeMove(moves: &moves, availableIndices: [1, 3, 5, 7], turn: turn)
            return true
        }
        else if moves[2]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[3]?.indicator == playerPiece &&
            moves[0] == nil && moves[1] == nil && moves[5] == nil &&
            moves[6] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex2First #2
            moves[6] = Move(player: !turn ? .human : .computer, boardIndex: 6)
            return true
        }
        else if moves[2]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[7]?.indicator == playerPiece &&
            moves[0] == nil && moves[1] == nil && moves[3] == nil &&
            moves[5] == nil && moves[6] == nil && moves[8] == nil {  // playerTakesIndex2First #3
            moves[6] = Move(player: !turn ? .human : .computer, boardIndex: 6)
            return true
        }
    return false
}

// playerTakesIndex8First: player takes index 8, AI takes index 4
// playerTakesIndex8First #1: Player takes index 0
// playerTakesIndex8First #2: Player takes index 3
// playerTakesIndex8First #3: Player takes index 1

func playerTakesIndex8First(moves: inout [Move?], turn: Bool, computerPiece: String, playerPiece: String) -> Bool {
    // index 8 is taken by player and index 4 is taken by AI
        if moves[8]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[0]?.indicator == playerPiece &&         moves[1] == nil && moves[2] == nil && moves[3] == nil &&
            moves[5] == nil && moves[6] == nil && moves[7] == nil {  // playerTakesIndex8First #1
            makeMove(moves: &moves, availableIndices: [1, 3, 5, 7], turn: turn)
            return true
        }
        else if moves[8]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[3]?.indicator == playerPiece &&
            moves[0] == nil && moves[1] == nil && moves[2] == nil &&
            moves[5] == nil && moves[6] == nil && moves[7] == nil {  // playerTakesIndex8First #2
            moves[0] = Move(player: !turn ? .human : .computer, boardIndex: 0)
            return true
        }
        else if moves[8]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[1]?.indicator == playerPiece &&
            moves[0] == nil && moves[2] == nil && moves[3] == nil &&
            moves[5] == nil && moves[6] == nil && moves[7] == nil {  // playerTakesIndex8First #3
            moves[0] = Move(player: !turn ? .human : .computer, boardIndex: 0)
            return true
        }
    return false
}

// playerTakesIndex6First: player takes index 6, AI takes index 4
// playerTakesIndex6First #1: Player takes index 2
// playerTakesIndex6First #2: Player takes index 5
// playerTakesIndex6First #3: Player takes index 1

func playerTakesIndex6First(moves: inout [Move?], turn: Bool, computerPiece: String, playerPiece: String) -> Bool {
    // index 6 is taken by player and index 4 is taken by AI
        if moves[6]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[2]?.indicator == playerPiece &&
            moves[0] == nil && moves[1] == nil && moves[3] == nil &&
            moves[5] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex6First #1
            makeMove(moves: &moves, availableIndices: [1, 3, 5, 7], turn: turn)
            return true
        }
        else if moves[6]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[5]?.indicator == playerPiece &&
            moves[0] == nil && moves[1] == nil && moves[2] == nil &&
            moves[3] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex6First #2
            moves[2] = Move(player: !turn ? .human : .computer, boardIndex: 2)
            return true
        }
        else if moves[6]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[1]?.indicator == playerPiece &&      moves[0] == nil && moves[2] == nil && moves[3] == nil &&
            moves[5] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex6First #3
            moves[2] = Move(player: !turn ? .human : .computer, boardIndex: 2)
            return true
        }
    return false
}

func playerTakesIndex4First(moves: inout [Move?], turn: Bool, computerPiece: String, playerPiece: String) -> Bool {
    if moves[4]?.indicator == playerPiece && moves[0] == nil && moves[1] == nil && moves[2] == nil &&
        moves[3] == nil && moves[5] == nil && moves[6] == nil && moves[7] == nil && moves[8] == nil {
        makeMove(moves: &moves, availableIndices: [0, 2, 6, 8], turn: turn)
        return true
    }
    else if moves[4]?.indicator == playerPiece && moves[0]?.indicator == computerPiece && moves[8]?.indicator == playerPiece &&
        moves[1] == nil && moves[2] == nil && moves[3] == nil &&
        moves[5] == nil && moves[6] == nil && moves[7] == nil {
        makeMove(moves: &moves, availableIndices: [2, 6], turn: turn)
        return true
    }
    else if moves[4]?.indicator == playerPiece && moves[2]?.indicator == computerPiece && moves[6]?.indicator == playerPiece &&
        moves[0] == nil && moves[1] == nil && moves[3] == nil &&
        moves[5] == nil && moves[7] == nil && moves[8] == nil {
        makeMove(moves: &moves, availableIndices: [0, 8], turn: turn)
        return true
    }
    else if moves[4]?.indicator == playerPiece && moves[6]?.indicator == computerPiece && moves[2]?.indicator == playerPiece &&
        moves[0] == nil && moves[1] == nil && moves[3] == nil &&
        moves[5] == nil && moves[7] == nil && moves[8] == nil {
        makeMove(moves: &moves, availableIndices: [0, 8], turn: turn)
        return true
    }
    else if moves[4]?.indicator == playerPiece && moves[8]?.indicator == computerPiece && moves[0]?.indicator == playerPiece &&
        moves[1] == nil && moves[2] == nil && moves[3] == nil &&
        moves[5] == nil && moves[6] == nil && moves[7] == nil {
        makeMove(moves: &moves, availableIndices: [2, 6], turn: turn)
        return true
    }
    return false
}

// playerTakesIndex3First: player takes index 3, AI takes index 4
// playerTakesIndex3First #1: Player takes index 0 (random AI moves will draw)
// playerTakesIndex3First #2: Player takes index 1
// playerTakesIndex3First #3: Player takes index 2
// playerTakesIndex3First #4: Player takes index 5
// playerTakesIndex3First #5: Player takes index 6 (random AI moves will draw)
// playerTakesIndex3First #6: Player takes index 7
// playerTakesIndex3First #7: Player takes index 8

func playerTakesIndex3First(moves: inout [Move?], turn: Bool, computerPiece: String, playerPiece: String) -> Bool {
    if moves[3]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[1]?.indicator == playerPiece &&         moves[0] == nil && moves[2] == nil && moves[5] == nil &&
        moves[6] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex6First #2
        makeMove(moves: &moves, availableIndices: [0, 2, 6], turn: turn)
        return true
    }
    else if moves[3]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[2]?.indicator == playerPiece &&         moves[0] == nil && moves[1] == nil && moves[5] == nil &&
        moves[6] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex6First #3
        makeMove(moves: &moves, availableIndices: [0, 6, 7], turn: turn)
        return true
    }
    else if moves[3]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[5]?.indicator == playerPiece &&         moves[0] == nil && moves[1] == nil && moves[2] == nil &&
        moves[6] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex6First #4
        makeMove(moves: &moves, availableIndices: [0, 2, 6, 8], turn: turn)
        return true
    }
    else if moves[3]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[7]?.indicator == playerPiece &&         moves[0] == nil && moves[1] == nil && moves[2] == nil &&
        moves[5] == nil && moves[6] == nil && moves[8] == nil {  // playerTakesIndex6First #6
        makeMove(moves: &moves, availableIndices: [0, 6, 8], turn: turn)
        return true
    }
    else if moves[3]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[8]?.indicator == playerPiece &&         moves[0] == nil && moves[1] == nil && moves[2] == nil &&
        moves[5] == nil && moves[6] == nil && moves[7] == nil {  // playerTakesIndex6First #7
        makeMove(moves: &moves, availableIndices: [0, 1, 6], turn: turn)
        return true
    }
    return false
}

// playerTakesIndex5First: player takes index 5, AI takes index 4
// playerTakesIndex5First #1: Player takes index 2
// playerTakesIndex5First #2: Player takes index 1
// playerTakesIndex5First #3: Player takes index 0
// playerTakesIndex5First #4: Player takes index 3
// playerTakesIndex5First #5: Player takes index 6
// playerTakesIndexFirst #6: Player takes index 7
// playerTakesIndex5First #7: Player takes index 8

func playerTakesIndex5First(moves: inout [Move?], turn: Bool, computerPiece: String, playerPiece: String) -> Bool {
    if moves[5]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[1]?.indicator == playerPiece &&         moves[0] == nil && moves[2] == nil && moves[3] == nil &&
        moves[6] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex6First #2
        makeMove(moves: &moves, availableIndices: [0, 2, 8], turn: turn)
        return true
    }
    else if moves[5]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[0]?.indicator == playerPiece &&         moves[1] == nil && moves[2] == nil && moves[3] == nil &&
        moves[6] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex6First #3
        makeMove(moves: &moves, availableIndices: [2, 7, 8], turn: turn)
        return true
    }
    else if moves[5]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[3]?.indicator == playerPiece &&         moves[0] == nil && moves[1] == nil && moves[2] == nil &&
        moves[6] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex6First #4
        makeMove(moves: &moves, availableIndices: [0, 2, 6, 8], turn: turn)
        return true
    }
    else if moves[5]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[6]?.indicator == playerPiece &&         moves[0] == nil && moves[1] == nil && moves[2] == nil &&
        moves[3] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex6First #6
        makeMove(moves: &moves, availableIndices: [1, 2, 8], turn: turn)
        return true
    }
    else if moves[5]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[7]?.indicator == playerPiece &&         moves[0] == nil && moves[1] == nil && moves[2] == nil &&
        moves[3] == nil && moves[6] == nil && moves[8] == nil {  // playerTakesIndex6First #7
        makeMove(moves: &moves, availableIndices: [2, 6, 8], turn: turn)
        return true
    }
    return false
}

// playerTakesIndex1First: player takes index 1, AI takes index 4
// playerTakesIndex1First #1: Player takes index 0 (random AI moves will draw)
// playerTakesIndex1First #3: Player takes index 2 (random AI moves will draw)
// playerTakesIndex1First #2: Player takes index 3
// playerTakesIndex1First #4: Player takes index 6
// playerTakesIndex1First #5: Player takes index 7
// playerTakesIndex1First #6: Player takes index 8
// playerTakesIndex1First #7: Player takes index 5

func playerTakesIndex1First(moves: inout [Move?], turn: Bool, computerPiece: String, playerPiece: String) -> Bool {
    if moves[1]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[3]?.indicator == playerPiece &&         moves[0] == nil && moves[2] == nil && moves[5] == nil &&
        moves[6] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex6First #2
        makeMove(moves: &moves, availableIndices: [0, 2, 6], turn: turn)
        return true
    }
    else if moves[1]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[6]?.indicator == playerPiece &&         moves[0] == nil && moves[2] == nil && moves[3] == nil &&
        moves[5] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex6First #3
        makeMove(moves: &moves, availableIndices: [0, 2, 5], turn: turn)
        return true
    }
    else if moves[1]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[7]?.indicator == playerPiece &&         moves[0] == nil && moves[2] == nil && moves[3] == nil &&
        moves[5] == nil && moves[6] == nil && moves[8] == nil {  // playerTakesIndex6First #4
        makeMove(moves: &moves, availableIndices: [0, 2, 6, 8], turn: turn)
        return true
    }
    else if moves[1]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[8]?.indicator == playerPiece &&         moves[0] == nil && moves[2] == nil && moves[3] == nil &&
        moves[5] == nil && moves[6] == nil && moves[7] == nil {  // playerTakesIndex6First #6
        makeMove(moves: &moves, availableIndices: [0, 2, 3], turn: turn)
        return true
    }
    else if moves[1]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[5]?.indicator == playerPiece &&         moves[0] == nil && moves[2] == nil && moves[3] == nil &&
        moves[6] == nil && moves[7] == nil && moves[8] == nil {  // playerTakesIndex6First #7
        makeMove(moves: &moves, availableIndices: [0, 2, 8], turn: turn)
        return true
    }
    return false
}

// playerTakesIndex7First: player takes index 7, AI takes index 4
// playerTakesIndex7First #1: Player takes index 6 (random AI moves will draw)
// playerTakesIndex7First #2: Player takes index 8 (random AI moves will draw)
// playerTakesIndex7First #3: Player takes index 3
// playerTakesIndex7First #4: Player takes index 0
// playerTakesIndex7First #5: Player takes index 1
// playerTakesIndex7First #6: Player takes index 2
// playerTakesIndex7First #7: Player takes index 5

func playerTakesIndex7First(moves: inout [Move?], turn: Bool, computerPiece: String, playerPiece: String) -> Bool {
    if moves[7]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[3]?.indicator == playerPiece &&         moves[0] == nil && moves[1] == nil && moves[2] == nil &&
        moves[5] == nil && moves[6] == nil && moves[8] == nil {  // playerTakesIndex6First #3
        makeMove(moves: &moves, availableIndices: [0, 6, 8], turn: turn)
        return true
    }
    else if moves[7]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[0]?.indicator == playerPiece &&         moves[1] == nil && moves[2] == nil && moves[3] == nil &&
        moves[5] == nil && moves[6] == nil && moves[8] == nil {  // playerTakesIndex6First #4
        makeMove(moves: &moves, availableIndices: [5, 6, 8], turn: turn)
        return true
    }
    else if moves[7]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[1]?.indicator == playerPiece &&         moves[0] == nil && moves[2] == nil && moves[3] == nil &&
        moves[5] == nil && moves[6] == nil && moves[8] == nil {  // playerTakesIndex6First #5
        makeMove(moves: &moves, availableIndices: [0, 2, 6, 8], turn: turn)
        return true
    }
    else if moves[7]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[2]?.indicator == playerPiece &&         moves[0] == nil && moves[1] == nil && moves[3] == nil &&
        moves[5] == nil && moves[6] == nil && moves[8] == nil {  // playerTakesIndex6First #6
        makeMove(moves: &moves, availableIndices: [3, 6, 8], turn: turn)
        return true
    }
    else if moves[7]?.indicator == playerPiece && moves[4]?.indicator == computerPiece && moves[5]?.indicator == playerPiece &&         moves[0] == nil && moves[1] == nil && moves[2] == nil &&
        moves[3] == nil && moves[6] == nil && moves[8] == nil {  // playerTakesIndex6First #7
        makeMove(moves: &moves, availableIndices: [2,6,8], turn: turn)
        return true
    }
    return false
}

func makeMove(moves: inout [Move?], availableIndices: [Int], turn: Bool) {
    let computerPosition = Int.random(in: 0..<availableIndices.count)
    moves[availableIndices[computerPosition]] = Move(player: !turn ? .human : .computer, boardIndex: availableIndices[computerPosition])
}
